/*************************************************************************
 *                                                                       *
 * Open Dynamics Engine, Copyright (C) 2001-2003 Russell L. Smith.       *
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

#ifndef _ODE_COLLISION_H_
#define _ODE_COLLISION_H_

#include <ode/common.h>
#include <ode/collision_space.h>
#include <ode/contact.h>

#ifdef __cplusplus
extern "C" {
#endif

/* ************************************************************************ */
/* general functions */

ODE_API void dGeomDestroy (dGeomID);
ODE_API void dGeomSetData (dGeomID, void *);
ODE_API void *dGeomGetData (dGeomID);
ODE_API void dGeomSetBody (dGeomID, dBodyID);
ODE_API dBodyID dGeomGetBody (dGeomID);
ODE_API void dGeomSetPosition (dGeomID, dReal x, dReal y, dReal z);
ODE_API void dGeomSetRotation (dGeomID, const dMatrix3 R);
ODE_API void dGeomSetQuaternion (dGeomID, const dQuaternion);
ODE_API const dReal * dGeomGetPosition (dGeomID);
ODE_API const dReal * dGeomGetRotation (dGeomID);
ODE_API void dGeomGetQuaternion (dGeomID, dQuaternion result);
ODE_API void dGeomGetAABB (dGeomID, dReal aabb[6]);
ODE_API int dGeomIsSpace (dGeomID);
ODE_API dSpaceID dGeomGetSpace (dGeomID);
ODE_API int dGeomGetClass (dGeomID);
ODE_API void dGeomSetCategoryBits (dGeomID, unsigned long bits);
ODE_API void dGeomSetCollideBits (dGeomID, unsigned long bits);
ODE_API unsigned long dGeomGetCategoryBits (dGeomID);
ODE_API unsigned long dGeomGetCollideBits (dGeomID);
ODE_API void dGeomEnable (dGeomID);
ODE_API void dGeomDisable (dGeomID);
ODE_API int dGeomIsEnabled (dGeomID);

/* ************************************************************************ */
/* geom offset from body */

ODE_API void dGeomSetOffsetPosition (dGeomID, dReal x, dReal y, dReal z);
ODE_API void dGeomSetOffsetRotation (dGeomID, const dMatrix3 R);
ODE_API void dGeomSetOffsetQuaternion (dGeomID, const dQuaternion);
ODE_API void dGeomSetOffsetWorldPosition (dGeomID, dReal x, dReal y, dReal z);
ODE_API void dGeomSetOffsetWorldRotation (dGeomID, const dMatrix3 R);
ODE_API void dGeomSetOffsetWorldQuaternion (dGeomID, const dQuaternion);
ODE_API void dGeomClearOffset(dGeomID);
ODE_API int dGeomIsOffset(dGeomID);
ODE_API const dReal * dGeomGetOffsetPosition (dGeomID);
ODE_API const dReal * dGeomGetOffsetRotation (dGeomID);
ODE_API void dGeomGetOffsetQuaternion (dGeomID, dQuaternion result);

/* ************************************************************************ */
/* collision detection */

ODE_API int dCollide (dGeomID o1, dGeomID o2, int flags, dContactGeom *contact,
	      int skip);
ODE_API void dSpaceCollide (dSpaceID space, void *data, dNearCallback *callback);
ODE_API void dSpaceCollide2 (dGeomID o1, dGeomID o2, void *data,
		     dNearCallback *callback);

/* ************************************************************************ */
/* standard classes */

/* the maximum number of user classes that are supported */
enum {
  dMaxUserClasses = 4
};

/* class numbers - each geometry object needs a unique number */
enum {
  dSphereClass = 0,
  dBoxClass,
  dCapsuleClass,
  dCylinderClass,
  dPlaneClass,
  dRayClass,
  dGeomTransformClass,
  dTriMeshClass,

  dFirstSpaceClass,
  dSimpleSpaceClass = dFirstSpaceClass,
  dHashSpaceClass,
  dQuadTreeSpaceClass,
  dLastSpaceClass = dQuadTreeSpaceClass,

  dFirstUserClass,
  dLastUserClass = dFirstUserClass + dMaxUserClasses - 1,
  dGeomNumClasses
};


ODE_API dGeomID dCreateSphere (dSpaceID space, dReal radius);
ODE_API void dGeomSphereSetRadius (dGeomID sphere, dReal radius);
ODE_API dReal dGeomSphereGetRadius (dGeomID sphere);
ODE_API dReal dGeomSpherePointDepth (dGeomID sphere, dReal x, dReal y, dReal z);

ODE_API dGeomID dCreateBox (dSpaceID space, dReal lx, dReal ly, dReal lz);
ODE_API void dGeomBoxSetLengths (dGeomID box, dReal lx, dReal ly, dReal lz);
ODE_API void dGeomBoxGetLengths (dGeomID box, dVector3 result);
ODE_API dReal dGeomBoxPointDepth (dGeomID box, dReal x, dReal y, dReal z);

ODE_API dGeomID dCreatePlane (dSpaceID space, dReal a, dReal b, dReal c, dReal d);
ODE_API void dGeomPlaneSetParams (dGeomID plane, dReal a, dReal b, dReal c, dReal d);
ODE_API void dGeomPlaneGetParams (dGeomID plane, dVector4 result);
ODE_API dReal dGeomPlanePointDepth (dGeomID plane, dReal x, dReal y, dReal z);

ODE_API dGeomID dCreateCapsule (dSpaceID space, dReal radius, dReal length);
ODE_API void dGeomCapsuleSetParams (dGeomID ccylinder, dReal radius, dReal length);
ODE_API void dGeomCapsuleGetParams (dGeomID ccylinder, dReal *radius, dReal *length);
ODE_API dReal dGeomCapsulePointDepth (dGeomID ccylinder, dReal x, dReal y, dReal z);

// For now we want to have a backwards compatible C-API, note: C++ API is not.
#define dCreateCCylinder dCreateCapsule
#define dGeomCCylinderSetParams dGeomCapsuleSetParams
#define dGeomCCylinderGetParams dGeomCapsuleGetParams
#define dGeomCCylinderPointDepth dGeomCapsulePointDepth
#define dCCylinderClass dCapsuleClass

#ifdef dCYLINDER_ENABLED
ODE_API dGeomID dCreateCylinder (dSpaceID space, dReal radius, dReal length);
ODE_API void dGeomCylinderSetParams (dGeomID cylinder, dReal radius, dReal length);
ODE_API void dGeomCylinderGetParams (dGeomID cylinder, dReal *radius, dReal *length);
#endif

ODE_API dGeomID dCreateRay (dSpaceID space, dReal length);
ODE_API void dGeomRaySetLength (dGeomID ray, dReal length);
ODE_API dReal dGeomRayGetLength (dGeomID ray);
ODE_API void dGeomRaySet (dGeomID ray, dReal px, dReal py, dReal pz,
		  dReal dx, dReal dy, dReal dz);
ODE_API void dGeomRayGet (dGeomID ray, dVector3 start, dVector3 dir);

/*
 * Set/get ray flags that influence ray collision detection.
 * These flags are currently only noticed by the trimesh collider, because
 * they can make a major differences there.
 */
ODE_API void dGeomRaySetParams (dGeomID g, int FirstContact, int BackfaceCull);
ODE_API void dGeomRayGetParams (dGeomID g, int *FirstContact, int *BackfaceCull);
ODE_API void dGeomRaySetClosestHit (dGeomID g, int closestHit);
ODE_API int dGeomRayGetClosestHit (dGeomID g);

#include "collision_trimesh.h"

ODE_API dGeomID dCreateGeomTransform (dSpaceID space);
ODE_API void dGeomTransformSetGeom (dGeomID g, dGeomID obj);
ODE_API dGeomID dGeomTransformGetGeom (dGeomID g);
ODE_API void dGeomTransformSetCleanup (dGeomID g, int mode);
ODE_API int dGeomTransformGetCleanup (dGeomID g);
ODE_API void dGeomTransformSetInfo (dGeomID g, int mode);
ODE_API int dGeomTransformGetInfo (dGeomID g);

/* ************************************************************************ */
/* utility functions */

ODE_API void dClosestLineSegmentPoints (const dVector3 a1, const dVector3 a2,
				const dVector3 b1, const dVector3 b2,
				dVector3 cp1, dVector3 cp2);

ODE_API int dBoxTouchesBox (const dVector3 _p1, const dMatrix3 R1,
		    const dVector3 side1, const dVector3 _p2,
		    const dMatrix3 R2, const dVector3 side2);

ODE_API int dBoxBox (const dVector3 p1, const dMatrix3 R1,
	     const dVector3 side1, const dVector3 p2,
	     const dMatrix3 R2, const dVector3 side2,
	     dVector3 normal, dReal *depth, int *return_code,
	     int maxc, dContactGeom *contact, int skip);

ODE_API void dInfiniteAABB (dGeomID geom, dReal aabb[6]);
ODE_API void dCloseODE(void);

/* ************************************************************************ */
/* custom classes */

typedef void dGetAABBFn (dGeomID, dReal aabb[6]);
typedef int dColliderFn (dGeomID o1, dGeomID o2,
			 int flags, dContactGeom *contact, int skip);
typedef dColliderFn * dGetColliderFnFn (int num);
typedef void dGeomDtorFn (dGeomID o);
typedef int dAABBTestFn (dGeomID o1, dGeomID o2, dReal aabb[6]);

typedef struct dGeomClass {
  int bytes;
  dGetColliderFnFn *collider;
  dGetAABBFn *aabb;
  dAABBTestFn *aabb_test;
  dGeomDtorFn *dtor;
} dGeomClass;

ODE_API int dCreateGeomClass (const dGeomClass *classptr);
ODE_API void * dGeomGetClassData (dGeomID);
ODE_API dGeomID dCreateGeom (int classnum);

/* ************************************************************************ */

#ifdef __cplusplus
}
#endif

#endif
