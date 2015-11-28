//
//  ERTCurrencies.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTCurrenciesVC.h"
#import "ERTCurrencyPair.h"
#import "ERTCurrencyCell+Configuration.h"

@interface ERTCurrenciesVC ()
@property (nonatomic, assign) IBOutlet UITableView * tableView;
@property (nonatomic, strong) NSArray * dataArray;
@end

@implementation ERTCurrenciesVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.dataArray = [ERTCurrencyPair MR_findAll];
  [self configureTable];
}

- (void)configureTable {
  [self.tableView registerNib:[UINib nibWithNibName:@"ERTCurrencyCell" bundle:nil]
       forCellReuseIdentifier:ERTCurrencyCellId];
}

- (void)newSelectedPair:(ERTCurrencyPair *)pair {
  ERTCurrencyPair * oldSelectedPair =
    [ERTCurrencyPair MR_findFirstByAttribute:@"selectedPair" withValue:@(YES)];
  oldSelectedPair.selectedPair = @(NO);
  pair.selectedPair = @(YES);
  [pair.managedObjectContext MR_saveOnlySelfAndWait];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView
  willDisplayCell:(nonnull ERTCurrencyCell *)cell
forRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
  ERTCurrencyPair * pair = self.dataArray[indexPath.row];
  [cell configureWithCurrencyPair:pair];
  if (pair.selectedPairValue) {
    [tableView selectRowAtIndexPath:indexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
  }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  if ([self.delegate respondsToSelector:@selector(currencyPairSelected:)]) {
    [self.delegate currencyPairSelected:self.dataArray[indexPath.row]];
  }
  [self newSelectedPair:self.dataArray[indexPath.row]];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  return [self.tableView dequeueReusableCellWithIdentifier:ERTCurrencyCellId];
}

@end
