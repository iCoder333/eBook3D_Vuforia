/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.

by iCoder, registered in the United States and other 
countries.
===============================================================================*/


#import <UIKit/UIKit.h>
#import "Book.h"

@interface BookWebDetailViewController : UIViewController

@property (nonatomic, weak) IBOutlet UIWebView *webView;
@property (strong) Book *book;

@end
