/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.

by iCoder, registered in the United States and other 
countries.
===============================================================================*/

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Book.h"

@protocol ImagesManagerDelegateProtocol <NSObject>

-(void)imageRequestDidFinishForBook:(Book *)theBook withImage:(UIImage *)anImage byCancelling:(BOOL)cancelled;

@end
