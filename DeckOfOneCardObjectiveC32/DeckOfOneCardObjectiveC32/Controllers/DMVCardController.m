//
//  DMVCardController.m
//  DeckOfOneCardObjectiveC32
//
//  Created by Jake Haslam on 3/24/20.
//  Copyright © 2020 Jake Haslam. All rights reserved.
//

#import "DMVCardController.h"
#import "DMVCard.h"

static NSString * const baseURLString = @"https://deckofcardsapi.com/api/deck/new/";
static NSString * const drawComponent = @"draw/";
static NSString * const countQueryName = @"count";
static NSString * const cardsArrayURL = @"cards";

@implementation DMVCardController

//MARK: - Methods
+ (void)drawNewCard:(NSNumber *)numberOfCards completion:(void (^)(NSArray<DMVCard *> * _Nullable))completion
{
    NSURL * baseURL = [NSURL URLWithString:baseURLString];
    
    NSURL * drawURL = [baseURL URLByAppendingPathComponent:drawComponent];
    
    NSString *cardCount = [numberOfCards stringValue];
    
    NSURLComponents *urlComponents = [NSURLComponents componentsWithURL:drawURL resolvingAgainstBaseURL:true];
    
    NSURLQueryItem *queryItem = [NSURLQueryItem queryItemWithName:countQueryName value:cardCount];
    
    urlComponents.queryItems = @[queryItem];
    
    NSURL *searchURL = urlComponents.URL;
    
    [[[NSURLSession sharedSession] dataTaskWithURL:searchURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        
        if (!data)
        {
            NSLog(@"Error: no data returned");
            completion(nil);
            return;
        }
        
        
        NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data options: 2 error: &error];
        
        if (!jsonDictionary || ![jsonDictionary isKindOfClass:[NSDictionary class]])
        {
            NSLog(@"Unable to create a dictionary from the data");
            completion(nil);
            return;
        }
        
        NSArray * cardsArray = jsonDictionary[cardsArrayURL];
        
        NSMutableArray *cardsPlaceholder = [NSMutableArray array];
        
        for (NSDictionary *cardDictionary in cardsArray)
        {
            
            DMVCard *card = [[DMVCard alloc] initWithDictionary: cardDictionary];
            
            [cardsPlaceholder addObject: card];
        }
        completion(cardsPlaceholder);
    } ]resume];
}

+ (void)fetchCardImage:(DMVCard *)card completion:(void (^)(UIImage * _Nullable))completion
{
    
    NSURL *imageURL = [NSURL URLWithString:card.image];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:imageURL completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        if (error)
        {
            NSLog(@"%@", error.localizedDescription);
            completion(nil);
            return;
        }
        if (!data)
        {
            NSLog(@"Error: no data returned");
            completion(nil);
            return;
        }
        
        UIImage *cardImage = [UIImage imageWithData:data];
        completion(cardImage);
    }]resume];
}

@end

