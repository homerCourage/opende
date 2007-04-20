/*
Bullet Continuous Collision Detection and Physics Library
Copyright (c) 2003-2006 Erwin Coumans  http://continuousphysics.com/Bullet/

This software is provided 'as-is', without any express or implied warranty.
In no event will the authors be held liable for any damages arising from the use of this software.
Permission is granted to anyone to use this software for any purpose, 
including commercial applications, and to alter it and redistribute it freely, 
subject to the following restrictions:

1. The origin of this software must not be misrepresented; you must not claim that you wrote the original software. If you use this software in a product, an acknowledgment in the product documentation would be appreciated but is not required.
2. Altered source versions must be plainly marked as such, and must not be misrepresented as being the original software.
3. This notice may not be removed or altered from any source distribution.
*/

#ifndef OPTIMIZED_BVH_H
#define OPTIMIZED_BVH_H


#include "../../LinearMath/btVector3.h"


//http://msdn.microsoft.com/library/default.asp?url=/library/en-us/vclang/html/vclrf__m128.asp



class btStridingMeshInterface;


///btQuantizedBvhNode is a compressed aabb node, 16 bytes.
///Node can be used for leafnode or internal node. Leafnodes can point to 32-bit triangle index (non-negative range).
ATTRIBUTE_ALIGNED16	(struct btQuantizedBvhNode)
{
	//12 bytes
	unsigned short int	m_quantizedAabbMin[3];
	unsigned short int	m_quantizedAabbMax[3];
	//4 bytes
	int	m_escapeIndexOrTriangleIndex;

	bool isLeafNode() const
	{
		//skipindex is negative (internal node), triangleindex >=0 (leafnode)
		return (m_escapeIndexOrTriangleIndex >= 0);
	}
	int getEscapeIndex() const
	{
		btAssert(!isLeafNode());
		return -m_escapeIndexOrTriangleIndex;
	}
	int	getTriangleIndex() const
	{
		btAssert(isLeafNode());
		return m_escapeIndexOrTriangleIndex;
	}
};

/// btOptimizedBvhNode contains both internal and leaf node information.
/// Total node size is 44 bytes / node. You can use the compressed version of 16 bytes.
ATTRIBUTE_ALIGNED16 (struct btOptimizedBvhNode)
{
	//32 bytes
	btVector3	m_aabbMinOrg;
	btVector3	m_aabbMaxOrg;

	//4
	int	m_escapeIndex;

	//8
	//for child nodes
	int	m_subPart;
	int	m_triangleIndex;

};



class btNodeOverlapCallback
{
public:
	virtual ~btNodeOverlapCallback() {};

	virtual void processNode(int subPart, int triangleIndex) = 0;
};

#include "../../LinearMath/btAlignedAllocator.h"
#include "../../LinearMath/btAlignedObjectArray.h"


typedef btAlignedObjectArray<btOptimizedBvhNode>	NodeArray;

typedef btAlignedObjectArray<btQuantizedBvhNode>	QuantizedNodeArray;

///OptimizedBvh store an AABB tree that can be quickly traversed on CPU (and SPU,GPU in future)
class btOptimizedBvh
{
	NodeArray			m_leafNodes;
	btOptimizedBvhNode*	m_contiguousNodes;

	QuantizedNodeArray	m_quantizedLeafNodes;
	
	QuantizedNodeArray	m_quantizedContiguousNodes;
	
	int					m_curNodeIndex;


	//quantization data
	bool				m_useQuantization;
	btVector3			m_bvhAabbMin;
	btVector3			m_bvhAabbMax;
	btVector3			m_bvhQuantization;

	//two versions, one for quantized and normal nodes. This allows code-reuse while maintaining readability (no template/macro!)
	void	setInternalNodeAabbMin(int nodeIndex, const btVector3& aabbMin)
	{
		if (m_useQuantization)
		{
			quantizeWithClamp(&m_quantizedContiguousNodes[nodeIndex].m_quantizedAabbMin[0] ,aabbMin);
		} else
		{
			m_contiguousNodes[nodeIndex].m_aabbMinOrg = aabbMin;

		}
	}
	void	setInternalNodeAabbMax(int nodeIndex,const btVector3& aabbMax)
	{
		if (m_useQuantization)
		{
			quantizeWithClamp(&m_quantizedContiguousNodes[nodeIndex].m_quantizedAabbMax[0],aabbMax);
		} else
		{
			m_contiguousNodes[nodeIndex].m_aabbMaxOrg = aabbMax;
		}
	}

	btVector3 getAabbMin(int nodeIndex) const
	{
		if (m_useQuantization)
		{
			return unQuantize(&m_quantizedLeafNodes[nodeIndex].m_quantizedAabbMin[0]);
		}
		//non-quantized
		return m_leafNodes[nodeIndex].m_aabbMinOrg;

	}
	btVector3 getAabbMax(int nodeIndex) const
	{
		if (m_useQuantization)
		{
			return unQuantize(&m_quantizedLeafNodes[nodeIndex].m_quantizedAabbMax[0]);
		} 
		//non-quantized
		return m_leafNodes[nodeIndex].m_aabbMaxOrg;
		
	}

	void	initQuantizationValues(btStridingMeshInterface* triangles);

	
	
	void	setInternalNodeEscapeIndex(int nodeIndex, int escapeIndex)
	{
		if (m_useQuantization)
		{
			m_quantizedContiguousNodes[nodeIndex].m_escapeIndexOrTriangleIndex = -escapeIndex;
		} 
		else
		{
			m_contiguousNodes[nodeIndex].m_escapeIndex = escapeIndex;
		}

	}

	void mergeInternalNodeAabb(int nodeIndex,const btVector3& newAabbMin,const btVector3& newAabbMax) 
	{
		if (m_useQuantization)
		{
			unsigned short int quantizedAabbMin[3];
			unsigned short int quantizedAabbMax[3];
			quantizeWithClamp(quantizedAabbMin,newAabbMin);
			quantizeWithClamp(quantizedAabbMax,newAabbMax);
			for (int i=0;i<3;i++)
			{
				if (m_quantizedContiguousNodes[nodeIndex].m_quantizedAabbMin[i] > quantizedAabbMin[i])
					m_quantizedContiguousNodes[nodeIndex].m_quantizedAabbMin[i] = quantizedAabbMin[i];

				if (m_quantizedContiguousNodes[nodeIndex].m_quantizedAabbMax[i] < quantizedAabbMax[i])
					m_quantizedContiguousNodes[nodeIndex].m_quantizedAabbMax[i] = quantizedAabbMax[i];

			}
		} else
		{
			//non-quantized
			m_contiguousNodes[nodeIndex].m_aabbMinOrg.setMin(newAabbMin);
			m_contiguousNodes[nodeIndex].m_aabbMaxOrg.setMax(newAabbMax);		
		}
	}

	void	swapLeafNodes(int firstIndex,int secondIndex);

	void	assignInternalNodeFromLeafNode(int internalNode,int leafNodeIndex);

protected:

	

	void	buildTree	(int startIndex,int endIndex);

	int	calcSplittingAxis(int startIndex,int endIndex);

	int	sortAndCalcSplittingIndex(int startIndex,int endIndex,int splitAxis);
	
	void	walkStacklessTree(btNodeOverlapCallback* nodeCallback,const btVector3& aabbMin,const btVector3& aabbMax) const;

	void	walkStacklessQuantizedTree(btNodeOverlapCallback* nodeCallback,const btVector3& aabbMin,const btVector3& aabbMax) const;

	inline bool testQuantizedAabbAgainstQuantizedAabb(unsigned short int* aabbMin1,unsigned short int* aabbMax1,const unsigned short int* aabbMin2,const unsigned short int* aabbMax2) const
	{
		bool overlap = true;
		overlap = (aabbMin1[0] > aabbMax2[0] || aabbMax1[0] < aabbMin2[0]) ? false : overlap;
		overlap = (aabbMin1[2] > aabbMax2[2] || aabbMax1[2] < aabbMin2[2]) ? false : overlap;
		overlap = (aabbMin1[1] > aabbMax2[1] || aabbMax1[1] < aabbMin2[1]) ? false : overlap;
		return overlap;
	}


public:
	btOptimizedBvh();

	virtual ~btOptimizedBvh();

	void	build(btStridingMeshInterface* triangles,bool useQuantizedAabbCompression);

	void	reportAabbOverlappingNodex(btNodeOverlapCallback* nodeCallback,const btVector3& aabbMin,const btVector3& aabbMax) const;

	void	reportSphereOverlappingNodex(btNodeOverlapCallback* nodeCallback,const btVector3& aabbMin,const btVector3& aabbMax) const;

	void quantizeWithClamp(unsigned short* out, const btVector3& point) const;
	
	btVector3	unQuantize(const unsigned short* vecIn) const;

	void	refit(btStridingMeshInterface* triangles);
};


#endif //OPTIMIZED_BVH_H
