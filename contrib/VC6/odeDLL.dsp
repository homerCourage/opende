# Microsoft Developer Studio Project File - Name="odeDLL" - Package Owner=<4>
# Microsoft Developer Studio Generated Build File, Format Version 6.00
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

CFG=odeDLL - Win32 Debug
!MESSAGE This is not a valid makefile. To build this project using NMAKE,
!MESSAGE use the Export Makefile command and run
!MESSAGE 
!MESSAGE NMAKE /f "odeDLL.mak".
!MESSAGE 
!MESSAGE You can specify a configuration when running NMAKE
!MESSAGE by defining the macro CFG on the command line. For example:
!MESSAGE 
!MESSAGE NMAKE /f "odeDLL.mak" CFG="odeDLL - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "odeDLL - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "odeDLL - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 

# Begin Project
# PROP AllowPerConfigDependencies 0
# PROP Scc_ProjName ""
# PROP Scc_LocalPath ""
CPP=cl.exe
MTL=midl.exe
RSC=rc.exe

!IF  "$(CFG)" == "odeDLL - Win32 Release"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "odeDLL___Win32_Release"
# PROP BASE Intermediate_Dir "odeDLL___Win32_Release"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "DLL_Release"
# PROP Intermediate_Dir "DLL_Release"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MT /W3 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ODEDLL_EXPORTS" /Yu"stdafx.h" /FD /c
# ADD CPP /nologo /MT /W2 /GX /O2 /D "WIN32" /D "NDEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ODEDLL_EXPORTS" /YX /FD /c
# ADD BASE MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "NDEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x809 /d "NDEBUG"
# ADD RSC /l 0x809 /d "NDEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386
# ADD LINK32 opcode.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /machine:I386 /out:"..\..\..\lib\ode.dll"

!ELSEIF  "$(CFG)" == "odeDLL - Win32 Debug"

# PROP BASE Use_MFC 0
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "odeDLL___Win32_Debug"
# PROP BASE Intermediate_Dir "odeDLL___Win32_Debug"
# PROP BASE Target_Dir ""
# PROP Use_MFC 0
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "DLL_Debug"
# PROP Intermediate_Dir "DLL_Debug"
# PROP Ignore_Export_Lib 0
# PROP Target_Dir ""
# ADD BASE CPP /nologo /MTd /W3 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ODEDLL_EXPORTS" /Yu"stdafx.h" /FD /GZ  /c
# ADD CPP /nologo /MTd /W2 /Gm /GX /ZI /Od /D "WIN32" /D "_DEBUG" /D "_WINDOWS" /D "_MBCS" /D "_USRDLL" /D "ODEDLL_EXPORTS" /YX /FD /GZ  /c
# ADD BASE MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD MTL /nologo /D "_DEBUG" /mktyplib203 /win32
# ADD BASE RSC /l 0x809 /d "_DEBUG"
# ADD RSC /l 0x809 /d "_DEBUG"
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
LINK32=link.exe
# ADD BASE LINK32 kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /pdbtype:sept
# ADD LINK32 opcode_d.lib kernel32.lib user32.lib gdi32.lib winspool.lib comdlg32.lib advapi32.lib shell32.lib ole32.lib oleaut32.lib uuid.lib odbc32.lib odbccp32.lib /nologo /dll /debug /machine:I386 /out:"..\..\..\lib\oded.dll" /pdbtype:sept

!ENDIF 

# Begin Target

# Name "odeDLL - Win32 Release"
# Name "odeDLL - Win32 Debug"
# Begin Group "Source Files"

# PROP Default_Filter "cpp;c;cxx;rc;def;r;odl;idl;hpj;bat"
# Begin Source File

SOURCE=..\array.cpp
# End Source File
# Begin Source File

SOURCE=..\array.h
# End Source File
# Begin Source File

SOURCE=..\collision_kernel.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_kernel.h
# End Source File
# Begin Source File

SOURCE=..\collision_quadtreespace.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_space.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_space_internal.h
# End Source File
# Begin Source File

SOURCE=..\collision_std.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_std.h
# End Source File
# Begin Source File

SOURCE=..\collision_transform.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_transform.h
# End Source File
# Begin Source File

SOURCE=..\collision_trimesh.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_trimesh_box.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_trimesh_internal.h
# End Source File
# Begin Source File

SOURCE=..\collision_trimesh_ray.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_trimesh_sphere.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_util.cpp
# End Source File
# Begin Source File

SOURCE=..\collision_util.h
# End Source File
# Begin Source File

SOURCE=..\error.cpp
# End Source File
# Begin Source File

SOURCE=..\fastdot.c
# End Source File
# Begin Source File

SOURCE=..\fastldlt.c
# End Source File
# Begin Source File

SOURCE=..\fastlsolve.c
# End Source File
# Begin Source File

SOURCE=..\fastltsolve.c
# End Source File
# Begin Source File

SOURCE=..\joint.cpp
# End Source File
# Begin Source File

SOURCE=..\joint.h
# End Source File
# Begin Source File

SOURCE=..\lcp.cpp
# End Source File
# Begin Source File

SOURCE=..\lcp.h
# End Source File
# Begin Source File

SOURCE=..\mass.cpp
# End Source File
# Begin Source File

SOURCE=..\mat.cpp
# End Source File
# Begin Source File

SOURCE=..\mat.h
# End Source File
# Begin Source File

SOURCE=..\matrix.cpp
# End Source File
# Begin Source File

SOURCE=..\memory.cpp
# End Source File
# Begin Source File

SOURCE=..\misc.cpp
# End Source File
# Begin Source File

SOURCE=..\objects.h
# End Source File
# Begin Source File

SOURCE=..\obstack.cpp
# End Source File
# Begin Source File

SOURCE=..\obstack.h
# End Source File
# Begin Source File

SOURCE=..\ode.cpp
# End Source File
# Begin Source File

SOURCE=..\odemath.cpp
# End Source File
# Begin Source File

SOURCE=..\rotation.cpp
# End Source File
# Begin Source File

SOURCE=..\step.cpp
# End Source File
# Begin Source File

SOURCE=..\step.h
# End Source File
# Begin Source File

SOURCE=..\stepfast.cpp
# End Source File
# Begin Source File

SOURCE=..\testing.cpp
# End Source File
# Begin Source File

SOURCE=..\testing.h
# End Source File
# Begin Source File

SOURCE=..\timer.cpp
# End Source File
# End Group
# Begin Source File

SOURCE=.\odeDLL.cpp
# End Source File
# End Target
# End Project
