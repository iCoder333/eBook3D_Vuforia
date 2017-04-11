/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.

by iCoder, registered in the United States and other 
countries.
===============================================================================*/

#import <Foundation/Foundation.h>
#import "Book.h"

@protocol BooksControllerDelegateProtocol <NSObject>

- (NSString *) lastTargetIDScanned;

- (void) setLastTargetIDScanned:(NSString *) targetId;

- (BOOL) isVisualSearchOn;

- (void) setVisualSearchOn:(BOOL) isOn;

- (void) enterScanningMode;

- (void) setLastScannedBook: (Book *) book;

- (void)setOverlayLayer:(CALayer *)overlayLayer;

@end
