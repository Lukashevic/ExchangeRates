//
//  NSDate+DateFromString.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "NSDate+ERTDateFromString.h"
#import "NSCalendar+ERTDays.h"

@implementation NSDate (ERTDateFromString)


+ (NSDate *)dateFromString:(NSString *)stringDate {
  return [[self dateFormater] dateFromString:stringDate];
}

+ (NSString *)yesterdayDateString {
  return [[self dateFormater] stringFromDate:[NSCalendar yesterday]];
}

+ (NSDateFormatter *)dateFormater {
  static NSDateFormatter * dateFormatter;
  if (dateFormatter == nil) {
    dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    [dateFormatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"GMT"]];
  }
  return dateFormatter;
}

+ (NSString *)lastUpdateString:(NSDate *)date {
  NSDateFormatter * df = [NSDateFormatter new];
  [df setDateStyle:NSDateFormatterShortStyle];
  [df setDateFormat:@"HH:mm"];
  return [df stringFromDate:date];
}

@end
