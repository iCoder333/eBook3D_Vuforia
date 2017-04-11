/*===============================================================================
 Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
 by iCoder, registered in the United States and other
 countries.
 ===============================================================================*/

#import <UIKit/UIKit.h>
#import "SampleGLResourceHandler.h"

@interface BooksAppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, weak) id<SampleGLResourceHandler> glResourceHandler;

@end

