//
//  ERTCurrencyPair+Parsing.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrencyPair+Parsing.h"
#import "NSDate+ERTDateFromString.h"
#import "NSCalendar+ERTDays.h"
#import "ERTRate.h"

@implementation ERTCurrencyPair (Parsing)

- (void)parseData:(NSDictionary *)data {
  if (data[@"rates"]) {
    self.lastUpdate = [NSDate date];
    NSDate * date = [NSDate dateFromString:data[@"date"]];
    ERTRate * rate = [self rateForDate:date];
    if (rate == nil) {
      rate = [ERTRate MR_createEntityInContext:self.managedObjectContext];
      rate.date = [NSDate dateFromString:data[@"date"]];
      [self addExchangeRatesObject:rate];
    }
    rate.rateValue = @([data[@"rates"][self.transactionCurrencyName] doubleValue]);
    [rate.managedObjectContext MR_saveToPersistentStoreAndWait];
  }
}


@end
