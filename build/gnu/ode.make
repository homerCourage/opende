# C++ Console Executable Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=DebugDLL
endif

ifeq ($(CONFIG),DebugDLL)
  BINDIR := ../../lib/DebugDLL
  LIBDIR := ../../lib/DebugDLL
  OBJDIR := obj/ode/DebugDLL
  OUTDIR := ../../lib/DebugDLL
  CPPFLAGS := -MMD -D "WIN32" -D "ODE_DLL" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -shared -luser32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "ODE_DLL" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  TARGET := ode.dll
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),ReleaseDLL)
  BINDIR := ../../lib/ReleaseDLL
  LIBDIR := ../../lib/ReleaseDLL
  OBJDIR := obj/ode/ReleaseDLL
  OUTDIR := ../../lib/ReleaseDLL
  CPPFLAGS := -MMD -D "WIN32" -D "ODE_DLL" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -O3 -fomit-frame-pointer
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -shared -s -luser32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "ODE_DLL" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  TARGET := ode.dll
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),DebugLib)
  BINDIR := ../../lib/DebugLib
  LIBDIR := ../../lib/DebugLib
  OBJDIR := obj/ode/DebugLib
  OUTDIR := ../../lib/DebugLib
  CPPFLAGS := -MMD -D "WIN32" -D "ODE_LIB" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -luser32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "ODE_LIB" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  TARGET := libode.a
  BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),ReleaseLib)
  BINDIR := ../../lib/ReleaseLib
  LIBDIR := ../../lib/ReleaseLib
  OBJDIR := obj/ode/ReleaseLib
  OUTDIR := ../../lib/ReleaseLib
  CPPFLAGS := -MMD -D "WIN32" -D "ODE_LIB" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -O3 -fomit-frame-pointer
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -s -luser32
  LDDEPS :=
  RESFLAGS := -D "WIN32" -D "ODE_LIB" -I "../../include" -I "../../OPCODE" -I "../../GIMPACT/include" -I "../../Bullet/src"
  TARGET := libode.a
  BLDCMD = ar -rcs $(OUTDIR)/$(TARGET) $(OBJECTS) $(TARGET_ARCH)
endif

OBJECTS := \
	$(OBJDIR)/fastdot.o \
	$(OBJDIR)/fastldlt.o \
	$(OBJDIR)/fastlsolve.o \
	$(OBJDIR)/fastltsolve.o \
	$(OBJDIR)/array.o \
	$(OBJDIR)/box.o \
	$(OBJDIR)/capsule.o \
	$(OBJDIR)/collision_cylinder_box.o \
	$(OBJDIR)/collision_cylinder_plane.o \
	$(OBJDIR)/collision_cylinder_sphere.o \
	$(OBJDIR)/collision_cylinder_trimesh.o \
	$(OBJDIR)/collision_kernel.o \
	$(OBJDIR)/collision_quadtreespace.o \
	$(OBJDIR)/collision_space.o \
	$(OBJDIR)/collision_transform.o \
	$(OBJDIR)/collision_trimesh_box.o \
	$(OBJDIR)/collision_trimesh_ccylinder.o \
	$(OBJDIR)/collision_trimesh_distance.o \
	$(OBJDIR)/collision_trimesh_gimpact.o \
	$(OBJDIR)/collision_trimesh_opcode.o \
	$(OBJDIR)/collision_trimesh_plane.o \
	$(OBJDIR)/collision_trimesh_ray.o \
	$(OBJDIR)/collision_trimesh_sphere.o \
	$(OBJDIR)/collision_trimesh_trimesh.o \
	$(OBJDIR)/collision_util.o \
	$(OBJDIR)/convex.o \
	$(OBJDIR)/cylinder.o \
	$(OBJDIR)/error.o \
	$(OBJDIR)/export-dif.o \
	$(OBJDIR)/heightfield.o \
	$(OBJDIR)/joint.o \
	$(OBJDIR)/lcp.o \
	$(OBJDIR)/mass.o \
	$(OBJDIR)/mat.o \
	$(OBJDIR)/matrix.o \
	$(OBJDIR)/memory.o \
	$(OBJDIR)/misc.o \
	$(OBJDIR)/obstack.o \
	$(OBJDIR)/ode.o \
	$(OBJDIR)/odemath.o \
	$(OBJDIR)/plane.o \
	$(OBJDIR)/quickstep.o \
	$(OBJDIR)/ray.o \
	$(OBJDIR)/rotation.o \
	$(OBJDIR)/sphere.o \
	$(OBJDIR)/step.o \
	$(OBJDIR)/stepfast.o \
	$(OBJDIR)/testing.o \
	$(OBJDIR)/timer.o \
	$(OBJDIR)/util.o \
	$(OBJDIR)/btAxisSweep3.o \
	$(OBJDIR)/btBroadphaseProxy.o \
	$(OBJDIR)/btCollisionAlgorithm.o \
	$(OBJDIR)/btDispatcher.o \
	$(OBJDIR)/btOverlappingPairCache.o \
	$(OBJDIR)/btSimpleBroadphase.o \
	$(OBJDIR)/btCollisionDispatcher.o \
	$(OBJDIR)/btCollisionObject.o \
	$(OBJDIR)/btCollisionWorld.o \
	$(OBJDIR)/btCompoundCollisionAlgorithm.o \
	$(OBJDIR)/btConvexConcaveCollisionAlgorithm.o \
	$(OBJDIR)/btConvexConvexAlgorithm.o \
	$(OBJDIR)/btEmptyCollisionAlgorithm.o \
	$(OBJDIR)/btManifoldResult.o \
	$(OBJDIR)/btSimulationIslandManager.o \
	$(OBJDIR)/btSphereBoxCollisionAlgorithm.o \
	$(OBJDIR)/btSphereSphereCollisionAlgorithm.o \
	$(OBJDIR)/btSphereTriangleCollisionAlgorithm.o \
	$(OBJDIR)/btUnionFind.o \
	$(OBJDIR)/SphereTriangleDetector.o \
	$(OBJDIR)/btBoxShape.o \
	$(OBJDIR)/btBvhTriangleMeshShape.o \
	$(OBJDIR)/btCapsuleShape.o \
	$(OBJDIR)/btCollisionShape.o \
	$(OBJDIR)/btCompoundShape.o \
	$(OBJDIR)/btConcaveShape.o \
	$(OBJDIR)/btConeShape.o \
	$(OBJDIR)/btConvexHullShape.o \
	$(OBJDIR)/btConvexShape.o \
	$(OBJDIR)/btConvexTriangleMeshShape.o \
	$(OBJDIR)/btCylinderShape.o \
	$(OBJDIR)/btEmptyShape.o \
	$(OBJDIR)/btHeightfieldTerrainShape.o \
	$(OBJDIR)/btMinkowskiSumShape.o \
	$(OBJDIR)/btMultiSphereShape.o \
	$(OBJDIR)/btOptimizedBvh.o \
	$(OBJDIR)/btPolyhedralConvexShape.o \
	$(OBJDIR)/btSphereShape.o \
	$(OBJDIR)/btStaticPlaneShape.o \
	$(OBJDIR)/btStridingMeshInterface.o \
	$(OBJDIR)/btTetrahedronShape.o \
	$(OBJDIR)/btTriangleBuffer.o \
	$(OBJDIR)/btTriangleCallback.o \
	$(OBJDIR)/btTriangleIndexVertexArray.o \
	$(OBJDIR)/btTriangleMesh.o \
	$(OBJDIR)/btTriangleMeshShape.o \
	$(OBJDIR)/btContinuousConvexCollision.o \
	$(OBJDIR)/btConvexCast.o \
	$(OBJDIR)/btGjkConvexCast.o \
	$(OBJDIR)/btGjkEpa.o \
	$(OBJDIR)/btGjkEpaPenetrationDepthSolver.o \
	$(OBJDIR)/btGjkPairDetector.o \
	$(OBJDIR)/btMinkowskiPenetrationDepthSolver.o \
	$(OBJDIR)/btPersistentManifold.o \
	$(OBJDIR)/btRaycastCallback.o \
	$(OBJDIR)/btSubSimplexConvexCast.o \
	$(OBJDIR)/btVoronoiSimplexSolver.o \
	$(OBJDIR)/btAlignedAllocator.o \
	$(OBJDIR)/btGeometryUtil.o \
	$(OBJDIR)/btQuickprof.o \
	$(OBJDIR)/gimpact.o \
	$(OBJDIR)/gim_boxpruning.o \
	$(OBJDIR)/gim_contact.o \
	$(OBJDIR)/gim_math.o \
	$(OBJDIR)/gim_memory.o \
	$(OBJDIR)/gim_trimesh.o \
	$(OBJDIR)/gim_trimesh_capsule_collision.o \
	$(OBJDIR)/gim_trimesh_ray_collision.o \
	$(OBJDIR)/gim_trimesh_sphere_collision.o \
	$(OBJDIR)/gim_trimesh_trimesh_collision.o \
	$(OBJDIR)/gim_tri_tri_overlap.o \
	$(OBJDIR)/Opcode.o \
	$(OBJDIR)/OPC_AABBCollider.o \
	$(OBJDIR)/OPC_AABBTree.o \
	$(OBJDIR)/OPC_BaseModel.o \
	$(OBJDIR)/OPC_BoxPruning.o \
	$(OBJDIR)/OPC_Collider.o \
	$(OBJDIR)/OPC_Common.o \
	$(OBJDIR)/OPC_HybridModel.o \
	$(OBJDIR)/OPC_LSSCollider.o \
	$(OBJDIR)/OPC_MeshInterface.o \
	$(OBJDIR)/OPC_Model.o \
	$(OBJDIR)/OPC_OBBCollider.o \
	$(OBJDIR)/OPC_OptimizedTree.o \
	$(OBJDIR)/OPC_Picking.o \
	$(OBJDIR)/OPC_PlanesCollider.o \
	$(OBJDIR)/OPC_RayCollider.o \
	$(OBJDIR)/OPC_SphereCollider.o \
	$(OBJDIR)/OPC_SweepAndPrune.o \
	$(OBJDIR)/OPC_TreeBuilders.o \
	$(OBJDIR)/OPC_TreeCollider.o \
	$(OBJDIR)/OPC_VolumeCollider.o \
	$(OBJDIR)/StdAfx.o \
	$(OBJDIR)/IceAABB.o \
	$(OBJDIR)/IceContainer.o \
	$(OBJDIR)/IceHPoint.o \
	$(OBJDIR)/IceIndexedTriangle.o \
	$(OBJDIR)/IceMatrix3x3.o \
	$(OBJDIR)/IceMatrix4x4.o \
	$(OBJDIR)/IceOBB.o \
	$(OBJDIR)/IcePlane.o \
	$(OBJDIR)/IcePoint.o \
	$(OBJDIR)/IceRandom.o \
	$(OBJDIR)/IceRay.o \
	$(OBJDIR)/IceRevisitedRadix.o \
	$(OBJDIR)/IceSegment.o \
	$(OBJDIR)/IceTriangle.o \
	$(OBJDIR)/IceUtils.o \

RESOURCES := \

MKDIR_TYPE := msdos
CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  MKDIR_TYPE := posix
endif
ifeq (/bin/sh.exe,$(SHELL))
  MKDIR_TYPE := posix
endif
ifeq ($(MKDIR_TYPE),posix)
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking ode
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning ode
ifeq ($(MKDIR_TYPE),posix)
	-@rm -rf $(OUTDIR)/$(TARGET) $(OBJDIR)
else
	-@if exist $(subst /,\,$(OUTDIR)/$(TARGET)) del /q $(subst /,\,$(OUTDIR)/$(TARGET))
	-@if exist $(subst /,\,$(OBJDIR)) del /q $(subst /,\,$(OBJDIR))
	-@if exist $(subst /,\,$(OBJDIR)) rmdir /s /q $(subst /,\,$(OBJDIR))
endif

$(OBJDIR)/fastdot.o: ../../ode/src/fastdot.c
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(OBJDIR)/fastldlt.o: ../../ode/src/fastldlt.c
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(OBJDIR)/fastlsolve.o: ../../ode/src/fastlsolve.c
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(OBJDIR)/fastltsolve.o: ../../ode/src/fastltsolve.c
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CC) $(CFLAGS) -o $@ -c $<

$(OBJDIR)/array.o: ../../ode/src/array.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/box.o: ../../ode/src/box.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/capsule.o: ../../ode/src/capsule.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_cylinder_box.o: ../../ode/src/collision_cylinder_box.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_cylinder_plane.o: ../../ode/src/collision_cylinder_plane.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_cylinder_sphere.o: ../../ode/src/collision_cylinder_sphere.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_cylinder_trimesh.o: ../../ode/src/collision_cylinder_trimesh.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_kernel.o: ../../ode/src/collision_kernel.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_quadtreespace.o: ../../ode/src/collision_quadtreespace.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_space.o: ../../ode/src/collision_space.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_transform.o: ../../ode/src/collision_transform.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_box.o: ../../ode/src/collision_trimesh_box.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_ccylinder.o: ../../ode/src/collision_trimesh_ccylinder.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_distance.o: ../../ode/src/collision_trimesh_distance.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_gimpact.o: ../../ode/src/collision_trimesh_gimpact.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_opcode.o: ../../ode/src/collision_trimesh_opcode.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_plane.o: ../../ode/src/collision_trimesh_plane.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_ray.o: ../../ode/src/collision_trimesh_ray.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_sphere.o: ../../ode/src/collision_trimesh_sphere.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_trimesh_trimesh.o: ../../ode/src/collision_trimesh_trimesh.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/collision_util.o: ../../ode/src/collision_util.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/convex.o: ../../ode/src/convex.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/cylinder.o: ../../ode/src/cylinder.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/error.o: ../../ode/src/error.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/export-dif.o: ../../ode/src/export-dif.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/heightfield.o: ../../ode/src/heightfield.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/joint.o: ../../ode/src/joint.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/lcp.o: ../../ode/src/lcp.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/mass.o: ../../ode/src/mass.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/mat.o: ../../ode/src/mat.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/matrix.o: ../../ode/src/matrix.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/memory.o: ../../ode/src/memory.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/misc.o: ../../ode/src/misc.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/obstack.o: ../../ode/src/obstack.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/ode.o: ../../ode/src/ode.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/odemath.o: ../../ode/src/odemath.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/plane.o: ../../ode/src/plane.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/quickstep.o: ../../ode/src/quickstep.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/ray.o: ../../ode/src/ray.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/rotation.o: ../../ode/src/rotation.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/sphere.o: ../../ode/src/sphere.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/step.o: ../../ode/src/step.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/stepfast.o: ../../ode/src/stepfast.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/testing.o: ../../ode/src/testing.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/timer.o: ../../ode/src/timer.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/util.o: ../../ode/src/util.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btAxisSweep3.o: ../../Bullet/src/BulletCollision/BroadphaseCollision/btAxisSweep3.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btBroadphaseProxy.o: ../../Bullet/src/BulletCollision/BroadphaseCollision/btBroadphaseProxy.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCollisionAlgorithm.o: ../../Bullet/src/BulletCollision/BroadphaseCollision/btCollisionAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btDispatcher.o: ../../Bullet/src/BulletCollision/BroadphaseCollision/btDispatcher.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btOverlappingPairCache.o: ../../Bullet/src/BulletCollision/BroadphaseCollision/btOverlappingPairCache.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btSimpleBroadphase.o: ../../Bullet/src/BulletCollision/BroadphaseCollision/btSimpleBroadphase.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCollisionDispatcher.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btCollisionDispatcher.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCollisionObject.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btCollisionObject.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCollisionWorld.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btCollisionWorld.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCompoundCollisionAlgorithm.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btCompoundCollisionAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConvexConcaveCollisionAlgorithm.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btConvexConcaveCollisionAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConvexConvexAlgorithm.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btConvexConvexAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btEmptyCollisionAlgorithm.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btEmptyCollisionAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btManifoldResult.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btManifoldResult.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btSimulationIslandManager.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btSimulationIslandManager.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btSphereBoxCollisionAlgorithm.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btSphereBoxCollisionAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btSphereSphereCollisionAlgorithm.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btSphereSphereCollisionAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btSphereTriangleCollisionAlgorithm.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btSphereTriangleCollisionAlgorithm.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btUnionFind.o: ../../Bullet/src/BulletCollision/CollisionDispatch/btUnionFind.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/SphereTriangleDetector.o: ../../Bullet/src/BulletCollision/CollisionDispatch/SphereTriangleDetector.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btBoxShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btBoxShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btBvhTriangleMeshShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btBvhTriangleMeshShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCapsuleShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btCapsuleShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCollisionShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btCollisionShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCompoundShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btCompoundShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConcaveShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btConcaveShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConeShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btConeShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConvexHullShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btConvexHullShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConvexShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btConvexShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConvexTriangleMeshShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btConvexTriangleMeshShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btCylinderShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btCylinderShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btEmptyShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btEmptyShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btHeightfieldTerrainShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btHeightfieldTerrainShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btMinkowskiSumShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btMinkowskiSumShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btMultiSphereShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btMultiSphereShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btOptimizedBvh.o: ../../Bullet/src/BulletCollision/CollisionShapes/btOptimizedBvh.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btPolyhedralConvexShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btPolyhedralConvexShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btSphereShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btSphereShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btStaticPlaneShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btStaticPlaneShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btStridingMeshInterface.o: ../../Bullet/src/BulletCollision/CollisionShapes/btStridingMeshInterface.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btTetrahedronShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btTetrahedronShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btTriangleBuffer.o: ../../Bullet/src/BulletCollision/CollisionShapes/btTriangleBuffer.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btTriangleCallback.o: ../../Bullet/src/BulletCollision/CollisionShapes/btTriangleCallback.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btTriangleIndexVertexArray.o: ../../Bullet/src/BulletCollision/CollisionShapes/btTriangleIndexVertexArray.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btTriangleMesh.o: ../../Bullet/src/BulletCollision/CollisionShapes/btTriangleMesh.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btTriangleMeshShape.o: ../../Bullet/src/BulletCollision/CollisionShapes/btTriangleMeshShape.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btContinuousConvexCollision.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btContinuousConvexCollision.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btConvexCast.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btConvexCast.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btGjkConvexCast.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btGjkConvexCast.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btGjkEpa.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btGjkEpa.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btGjkEpaPenetrationDepthSolver.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btGjkEpaPenetrationDepthSolver.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btGjkPairDetector.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btGjkPairDetector.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btMinkowskiPenetrationDepthSolver.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btMinkowskiPenetrationDepthSolver.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btPersistentManifold.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btPersistentManifold.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btRaycastCallback.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btRaycastCallback.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btSubSimplexConvexCast.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btSubSimplexConvexCast.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btVoronoiSimplexSolver.o: ../../Bullet/src/BulletCollision/NarrowPhaseCollision/btVoronoiSimplexSolver.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btAlignedAllocator.o: ../../Bullet/src/LinearMath/btAlignedAllocator.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btGeometryUtil.o: ../../Bullet/src/LinearMath/btGeometryUtil.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/btQuickprof.o: ../../Bullet/src/LinearMath/btQuickprof.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gimpact.o: ../../GIMPACT/src/gimpact.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_boxpruning.o: ../../GIMPACT/src/gim_boxpruning.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_contact.o: ../../GIMPACT/src/gim_contact.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_math.o: ../../GIMPACT/src/gim_math.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_memory.o: ../../GIMPACT/src/gim_memory.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_trimesh.o: ../../GIMPACT/src/gim_trimesh.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_trimesh_capsule_collision.o: ../../GIMPACT/src/gim_trimesh_capsule_collision.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_trimesh_ray_collision.o: ../../GIMPACT/src/gim_trimesh_ray_collision.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_trimesh_sphere_collision.o: ../../GIMPACT/src/gim_trimesh_sphere_collision.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_trimesh_trimesh_collision.o: ../../GIMPACT/src/gim_trimesh_trimesh_collision.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/gim_tri_tri_overlap.o: ../../GIMPACT/src/gim_tri_tri_overlap.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/Opcode.o: ../../OPCODE/Opcode.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_AABBCollider.o: ../../OPCODE/OPC_AABBCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_AABBTree.o: ../../OPCODE/OPC_AABBTree.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_BaseModel.o: ../../OPCODE/OPC_BaseModel.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_BoxPruning.o: ../../OPCODE/OPC_BoxPruning.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_Collider.o: ../../OPCODE/OPC_Collider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_Common.o: ../../OPCODE/OPC_Common.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_HybridModel.o: ../../OPCODE/OPC_HybridModel.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_LSSCollider.o: ../../OPCODE/OPC_LSSCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_MeshInterface.o: ../../OPCODE/OPC_MeshInterface.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_Model.o: ../../OPCODE/OPC_Model.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_OBBCollider.o: ../../OPCODE/OPC_OBBCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_OptimizedTree.o: ../../OPCODE/OPC_OptimizedTree.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_Picking.o: ../../OPCODE/OPC_Picking.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_PlanesCollider.o: ../../OPCODE/OPC_PlanesCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_RayCollider.o: ../../OPCODE/OPC_RayCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_SphereCollider.o: ../../OPCODE/OPC_SphereCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_SweepAndPrune.o: ../../OPCODE/OPC_SweepAndPrune.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_TreeBuilders.o: ../../OPCODE/OPC_TreeBuilders.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_TreeCollider.o: ../../OPCODE/OPC_TreeCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/OPC_VolumeCollider.o: ../../OPCODE/OPC_VolumeCollider.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/StdAfx.o: ../../OPCODE/StdAfx.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceAABB.o: ../../OPCODE/Ice/IceAABB.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceContainer.o: ../../OPCODE/Ice/IceContainer.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceHPoint.o: ../../OPCODE/Ice/IceHPoint.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceIndexedTriangle.o: ../../OPCODE/Ice/IceIndexedTriangle.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceMatrix3x3.o: ../../OPCODE/Ice/IceMatrix3x3.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceMatrix4x4.o: ../../OPCODE/Ice/IceMatrix4x4.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceOBB.o: ../../OPCODE/Ice/IceOBB.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IcePlane.o: ../../OPCODE/Ice/IcePlane.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IcePoint.o: ../../OPCODE/Ice/IcePoint.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceRandom.o: ../../OPCODE/Ice/IceRandom.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceRay.o: ../../OPCODE/Ice/IceRay.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceRevisitedRadix.o: ../../OPCODE/Ice/IceRevisitedRadix.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceSegment.o: ../../OPCODE/Ice/IceSegment.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceTriangle.o: ../../OPCODE/Ice/IceTriangle.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IceUtils.o: ../../OPCODE/Ice/IceUtils.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

-include $(OBJECTS:%.o=%.d)

