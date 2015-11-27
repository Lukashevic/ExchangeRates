//
//  NSDate+DateFromString.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDate (ERTDateFromString)

+ (NSDate *)dateFromString:(NSString *)stringDate;
+ (NSString *)stringFromCurrentDate;

@end
