//
//  NSDate+DateFromString.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (DateFromString)

+ (NSDate *)dateFromString:(NSString *)stringDate;
+ (NSString *)stringFromCurrentDate;

@end
