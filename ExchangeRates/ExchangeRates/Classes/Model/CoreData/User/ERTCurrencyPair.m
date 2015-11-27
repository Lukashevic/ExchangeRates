#import "ERTCurrencyPair.h"
#import "NSCalendar+ERTDays.h"
#import "ERTRate.h"

@interface ERTCurrencyPair ()

// Private interface goes here.

@end

@implementation ERTCurrencyPair

- (NSDictionary *)webRequestParams {
  return @{@"base" : self.baseCurrencyName,
           @"syblos" : self.transactionCurrencyName};
}

- (NSString *)pairStringValue {
  return [NSString stringWithFormat:@"%@ → %@",
          self.baseCurrencyName, self.transactionCurrencyName];
}

- (ERTRate *)newestRate {
  NSDate * date = [NSCalendar yesterday];
  return [self rateForDate:date];

}

- (ERTRate *)yersterdayRate {
  NSDate * date = [NSCalendar yesterday];
  return [self rateForDate:date];
}

- (ERTRate *)rateForDate:(NSDate *)date {
  return [ERTRate MR_findFirstByAttribute:@"date"
                                withValue:date
                                inContext:self.managedObjectContext];
}

@end
