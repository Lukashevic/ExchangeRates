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
static NSInteger const ERTDefaultRatesPostion = 90;
static NSInteger const ERTTopRatesPostion = 18;

@interface ERTRatesVC ()
@property (nonatomic, strong) ERTCurrencyPair * currecnyPair;
@property (nonatomic, strong) NSDate * lastUpdate;
@property (nonatomic, assign) BOOL listShowed;
@end

@implementation ERTRatesVC

- (void)dealloc {
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.ratesView.hidden = YES;
  self.currecnyPair = [ERTCurrencyPair MR_findFirstOrCreateByAttribute:@"selectedPair"
                                                             withValue:@(YES)];
  [self currencyRequest];
  [self configureUpdateTime];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(currencyRequest)
                                               name:UIApplicationWillResignActiveNotification
                                             object:nil];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(currencyRequest)
                                               name:ERTReachabilityStatusReachableNotification
                                             object:nil];
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

- (IBAction)showList:(id)sender {
  self.listShowed = YES;
  [self setListYpostion:0 ratesYposition:ERTTopRatesPostion];
}

#pragma mark - Private

- (void)setListYpostion:(CGFloat)listPosition ratesYposition:(CGFloat)ratesPosition {

  self.tableYposition.constant = listPosition;
  self.ratesYposition.constant = ratesPosition;
  
  [UIView animateWithDuration:0.3
                        delay:0
                      options:UIViewAnimationOptionCurveEaseInOut
                   animations:^{
                     [self.view layoutIfNeeded];
                     
                   } completion:nil];

}

- (void)hideList {
  if (self.listShowed) {
    self.listShowed = NO;
    [self setListYpostion:-self.listContainerView.frame.size.height
           ratesYposition:ERTDefaultRatesPostion];
  }
}

- (void)reloadData {
  self.ratesView.hidden = NO;
  [self configureRates];
}

- (void)currencyRequest {
  [self.activity startAnimating];
  [[ERTWebService defaultWebService] ratesRequestWithCurrencyPair:self.currecnyPair
                                                       completion:^(NSError *error)
  {
    [self.activity stopAnimating];
    if (error) {
      [self showAlertWithError:error];
    }
    else {
      self.lastUpdate = [NSDate date];
      [self reloadData];
    }
  }];
}

#pragma mark - ERTCurrenciesTableProtocol

- (void)currencyPairSelected:(ERTCurrencyPair *)pair {
  self.currecnyPair = pair;
  self.ratesHistoryLabel.hidden = YES;
  self.ratesValueLabel.hidden = YES;
  [self hideList];
  [self currencyRequest];
}

@end
