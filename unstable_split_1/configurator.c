/*************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001,2002 Russell L. Smith.       *
 * All rights reserved.  Email: russ@q12.org   Web: www.q12.org          *
 *                                                                       *
 * This library is free software; you can redistribute it and/or         *
 * modify it under the terms of EITHER:                                  *
 *   (1) The GNU Lesser General Public License as published by the Free  *
 *       Software Foundation; either version 2.1 of the License, or (at  *
 *       your option) any later version. The text of the GNU Lesser      *
 *       General Public License is included with this library in the     *
 *       file LICENSE.TXT.                                               *
 *   (2) The BSD-style license that is included with this library in     *
 *       the file LICENSE-BSD.TXT.                                       *
 *                                                                       *
 * This library is distributed in the hope that it will be useful,       *
 * but WITHOUT ANY WARRANTY; without even the implied warranty of        *
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the files    *
 * LICENSE.TXT and LICENSE-BSD.TXT for more details.                     *
 *                                                                       *
 *************************************************************************/

/*

this program discovers some system configuration stuff, prior to compiling
ODE. the usage is:

  configurator <config.h-file-to-generate> <compiler-command-line> <THIS_DIR-variable>

this program looks long, but it really has an extremely simple structure and
should be very easy for anyone to modify. it should be very portable as it
is written in straight ANSI C and only uses the following library functions:
  * printf
  * fopen (assumes 0 returned on failure)
  * fclose
  * fprintf
  * system
  * exit
  * unlink
except where stated, we do not assume anything about the return codes from
these functions.

why didn't i just use GNU autoconf? :
  * autoconf needs a bourne shell and a bunch of other tools that windows
    users may not have.
  * i like reinventing the wheel.

*/

/****************************************************************************/
/* include some system header files. <stdio.h> and <stdlib.h> are probably
 * safe on all systems, but <unistd.h> may not be, so we make explicit
 * prototypes for the other functions we need.
 */

#include <stdio.h>
#include <stdlib.h>

#ifndef unlink
#ifdef __cplusplus
extern "C" {
#endif
int unlink (const char *pathname);
#ifdef __cplusplus
}
#endif
#endif

/****************************************************************************/
/* project constants */

/* the config.h header */
char *config_h_part1 =
"/* per-machine configuration. this file is automatically generated. */\n"
"\n"
"#ifndef _ODE_CONFIG_H_\n"
"#define _ODE_CONFIG_H_\n"
"\n"
"/* standard system headers */\n";


char *config_h_part2 =
"\n"
"#ifdef __cplusplus\n"
"extern \"C\" {\n"
"#endif\n"
"\n";

/* the config.h footer */
char *config_h_footer =
"\n"
"#ifdef __cplusplus\n"
"}\n"
"#endif\n"
"#endif\n";

/****************************************************************************/
/* implementations of some string functions. these are prefixed with 'x'
 * to prevent any conflicts with built-in functions.
 */

#define strcpy xstrcpy
void xstrcpy (char *dest, char *src)
{
  while (*src) *dest++ = *src++;
  *dest = 0;
}


#define strcat xstrcat
void xstrcat (char *dest, char *src)
{
  while (*dest) dest++;
  while (*src) *dest++ = *src++;
  *dest = 0;
}

/****************************************************************************/
/* utility functions */

/* print an error message and exit */

void fatal_error (char *message)
{
  printf ("\n*** configurator failed: %s.\n\n"
	  "please fix your configuration and try again.\n"
	  "if you have to fix the configurator program or the makefiles, "
	  "please email\n"
	  "your changes to the ODE mailing list (ode@q12.org).\n\n", message);
  exit (0);
}


/* open a file, generate an error if it can't be done */

FILE * xfopen (char *filename, char *mode)
{
  FILE *f;
  f = fopen (filename,mode);
  if (!f) fatal_error ("can not open a file");
  return f;
}


/* return 1 if the file exists or 0 if not */

int file_exists (char *filename)
{
  FILE *f;
  f = fopen (filename,"rb");
  if (f) fclose (f);
  return (f != 0);
}


/* write a string to a new file */

void write_to_file (char *filename, char *s)
{
  FILE *f = xfopen (filename,"wt");
  fprintf (f,"%s",s);
  fclose (f);
}


/* write a comment to a header file */

void write_header_comment (FILE *file, char *description)
{
  fprintf (file,"/* %s */\n",description);
  printf ("%s ...\n",description);
}


/* delete a file */

void delete_file (char *filename)
{
  unlink (filename);
  if (file_exists (filename)) {
    fatal_error ("the delete_file() function does not work");
  }
}


/* run a compile command */

char *compile_cmd_line = 0;
void compile (char *output, char *input)
{
  char cmd[1000];
  strcpy (cmd,compile_cmd_line);
  strcat (cmd,output);
  strcat (cmd," ");
  strcat (cmd,input);
  printf ("%s\n",cmd);
  if (system (cmd) == -1) {
    printf ("WARNING: may not be able to execute '%s'\n",cmd);
  }
}


/* run a program we've just compiled */

char *run_prefix = "";
void run (char *filename)
{
  char cmd[1000];
  strcpy (cmd,run_prefix);
  strcat (cmd,filename);
  printf ("%s\n",cmd);
  if (system (cmd) == -1) {
    printf ("WARNING: may not be able to execute '%s'\n",cmd);
  }
}

/****************************************************************************/
/* system tests */

void check_if_this_is_a_pentium (FILE *file)
{
  write_header_comment (file,"is this a pentium on a gcc-based platform?");
  write_to_file ("ctest.cpp",
		 "int main() {\n"
		 "  asm (\"mov $0,%%eax\\n cpuid\\n\" : : : \"%eax\");\n"
		 "  return 0;\n"
		 "}\n");
  delete_file ("ctest.exe");
  compile ("ctest.exe","ctest.cpp");
  if (file_exists ("ctest.exe")) {
    fprintf (file,"#define PENTIUM 1\n\n");
  }
  else {
    fprintf (file,"/* #define PENTIUM 1 -- not a pentium */\n\n");
  }

  delete_file ("ctest.cpp");
  delete_file ("ctest.exe");
}

/****************************************************************************/
/* tests: standard headers */

#define NUM_HEADERS 10
char *header_files[NUM_HEADERS] = {
  "stdio.h", "stdlib.h", "math.h", "string.h",
  "stdarg.h", "malloc.h", "alloca.h",
  "values.h",		// for DBL_MAX and FLT_MAX on some platforms
  "float.h",		// for DBL_MAX and FLT_MAX on some platforms
  "ieeefp.h"		// Solaris needs this apparently
};
int header_used[NUM_HEADERS];


void get_all_standard_headers (FILE *file)
{
  int i;

  for (i=0; i < NUM_HEADERS; i++) {
    FILE *f = xfopen ("ctest.cpp","wt");
    fprintf (f,"#include <%s>\nint main() { return 0; }\n",header_files[i]);
    fclose (f);
    delete_file ("ctest.exe");
    compile ("ctest.exe","ctest.cpp");
    if (file_exists ("ctest.exe")) {
      fprintf (file,"#include <%s>\n",header_files[i]);
      header_used[i] = 1;
    }
    else {
      header_used[i] = 0;
    }
  }

  delete_file ("ctest.cpp");
  delete_file ("ctest.exe");
}

/****************************************************************************/
/* tests: see if alloca() is defined, if not try __builtin_alloca.
 * this assumes that get_all_standard_headers() has been called.
 */

#define NUM_ALLOCA 2
char *alloca_function[NUM_ALLOCA] = {"alloca","__builtin_alloca"};
 
 
void get_alloca_usage (FILE *file)
{
  int i,j;
  for (i=0; i<NUM_ALLOCA; i++) {
    FILE *f = xfopen ("ctest.cpp","wt");
    for (j=0; j < NUM_HEADERS; j++) {
      if (header_used[j]) fprintf (f,"#include <%s>\n",header_files[j]);
    }
    fprintf (f,"int main() { void *foo = %s (10); }\n",alloca_function[i]);
    fclose (f);
    delete_file ("ctest.exe");
    compile ("ctest.exe","ctest.cpp");
    if (file_exists ("ctest.exe")) {
      if (i > 0) {
	write_header_comment (file,"how to use alloca()");
	fprintf (file,"#define alloca %s\n\n",alloca_function[i]);
      }
      break;
    }
  }
  delete_file ("ctest.cpp");
  delete_file ("ctest.exe");
  if (i == NUM_ALLOCA) fatal_error ("i can't find a way to use alloca()");
}

/****************************************************************************/
/* tests: typedefs and constants for ODE */

void get_ODE_integer_typedefs (FILE *file)
{
  write_header_comment (file,"integer types (we assume int >= 32 bits)");
  if (sizeof(char) != 1) fatal_error ("expecting sizeof(char) == 1");
  if (sizeof(int) < 4) fatal_error ("expecting sizeof(int) >= 4");
  fprintf (file,"typedef char int8;\ntypedef unsigned char uint8;\n");

  if (sizeof(short) == 2) {
    fprintf (file,"typedef short int16;\ntypedef unsigned short uint16;\n");
  }
  else {
    fatal_error ("can not find 2 byte integer type");
  }

  if (sizeof(short) == 4) {
    fprintf (file,"typedef short int32;\ntypedef unsigned short uint32;\n");
  }
  else if (sizeof(int) == 4) {
    fprintf (file,"typedef int int32;\ntypedef unsigned int uint32;\n");
  }
  else {
    fatal_error ("can not find 4 byte integer type");
  }

  fprintf (file,"\n"
	   "/* an integer type that we can safely cast a pointer to and\n"
	   " * from without loss of bits.\n"
	   " */\n");
  if (sizeof(short) == sizeof(void*)) {
    fprintf (file,"typedef unsigned short intP;\n");
  }
  else if (sizeof(int) == sizeof(void*)) {
    fprintf (file,"typedef unsigned int intP;\n");
  }
  else if (sizeof(long int) == sizeof(void*)) {
    fprintf (file,"typedef unsigned long int intP;\n");
  }

  fprintf (file,"\n");
}


void get_ODE_float_stuff (FILE *file)
{
  char *suffix;
  int i,j;
  FILE *f;

  #define INFINITIES_TO_TEST 4
#ifdef dSINGLE
  char *decl[INFINITIES_TO_TEST] = {
    "#define dInfinity FLT_MAX",
    "#define dInfinity HUGE_VALF",
    "#define dInfinity 3.402823466e+38F",
    "#define dInfinity 1e20f"};
#else
  char *decl[INFINITIES_TO_TEST] = {
    "#define dInfinity DBL_MAX",
    "#define dInfinity HUGE_VAL",
    "#define dInfinity 1.7976931348623157e+308",
    "#define dInfinity 1e20"};
#endif

  write_header_comment (file,"select the base floating point type");
#ifdef dSINGLE
  fprintf (file,"#define dSINGLE 1\n\n");
  suffix = "f";
#else
  fprintf (file,"#define dDOUBLE 1\n\n");
  suffix = "";
#endif

  /* infinity */
  write_header_comment (file,"the floating point infinity");

  /* try the different infinity constants until one works */
  for (i=0; i < INFINITIES_TO_TEST; i++) {
    f = xfopen ("ctest.cpp","wt");
    for (j=0; j < NUM_HEADERS; j++) {
      if (header_used[j]) fprintf (f,"#include <%s>\n",header_files[j]);
    }
    fprintf (f,
	     "%s\n"
	     "int main() {\n"
	     "	if (dInfinity > 1e10%s && -dInfinity < -1e10%s &&\n"
	     "	    -dInfinity < dInfinity) {\n"
	     "	  FILE *f = fopen (\"data\",\"wt\");\n"
	     "	  fprintf (f,\"foo\\n\");\n"
	     "	  fclose (f);\n"
	     "	}\n"
	     "	return 0;\n"
	     "}\n"
	     ,decl[i],suffix,suffix);
    fclose (f);
    delete_file ("data");
    compile ("ctest.exe","ctest.cpp");
    run ("ctest.exe");
    if (file_exists ("data")) {
      fprintf (file,"%s\n\n",decl[i]);
      delete_file ("ctest.cpp");
      delete_file ("ctest.exe");
      delete_file ("data");
      return;
    }
  }

  fatal_error ("can't determine dInfinity constant");
}

/****************************************************************************/
/* configuration of ODE features */

void get_ODE_features (FILE *file)
{
  /* nothing to do here... */
  /* write_header_comment (file,"ODE feature configuration"); */
}

/****************************************************************************
 * figure out what functions are available in the system
 */

#define FUNCTIONS_TO_TEST 10

void get_available_functions (FILE *file)
{
	int i,j;
	char *fnames[FUNCTIONS_TO_TEST*3] = {
		/* statement to compile,	if it works,	if not */
		"sqrtf(1.0f);",			0,		"#define sqrtf sqrt",
		"sinf(1.0f);",			0,		"#define sinf sin",
		"cosf(1.0f);",			0,		"#define cosf cos",
		"fabsf(1.0f);",			0,		"#define fabsf fabs",
		"atan2f(1.0f,1.0f);",		0,		"#define atan2f atan2",
		"fmodf(1.0f,1.0f);",		0,		"#define fmodf fmod",
		"copysignf(1.0f,1.0f);",	0,		"#define copysignf copysign",
		/* to handle cygwin: */
		"copysign(1.0,1.0);",		0,		"#define copysign _copysign",
		"snprintf(\"\",0,\"\");",	0,		"#define snprintf _snprintf",
		"vsnprintf(\"\",0,\"\",0);",	0,		"#define vsnprintf _vsnprintf"
	};

	write_header_comment (file,"available functions");

	for (i=0; i < FUNCTIONS_TO_TEST; i++) {
		FILE *f = xfopen ("ctest.cpp","wt");
		for (j=0; j < NUM_HEADERS; j++) {
			if (header_used[j]) fprintf (f,"#include <%s>\n",header_files[j]);
		}
		fprintf (f,"int main() { %s return 0; }\n",fnames[i*3]);
		fclose (f);
		delete_file ("ctest.exe");
		compile ("ctest.exe","ctest.cpp");
		if (file_exists ("ctest.exe")) {
			if (fnames[i*3+1]) fprintf (file,"%s\n",fnames[i*3+1]);
		}
		else {
			if (fnames[i*3+2]) fprintf (file,"%s\n",fnames[i*3+2]);
		}
		delete_file ("ctest.cpp");
		delete_file ("ctest.exe");
	}
}

/****************************************************************************
 * main
 */

int main (int argc, char **argv)
{
  FILE *file;

  if (argc < 3 || argc > 4)
    fatal_error ("configurator expects 2 or 3 arguments");
  compile_cmd_line = argv[2];
  if (argc >= 4) run_prefix = argv[3];

  printf ("\n*** configurator starting, you may see some harmless error messages ***\n\n");

  /* check some defines we should have been compiled with */
#if !defined(dSINGLE) && !defined(dDOUBLE)
#error you must set the dSINGLE or dDOUBLE macro
  fatal_error ("you must set PRECISION to either SINGLE or DOUBLE");
#endif

  file = xfopen (argv[1],"wt");
  fprintf (file,config_h_part1);
  get_all_standard_headers (file);
  fprintf (file,config_h_part2);
  get_alloca_usage (file);
  check_if_this_is_a_pentium (file);
  get_ODE_integer_typedefs (file);
  get_ODE_float_stuff (file);
  get_ODE_features (file);
  get_available_functions (file);
  fprintf (file,config_h_footer);
  fclose (file);

  printf ("\n*** configurator succeeded ***\n\n");
  return 0;
}
