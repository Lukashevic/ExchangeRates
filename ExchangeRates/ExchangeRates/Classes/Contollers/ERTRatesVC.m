//
//  ViewController.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTRatesVC.h"
#import "ERTRatesVC+RatesConfiguration.h"
#import "ERTWebService+CurrencyRequest.h"

static NSString * const ERTListControllerId = @"listController";

@interface ERTRatesVC ()
@property (nonatomic, strong) ERTCurrencyPair * currecnyPair;
@property (nonatomic, strong) UIRefreshControl * refreshControl;
@end

@implementation ERTRatesVC

- (void)viewDidLoad {
  [super viewDidLoad];
  [self configureRefreshControl];
  
  self.ratesView.hidden = YES;
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:ERTListControllerId]) {
    ERTCurrenciesVC * listVC = segue.destinationViewController;
    listVC.delegate = self;
  }
}

- (ERTCurrencyPair *)currentCurrencyPair {
  return self.currecnyPair;
}

#pragma mark - Actions

- (IBAction)showOrHideList:(id)sender {
  [self setListYpostion:0];
}

#pragma mark - Private

- (void)configureRefreshControl {
  self.refreshControl = [[UIRefreshControl alloc] init];
  [self.refreshControl addTarget:self
                          action:@selector(currencyRequest)
                forControlEvents:UIControlEventValueChanged];
  [self.scrollView addSubview:self.refreshControl];
}

- (void)setListYpostion:(CGFloat)yPosition {

  self.tableYposition.constant = yPosition;
  
  [UIView animateWithDuration:0.3
                        delay:0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     [self.view layoutIfNeeded];
                     
                   } completion:^(BOOL finished) {
                   }];

}

- (void)hideList {
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)),
                 dispatch_get_main_queue(), ^{
                   [self setListYpostion:- self.listContainerView.frame.size.height];
                 });
}

- (void)reloadData {
  self.ratesView.hidden = NO;
  [self configureRates];
}

- (void)currencyRequest {
  [self.refreshControl beginRefreshing];
  [[ERTWebService defaultWebService] ratesRequestWithCurrencyPair:self.currecnyPair
                                                       completion:^(NSError *error)
  {
    [self.refreshControl endRefreshing];

    if (error) {
      //TOTO Show error here!!!
    }
    else {
      [self reloadData];
    }
  }];
}

#pragma mark - ERTCurrenciesTableProtocol

- (void)currencyPairSelected:(ERTCurrencyPair *)pair {
  self.currecnyPair = pair;
  [self hideList];
}

@end
