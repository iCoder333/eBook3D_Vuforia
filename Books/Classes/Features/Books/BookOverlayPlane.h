/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.

by iCoder, registered in the United States and other 
countries.
===============================================================================*/

#import <Foundation/Foundation.h>

static const float planeVertices[] =
{
    -0.5, -0.5, 0.0, 0.5, -0.5, 0.0, 0.5, 0.5, 0.0, -0.5, 0.5, 0.0,
};

static const float planeTexcoords[] =
{
    0.0, 0.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0, 1.0, 0.0, 1.0, 1.0
};

static const float planeNormals[] =
{
    0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0, 0.0, 0.0, 1.0
};

static const unsigned short planeIndices[] =
{
    0, 1, 2, 0, 2, 3
};
