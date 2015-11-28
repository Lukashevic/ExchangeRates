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
  NSCalendar * calendar = [NSCalendar currentCalendar];
  [calendar setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];

  NSDateComponents * components =
    [calendar components:NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay
                fromDate:[NSDate date]];
  components.day --;
  return [calendar dateFromComponents:components];;
}

+ (NSDate *)today {
  return [NSDate date];
}

@end
