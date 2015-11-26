//
//  ERTCurrencyPair+Parsing.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrencyPair+Parsing.h"
#import "NSDate+DateFromString.h"
#import "ERTRate.h"

@implementation ERTCurrencyPair (Parsing)

- (void)parseData:(NSDictionary *)data inContext:(NSManagedObjectContext *)context {
  
  if (data[@"date"]) {
    self.date = [NSDate dateFromString:data[@"date"]];
  }
  
  if (date[@"rates"]) {
    ERTRate * rate = [ERTRate MR_createEntityInContext:self.managedObjectContext];
    rate.rateValue = data[@"rates"][self.transactionCurrencyName];
    [self addExchangeRatesObject:rate];
  }
}

@end
