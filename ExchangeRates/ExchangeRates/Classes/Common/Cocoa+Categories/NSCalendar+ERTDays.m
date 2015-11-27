//
//  NSCalendar+ERTDays.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "NSCalendar+ERTDays.h"

@implementation NSCalendar (ERTDays)

+ (NSDate *)yesterday {
  NSCalendar *calendar = [NSCalendar currentCalendar];
  NSDateComponents *comps =
    [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                fromDate:[NSDate date]];
    comps.day--;
  return [calendar dateFromComponents:comps];
}
@end
