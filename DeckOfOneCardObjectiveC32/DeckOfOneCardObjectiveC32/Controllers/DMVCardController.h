//
//  DMVCardController.h
//  DeckOfOneCardObjectiveC32
//
//  Created by Jake Haslam on 3/24/20.
//  Copyright © 2020 Jake Haslam. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class DMVCard;

NS_ASSUME_NONNULL_BEGIN

@interface DMVCardController : NSObject
// ------------------------------------------------------> this is the @escaping -----------------------------------
+ (void)drawNewCard: (NSNumber *)numberOfCards completion:(void(^) (NSArray<DMVCard *> *_Nullable cards)) completion;
+ (void)fetchCardImage: (DMVCard *)card completion:(void(^) (UIImage *_Nullable image))completion;
@end

NS_ASSUME_NONNULL_END
