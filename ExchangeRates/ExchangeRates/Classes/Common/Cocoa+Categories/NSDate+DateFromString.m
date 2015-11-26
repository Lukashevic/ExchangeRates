//
//  NSDate+DateFromString.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "NSDate+DateFromString.h"

@implementation NSDate (DateFromString)

+ (NSDate *)dateFromString:(NSString *)stringDate {
  
  static NSDateFormatter *dateFormatter;
  if (dateFormatter == nil) {
    dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateStyle:NSDateFormatterMediumStyle];
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
  }
  return [dateFormatter dateFromString:stringDate];
}
@end
