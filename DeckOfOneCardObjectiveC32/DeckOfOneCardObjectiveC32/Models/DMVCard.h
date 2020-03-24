//
//  DMVCard.h
//  DeckOfOneCardObjectiveC32
//
//  Created by Jake Haslam on 3/24/20.
//  Copyright © 2020 Jake Haslam. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DMVCard : NSObject

@property (nonatomic, copy, readonly) NSString *suit;
@property (nonatomic, copy, readonly) NSString *image;

- (instancetype) initWithSuit: (NSString *) suit image: (NSString *) image;
- (instancetype) initWithDictionary: (NSDictionary *) dictionary;

@end

NS_ASSUME_NONNULL_END
