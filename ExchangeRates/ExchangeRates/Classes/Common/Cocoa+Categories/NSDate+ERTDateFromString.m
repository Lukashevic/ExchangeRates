//
//  NSDate+DateFromString.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "NSDate+DateFromString.h"
#import "NSCalendar+ERTDays.h"

@implementation NSDate (ERTDateFromString)


+ (NSDate *)dateFromString:(NSString *)stringDate {
  return [[self dateFormater] dateFromString:stringDate];
}

+ (NSString *)stringFromCurrentDate {
  return [[self dateFormater] stringFromDate:[NSCalendar yesterday]];
}

+ (NSDateFormatter *)dateFormater {
  static NSDateFormatter * dateFormatter;
  if (dateFormatter == nil) {
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  }
  return dateFormatter;
}
@end
