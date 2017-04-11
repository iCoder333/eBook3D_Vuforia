/*===============================================================================
 Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
 by iCoder, registered in the United States and other
 countries.
 ===============================================================================*/

@protocol SampleGLResourceHandler

@required
- (void) freeOpenGLESResources;
- (void) finishOpenGLESCommands;

@end