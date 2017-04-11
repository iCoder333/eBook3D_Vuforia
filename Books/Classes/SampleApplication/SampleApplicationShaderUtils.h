/*===============================================================================
 Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
 by iCoder, registered in the United States and other
 countries.
 ===============================================================================*/

#import <Foundation/Foundation.h>


@interface SampleApplicationShaderUtils : NSObject



+ (int)createProgramWithVertexShaderFileName:(NSString*) vertexShaderFileName
                      fragmentShaderFileName:(NSString*) fragmentShaderFileName;

+ (int)createProgramWithVertexShaderFileName:(NSString*) vertexShaderFileName
                        withVertexShaderDefs:(NSString *) vertexShaderDefs
                      fragmentShaderFileName:(NSString *) fragmentShaderFileName
                      withFragmentShaderDefs:(NSString *) fragmentShaderDefs;


@end
