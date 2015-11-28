#import "ERTCurrencyPair.h"
#import "NSCalendar+ERTDays.h"
#import "ERTRate.h"

@interface ERTCurrencyPair ()

// Private interface goes here.

@end

@implementation ERTCurrencyPair

- (NSDictionary *)webRequestParams {
  return @{@"base" : self.baseCurrencyName,
           @"symbols" : self.transactionCurrencyName};
}

- (NSString *)pairStringValue {
  return [NSString stringWithFormat:@"%@ → %@",
          self.baseCurrencyName, self.transactionCurrencyName];
}

- (ERTRate *)newestRate {
  NSDate * date = [NSCalendar today];
  ERTRate * rate = [self rateForDate:date];
  if (rate == nil) {
    rate = [self yersterdayRate];
  }
  return rate;
}

- (ERTRate *)yersterdayRate {
  NSDate * date = [NSCalendar yesterday];
  return [self rateForDate:date];
}

- (ERTRate *)rateForDate:(NSDate *)date {
  NSPredicate * predicate = [NSPredicate predicateWithFormat:@"date == %@", date];
  NSArray * arr = [self.exchangeRates filteredSetUsingPredicate:predicate].allObjects;
  ERTRate * rate;
  if (arr.count) {
    rate = arr[0];
  }
  return rate;
}

- (CGFloat)ratesDifference {
  double a = self.newestRate.rateValueValue;
  double b = self.yersterdayRate.rateValueValue;
  
  CGFloat difference = 100 * a / b - 100;
  return difference;
}

@end
