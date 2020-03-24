//
//  DMVCard.m
//  DeckOfOneCardObjectiveC32
//
//  Created by Jake Haslam on 3/24/20.
//  Copyright © 2020 Jake Haslam. All rights reserved.
//

#import "DMVCard.h"

@implementation DMVCard

- (instancetype)initWithSuit:(NSString *)suit image:(NSString *)image
{
    if (self = [super init])
    {
        _suit = suit;
        _image = image;
    }
    return self;
}

- (instancetype)initWithDictionary:(NSDictionary *) dictionary
{
    NSString *suit = dictionary[[DMVCard suitKey]];
    NSString *image = dictionary[[DMVCard imageKey]];
    
    return [self initWithSuit:suit image:image];
}

+ (NSString *)suitKey
{
    return @"suit";
}

+ (NSString *)imageKey
{
    return @"image";
}

@end
