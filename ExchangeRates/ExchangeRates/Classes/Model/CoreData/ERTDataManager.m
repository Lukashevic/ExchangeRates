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
    
    [MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
      for (NSDictionary * data in array) {
        ERTCurrencyPair * pair = [ERTCurrencyPair MR_createEntity];
        pair.baseCurrencyName = data[@"baseCurrencyName"];
        pair.transactionCurrencyName = data[@"transactionCurrencyName"];
        if (data[@"selectedPair"]) {
          pair.selectedPair = @(YES);
        }
      }
    }];
  }
}

@end
