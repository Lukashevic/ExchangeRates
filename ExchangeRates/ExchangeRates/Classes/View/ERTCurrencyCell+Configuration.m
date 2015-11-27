//
//  ERTCurrencyCell+Configuration.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrencyCell+Configuration.h"
#import "ERTCurrencyPair.h"

@implementation ERTCurrencyCell (Configuration)

- (void)configureWithCurrencyPair:(ERTCurrencyPair *)currencies {
  self.currenciesLabel.text = currencies.pairString;
}


@end
