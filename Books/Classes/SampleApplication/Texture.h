/*===============================================================================
 Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
 by iCoder, registered in the United States and other
 countries.
 ===============================================================================*/

#import <Foundation/Foundation.h>


@interface Texture : NSObject {
@private
    int channels;
}


// --- Properties ---
@property (nonatomic, readonly) int width;
@property (nonatomic, readonly) int height;
@property (nonatomic, readwrite) int textureID;
@property (nonatomic, readonly) unsigned char* pngData;


// --- Public methods ---
- (id)initWithImageFile:(NSString*)filename;

@end
