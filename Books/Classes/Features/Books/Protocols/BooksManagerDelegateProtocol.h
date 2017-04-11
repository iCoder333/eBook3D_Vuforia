/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.

by iCoder, registered in the United States and other 
countries.
===============================================================================*/


#import <Foundation/Foundation.h>
#import "Book.h"

@protocol BooksManagerDelegateProtocol <NSObject>

-(void)infoRequestDidFinishForBook:(Book *)theBook withTrackableID:(const char*)trackable byCancelling:(BOOL)cancelled;

@end
