//
//  ERTCurrencyCell.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrencyCell.h"
#import "UIFont+ERTExchangeRates.h"

NSString * const ERTCurrencyCellId = @"ERTCurrencyCellId";

@implementation ERTCurrencyCell

- (void)awakeFromNib {
  self.layoutMargins = UIEdgeInsetsZero;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
  [super setSelected:selected animated:animated];
 
  if (selected) {
    self.currenciesLabel.font = [UIFont currenciesListSelectedFont];
    self.currenciesLabel.alpha = 1;
  }
  else {
    self.currenciesLabel.font = [UIFont currenciesListFont];
    self.currenciesLabel.alpha = 0.7;
  }
}

@end
