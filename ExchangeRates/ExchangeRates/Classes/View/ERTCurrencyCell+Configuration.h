//
//  ERTCurrencyCell+Configuration.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrencyCell.h"

@class ERTCurrencyPair;
@interface ERTCurrencyCell (Configuration)
- (void)configureWithCurrencyPair:(ERTCurrencyPair *)currencies;
@end
