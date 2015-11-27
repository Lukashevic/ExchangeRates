//
//  ERTRatesVC+RatesConfiguration.m
//  ExchangeRates
//

#import "ERTRatesVC+RatesConfiguration.h"
#import "ERTRate.h"

@implementation ERTRatesVC (RatesConfiguration)

- (void)configureRates {
  self.ratesTitleLabel.text = self.currentCurrencyPair.pairStringValue;
  self.ratesValueLabel.text =
    [NSString stringWithFormat:@"%.3d", self.currentCurrencyPair.newestRate.rateValueValue];
}
@end
