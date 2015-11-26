//
//  ERTWebService+CurrencyRequest.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTWebService.h"

@class ERTCurrencyPair;

@interface ERTWebService (CurrencyRequest)

- (void)ratesRequestWithCurrencyPair:(ERTCurrencyPair *)currencyPair
                          completion:(ERTWebServiceSimpleCompletion)completion;
@end
