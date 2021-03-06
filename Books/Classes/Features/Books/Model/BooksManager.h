/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.

by iCoder, registered in the United States and other 
countries.
===============================================================================*/


#import <Foundation/Foundation.h>
#import "BooksManagerDelegateProtocol.h"


@interface BooksManager : NSObject

@property (nonatomic, strong) NSMutableSet *badTargets;
@property (nonatomic, copy) NSString *thisTrackable;
@property (nonatomic, strong) NSMutableData *bookInfo;
@property (nonatomic, weak) id <BooksManagerDelegateProtocol> delegate;

@property (readwrite, nonatomic, setter = cancelNetworkOperations:) BOOL cancelNetworkOperation;
@property (readonly, nonatomic, getter = isNetworkOperationInProgress) BOOL networkOperationInProgress;

+(BooksManager *)sharedInstance;

-(void)bookWithJSONFilename:(NSString *)jsonFilename withDelegate:(id <BooksManagerDelegateProtocol>)aDelegate forTrackableID:(const char *)trackableID;
-(void)addBadTargetId:(const char*)aTargetId;
-(BOOL)isBadTarget:(const char*)aTargetId;

@end
