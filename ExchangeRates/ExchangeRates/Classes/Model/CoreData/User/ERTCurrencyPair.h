#import "_ERTCurrencyPair.h"

@interface ERTCurrencyPair : _ERTCurrencyPair {}

- (NSDictionary *)webRequestParams;
- (NSString *)pairStringValue;
- (ERTRate *)newestRate;
- (ERTRate *)yersterdayRate;
- (ERTRate *)rateForDate:(NSDate *)date;
- (CGFloat)ratesDifference;

@end
