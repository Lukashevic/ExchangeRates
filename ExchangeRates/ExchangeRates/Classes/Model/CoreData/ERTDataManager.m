//
//  ERTDataManager.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTDataManager.h"
#import "ERTCurrencyPair.h"

@implementation ERTDataManager

+ (void)prefillDataIfNeed {
  if ([ERTCurrencyPair MR_findAll].count == 0) {
    NSString * path = [[NSBundle mainBundle] pathForResource:@"CurrenciesList" ofType:@"plist"];
    NSArray * array = [NSArray arrayWithContentsOfFile:path];
    NSManagedObjectContext * context = [NSManagedObjectContext defaultContext];
    for (NSDictionary * data in array) {
      ERTCurrencyPair * pair = [ERTCurrencyPair MR_createEntityInContext:context];
      pair.baseCurrencyName = data[@"baseCurrencyName"];
      pair.transactionCurrencyName = data[@"transactionCurrencyName"];
      if (data[@"selectedPair"]) {
        pair.selectedPair = @(YES);
      }
    }
    [context MR_saveToPersistentStoreAndWait];
  }
}

@end
