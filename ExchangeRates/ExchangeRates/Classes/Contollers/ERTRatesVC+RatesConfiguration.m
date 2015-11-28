//
//  ERTRatesVC+RatesConfiguration.m
//  ExchangeRates
//

#import "ERTRatesVC+RatesConfiguration.h"
#import "ERTRate.h"
#import "NSAttributedString+ERTString.h"
#import "NSDate+ERTDateFromString.h"


#define UIColorWithRGBColor(R,G,B) [UIColor colorWithRed:(CGFloat)(R)/255.0 green:(CGFloat)(G)/255.0 blue:(CGFloat)(B)/255.0 alpha:1.0]

@implementation ERTRatesVC (RatesConfiguration)

- (void)configureRates {
  self.ratesTitleLabel.attributedText = [NSAttributedString attributedStringWithString:self.currentCurrencyPair.pairStringValue
                                                                               kerning:1
                                                                           lineSpacing:0];
  
  NSString * string = [NSString stringWithFormat:@"%.3f", self.currentCurrencyPair.newestRate.rateValueValue];
  string = [string stringByReplacingOccurrencesOfString:@"." withString:@","];
  self.ratesValueLabel.attributedText = [NSAttributedString attributedStringWithString:string
                                                                               kerning:-4
                                                                           lineSpacing:0];
  
  self.ratesHistoryLabel.attributedText = [NSAttributedString attributedStringWithString:[self ratesDiffrentString]
                                                                                 kerning:0
                                                                             lineSpacing:-3];

  self.ratesHistoryLabel.hidden = NO;
  self.ratesValueLabel.hidden = NO;
  [self configureHistoryLabel];
  [self configureUpdateTime];
}

- (void)configureUpdateTime {
  if (self.currentCurrencyPair.lastUpdate) {
    NSString * time = [NSDate lastUpdateString:self.currentCurrencyPair.lastUpdate];
    NSString * formatedString = [NSString stringWithFormat:@"%@ %@", Localized(@"updated"), time];
    self.updateTimeLabel.attributedText = [NSAttributedString attributedStringWithString:formatedString
                                                                                 kerning:2
                                                                             lineSpacing:0];
  }
}

- (NSString *)ratesDiffrentString {
  NSString * string;
  NSInteger value = roundf(self.currentCurrencyPair.ratesDifference);

  if (value == 0 || value > 0) {
    string = [NSString stringWithFormat:Localized(@"up_string"),
                Localized(self.currentCurrencyPair.baseCurrencyName), value];
  }
  else {
    string = [NSString stringWithFormat:Localized(@"down_string"),
                Localized(self.currentCurrencyPair.baseCurrencyName), value];
  }
  
  if (value == 0) {
    string = [string stringByAppendingString:Localized(@"postfix0")];
  }
  else if (value > 1) {
    string = [string stringByAppendingString:Localized(@"postfix2")];
  }
  return string;
}

- (void)configureHistoryLabel {
  UIColor * color;
  if (self.currentCurrencyPair.ratesDifference >= 0) {
    color = UIColorWithRGBColor(126, 211, 33);
  }
  else {
    color = UIColorWithRGBColor(202, 0, 20);
  }
  self.ratesHistoryLabel.textColor = color;
}

@end
