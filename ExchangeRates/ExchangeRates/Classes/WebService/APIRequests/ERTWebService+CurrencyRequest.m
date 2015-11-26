//
//  ERTWebService+CurrencyRequest.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTWebService+CurrencyRequest.h"
#import "ERTCurrencyPair.h"
#import "ERTWebRequestInfo.h"
#import "ERTCurrencyPair+Parsing.h"

@implementation ERTWebService (CurrencyRequest)

- (void)ratesRequestWithCurrencyPair:(ERTCurrencyPair *)currencyPair
                          completion:(ERTWebServiceSimpleCompletion)completion {
  
  NSDictionary * params = @{@"base" : currencyPair.baseCurrencyName,
                            @"syblos" : currencyPair.transactionCurrencyName};
  ERTWebRequestInfo * requestInfo = [ERTWebRequestInfo requestWithHttpMethod:HTTPMethodGET parameters:params];
  
  [self sendRequestWithRequestInfo:requestInfo completion:^(NSError *error, id result) {

    if ([result isKindOfClass:[NSDictionary class]]) {
      [currencyPair parseData:result];
    }
    
    if (completion) {
      completion(error);
    }
  }];
}

@end
