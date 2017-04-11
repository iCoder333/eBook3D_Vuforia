/*===============================================================================
 Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
 by iCoder, registered in the United States and other
 countries.
 ===============================================================================*/

#import <Foundation/Foundation.h>

// this class reads a text file describing a 3d Model

@interface SampleApplication3DModel : NSObject

@property (nonatomic, readonly) NSInteger numVertices;
@property (nonatomic, readonly) float* vertices;
@property (nonatomic, readonly) float* normals;
@property (nonatomic, readonly) float* texCoords;

- (id)initWithTxtResourceName:(NSString *) name;

- (void) read;

@end
