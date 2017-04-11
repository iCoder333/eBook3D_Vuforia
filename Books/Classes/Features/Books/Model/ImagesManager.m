/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
Confidential and Proprietary - Protected under copyright and other laws.
by iCoder, registered in the United States and other 
countries.
===============================================================================*/


#import "ImagesManager.h"
#import "BooksManager.h"

@implementation ImagesManager

@synthesize cancelNetworkOperation, networkOperationInProgress;
@synthesize thisBook, bookImage, delegate;

static ImagesManager *sharedInstance = nil;

#pragma mark - Private

-(NSString *)filePathFromURL:(NSString *)urlString
{
    NSString *cleanFilename = [self URLToSafeString:urlString];
    
    // the image will we stored in the Document directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    // we build the file name by appending it to the directory name
    return [documentsDirectory stringByAppendingString:[NSString stringWithFormat:@"/%@", cleanFilename]];
}

// transform a URL by keeping only alphanumeric characters
- (NSString*) URLToSafeString:(NSString*)urlString
{
    // we keep the extension
    NSString *extension = [[urlString componentsSeparatedByString:@"."] lastObject];
    
    // work on basename
    urlString = [urlString stringByDeletingPathExtension];
    NSString *retVal = nil;
    
    // we are interested to remove non alphanumeric caharcters
    NSCharacterSet * cs = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    // we remove non alpha chaacters
    retVal = [[urlString componentsSeparatedByCharactersInSet:cs] componentsJoinedByString:@""];

    // we re-add the extension
    return [retVal stringByAppendingPathExtension:extension];
}


-(void) saveImage:(UIImage *)anImage fromURLString:(NSString *)urlString
{
    //  Save a UIImage in the documents folder
    if (nil != anImage)
    {
        NSString *filepath = [self filePathFromURL:urlString];
        [UIImagePNGRepresentation(anImage) writeToFile:filepath atomically:YES];
    }
}

-(void)asyncDownloadImageForBook
{
    // Download the image for this book
    NSURL *anURL = [NSURL URLWithString:thisBook.thumbnailURL];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:anURL];
    [request setHTTPMethod:@"GET"];
    
    // Do not start the network operation immediately
    NSURLConnection *aConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
    
    // Use the run loop associated with the main thread
    [aConnection scheduleInRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
    
    // Start the network operation
    [aConnection start];
}

#pragma mark - Public

-(UIImage *)cachedImageFromURL:(NSString*)urlString
{
    NSString *aFilePath = [self filePathFromURL:urlString];
    
    return [UIImage imageWithContentsOfFile:aFilePath];
}

-(void)imageForBook:(Book *)theBook withDelegate:(id <ImagesManagerDelegateProtocol>)aDelegate
{
    // Store the book
    thisBook = theBook;
    
    // Store the delegate
    delegate = aDelegate;
    
    //  Load the image from the cache, if possible
    UIImage *anImage = [self cachedImageFromURL:thisBook.thumbnailURL];
    
    if (anImage)
    {
        // Send the image data to our delegate
        [self imageDownloadDidFinish:anImage withConnection:nil];
    }
    else
    {
        networkOperationInProgress = YES;
        
        // Download the image
        [self asyncDownloadImageForBook];
    }
}

+(id)sharedInstance
{
	@synchronized(self)
    {
		if (sharedInstance == nil)
        {
			sharedInstance = [[self alloc] init];
		}
	}
	return sharedInstance;
}

-(void)imageDownloadDidFinish:(UIImage *)image withConnection:(NSURLConnection *)connection
{
    //  Inform the delegate that the request has completed
    [delegate imageRequestDidFinishForBook:thisBook withImage:image byCancelling:[self cancelNetworkOperation]];
    
    if (YES == [self cancelNetworkOperation])
    {
        // Inform the BooksManager that the network operation has been cancelled
        [[BooksManager sharedInstance] cancelNetworkOperations:NO];
    }
    
    delegate = nil;
    thisBook = nil;
    bookImage = nil;
    
    networkOperationInProgress = NO;
}

#pragma mark NSURLConnectionDelegate
// *** These delegate methods are always called on the main thread ***
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    // Send nil image data to our delegate
    [self imageDownloadDidFinish:nil withConnection:connection];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    if (YES == [self cancelNetworkOperation])
    {
        // Cancel this connection
        [connection cancel];
        
        // Send nil image data to our delegate
        [self imageDownloadDidFinish:nil withConnection:connection];
    }
    else
    {
        // Get the image from the data
        UIImage *anImage = [UIImage imageWithData:bookImage];
        
        // Save UIImage to the filesystem to avoid downloading it next time
        [self saveImage:anImage fromURLString:thisBook.thumbnailURL];
        
        // Send the image data to our delegate
        [self imageDownloadDidFinish:anImage withConnection:connection];
    }
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    if (YES == [self cancelNetworkOperation])
    {
        // Cancel this connection
        [connection cancel];
        
        // Send nil image data to our delegate
        [self imageDownloadDidFinish:nil withConnection:connection];
    }
    else
    {
        if (nil == bookImage)
        {
            bookImage = [[NSMutableData alloc] init];
        }
        
        [bookImage appendData:data];
    }
}

#pragma mark Singleton overrides

+ (id)allocWithZone:(NSZone *)zone
{
    //  Overriding this method for singleton
    
	@synchronized(self)
    {
		if (sharedInstance == nil)
        {
			sharedInstance = [super allocWithZone:zone];
			return sharedInstance;
		}
	}
	return nil;
}

- (id)copyWithZone:(NSZone *)zone
{
    //  Overriding this method for singleton
    
	return self;
}

@end
