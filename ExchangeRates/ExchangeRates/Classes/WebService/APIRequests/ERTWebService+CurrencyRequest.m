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
#import "NSDate+ERTDateFromString.h"

@implementation ERTWebService (CurrencyRequest)

- (void)ratesRequestWithCurrencyPair:(ERTCurrencyPair *)currencyPair
                          completion:(ERTWebServiceSimpleCompletion)completion {
  
  if (currencyPair.exchangeRates.count == 0) {
    [self ratesRequestWithCurrencyPair:currencyPair forToday:NO completion:^(NSError *error) {
      if (error && completion) {
        completion(error);
      }
      else if (error == nil) {
        [self ratesRequestWithCurrencyPair:currencyPair forToday:YES completion:completion];
      }
    }];
  }
  else {
    [self ratesRequestWithCurrencyPair:currencyPair forToday:YES completion:completion];
  }
}

- (void)ratesRequestWithCurrencyPair:(ERTCurrencyPair *)currencyPair
                           forToday:(BOOL)today
                          completion:(ERTWebServiceSimpleCompletion)completion {
  

  ERTWebRequestInfo * requestInfo = [ERTWebRequestInfo requestWithHttpMethod:HTTPMethodGET
                                                                        path:today ? nil : [NSDate yesterdayDateString]
                                                                  parameters:[currencyPair webRequestParams]];
  
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
