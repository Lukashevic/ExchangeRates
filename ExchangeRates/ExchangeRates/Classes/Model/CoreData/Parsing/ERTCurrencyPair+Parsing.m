//
//  ERTCurrencyPair+Parsing.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrencyPair+Parsing.h"
#import "NSDate+ERTDateFromString.h"
#import "ERTRate.h"

@implementation ERTCurrencyPair (Parsing)

- (void)parseData:(NSDictionary *)data {
  if (data[@"rates"]) {
    NSDate * date = [NSDate dateFromString:data[@"date"]];
    NSPredicate * predicate = [NSPredicate predicateWithFormat:@"date == %@", date];
    ERTRate * rate;
    if ([self.exchangeRates filteredSetUsingPredicate:predicate].count == 0) {
      rate = [ERTRate MR_createEntityInContext:self.managedObjectContext];
      rate.date = date;
      [self addExchangeRatesObject:rate];
    }
    rate.rateValue = data[@"rates"][self.transactionCurrencyName];
  }
}


@end
