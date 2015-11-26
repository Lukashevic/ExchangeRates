//
//  ERTCurrencyPair+Parsing.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrencyPair.h"

@interface ERTCurrencyPair (Parsing)

- (void)parseData:(NSDictionary *)data;

@end
