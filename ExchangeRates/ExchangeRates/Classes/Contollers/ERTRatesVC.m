//
//  ViewController.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTRatesVC.h"
#import "ERTCurrenciesVC.h"

static NSString * const ERTListControllerId = @"listController";

@interface ERTRatesVC () <ERTCurrenciesTableProtocol>
@property (nonatomic, weak) IBOutlet NSLayoutConstraint * tableYposition;
@property (nonatomic, weak) IBOutlet UIView * listContainerView;
@property (nonatomic, weak) IBOutlet UIScrollView * scrollView;
@end

@implementation ERTRatesVC

- (void)viewDidLoad {
  [super viewDidLoad];
  
  UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
  [refreshControl addTarget:self action:@selector(testRefresh:) forControlEvents:UIControlEventValueChanged];
  [self.scrollView addSubview:refreshControl];
}

- (void)testRefresh:(UIRefreshControl *)refreshControl
{
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    [refreshControl endRefreshing];
  });
}

- (void)prepareForSegue:(UIStoryboardSegue*)segue sender:(id)sender {
  if ([segue.identifier isEqualToString:ERTListControllerId]) {
    ERTCurrenciesVC * listVC = segue.destinationViewController;
    listVC.delegate = self;
  }
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

- (IBAction)showOrHideList:(id)sender {
  [self setListYpostion:0];
}


#pragma mark - ERTCurrenciesTableProtocol

- (void)currencyPairSelected:(ERTCurrencyPair *)pair {
  [self hideList];
}

@end
