#import "ERTCurrencyPair.h"

@interface ERTCurrencyPair ()

// Private interface goes here.

@end

@implementation ERTCurrencyPair

- (NSDictionary *)webRequestParams {
  return @{@"base" : self.baseCurrencyName,
           @"syblos" : self.transactionCurrencyName};
}

- (NSString *)pairString {
  return [NSString stringWithFormat:@"%@ → %@",
          self.baseCurrencyName, self.transactionCurrencyName];
}
@end
