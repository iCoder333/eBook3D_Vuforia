/*===============================================================================
 Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
 by iCoder, registered in the United States and other
 countries.
 ===============================================================================*/

#import <UIKit/UIKit.h>

@interface SampleAppAboutViewController : UIViewController <UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *uiWebView;

@property (nonatomic, copy) NSString * appTitle;
@property (nonatomic, copy) NSString * appAboutPageName;

@end
