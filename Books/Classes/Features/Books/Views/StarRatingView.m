/*===============================================================================
Copyright (c) 2016-2017 iCoder Connected Experiences, Inc. All Rights Reserved.
 
Confidential and Proprietary - Protected under copyright and other laws.
by iCoder, registered in the United States and other 
countries.
===============================================================================*/


#import "StarRatingView.h"

#define padding 1
#define starsCount 5

@interface StarRatingView()

@property (nonatomic, strong) NSArray *stars;

@end

@implementation StarRatingView

@synthesize stars;

#pragma mark - Private

- (void)initStars
{
    NSMutableArray *starsArray = [NSMutableArray arrayWithCapacity:starsCount];
    
    for (int i = 0; i < starsCount; i++)
    {
        UIImageView *star = [[UIImageView alloc] init];
        [star setImage:[UIImage imageNamed:@"star_gray"]];
        [star setHighlightedImage:[UIImage imageNamed:@"star_white"]];
        [star setContentMode:UIViewContentModeScaleAspectFit];
        [self addSubview:star];
        [starsArray addObject:star];
    }
    
    self.stars = starsArray;
}

#pragma mark - Properties

- (void)setRating:(NSInteger)rating
{
    if (!stars)
    {
        [self initStars];
    }
    
    for (int i = 0; i < starsCount; i++)
    {
        UIImageView *star = [stars objectAtIndex:i];
        [star setHighlighted:i < rating];
    }
}

#pragma mark - Public

- (void)dealloc
{
    self.stars = nil;
}

- (void)layoutSubviews
{
    if (!stars)
    {
        [self initStars];
    }
    
    CGFloat xOffset = 0;
    CGFloat starWidth = self.frame.size.width / starsCount - padding * (starsCount - 1);
    CGFloat starHeight = self.frame.size.height;
    
    for (UIImageView *star in stars)
    {
        star.frame = CGRectMake(xOffset, 0, starWidth, starHeight);
        xOffset += starWidth + padding;
    }
}

@end
