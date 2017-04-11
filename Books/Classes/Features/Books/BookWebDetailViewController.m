/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
Confidential and Proprietary - Protected under copyright and other laws.
by iCoder, registered in the United States and other 
countries.
===============================================================================*/


#import "BookWebDetailViewController.h"

@implementation BookWebDetailViewController

@synthesize book, webView;

#pragma mark - Private

- (void)loadWebView
{
    //  Load web detail from a fixed URL
    NSURL *anURL = [[NSURL alloc] initWithString:book.bookURL];
    NSURLRequest *aRequest = [[NSURLRequest alloc] initWithURL:anURL];
    [webView loadRequest:aRequest];
}

#pragma mark - Public

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self loadWebView];
}

- (IBAction)onDonePressed:(id)sender
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kBookWebDetailDismissed" object:nil];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
