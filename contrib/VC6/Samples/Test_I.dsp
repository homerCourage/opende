# Microsoft Developer Studio Project File - Name="Test_I" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Application" 0x0101

CFG=Test_I - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "Test_I.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "Test_I.mak" CFG="Test_I - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "Test_I - Win32 Release" (based on "Win32 (x86) Application")
!MESSAGE "Test_I - Win32 Debug" (based on "Win32 (x86) Application")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "Test_I - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "Test_I_Release"
# PROP Intermediate_Dir "Test_I_Release\Int"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD CPP /nologo /MT /W1 /GX /O2 /I "..\..\include" /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "NDEBUG"
# ADD RSC /l 0x409 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /machine:I386
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib opengl32.lib glu32.lib /nologo /subsystem:windows /machine:I386
# Begin Special Build Tool
TargetPath=.\Test_I_Release\Test_I.exe
SOURCE="$(InputPath)"
PostBuild_Desc=- Copying .exe to test dir -
PostBuild_Cmds=copy  $(TargetPath)  ..\..\..\test\ 
# End Special Build Tool

!ELSEIF  "$(CFG)" == "Test_I - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "Test_I_Debug"
# PROP Intermediate_Dir "Test_I_Debug\Int"
# PROP Ignore_Export_Lib 0
# ADD BASE CPP /nologo /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /YX /FD /GZ /c
# ADD CPP /nologo /MTd /W1 /Gm /GX /ZI /Od /I "..\..\include" /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /FR /YX /FD /GZ /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x409 /d "_DEBUG"
# ADD RSC /l 0x409 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# ADD LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib opengl32.lib glu32.lib /nologo /subsystem:windows /debug /machine:I386 /pdbtype:sept
# Begin Special Build Tool
TargetPath=.\Test_I_Debug\Test_I.exe
SOURCE="$(InputPath)"
PostBuild_Desc=- Copying .exe to test dir -
PostBuild_Cmds=copy  $(TargetPath)  ..\..\..\test\ 
# End Special Build Tool

!ENDIF 

# Begin Target

# Name "Test_I - Win32 Release"
# Name "Test_I - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\..\..\..\ode\test\test_I.cpp
# End Source File
# End Group
# Begin Group "Header Files"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\..\..\drawstuff\src\resource.h
# End Source File
# End Group
# Begin Group "Resource Files"

# PROP Default_Filter "ico;cur;bmp;dlg;rc2;rct;bin;rgs;gif;jpg;jpeg;jpe"
# Begin Source File

SOURCE=..\..\..\..\drawstuff\src\resources.rc
# End Source File
# End Group
# Begin Group "DrawStuff headers"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\..\..\include\drawstuff\drawstuff.h
# End Source File
# End Group
# Begin Group "Ode headers"

# PROP Default_Filter ""
# Begin Source File

SOURCE=..\..\..\..\include\ode\collision.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\collision_space.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\common.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\config.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\contact.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\mass.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\matrix.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\misc.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\objects.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\ode.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\odecpp.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\odecpp_collision.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\odemath.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\rotation.h
# End Source File
# Begin Source File

SOURCE=..\..\..\..\include\ode\timer.h
# End Source File
# End Group
# End Target
# End Project
