#import "_ERTCurrencyPair.h"

@interface ERTCurrencyPair : _ERTCurrencyPair {}

- (NSDictionary *)webRequestParams;
- (NSString *)pairStringValue;
- (ERTRate *)newestRate;
- (ERTRate *)yersterdayRate;

@end
