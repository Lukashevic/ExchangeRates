//
//  ViewController.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ERTCurrenciesVC.h"
#import "ERTCurrencyPair.h"

#define Localized(string) NSLocalizedStringFromTable(string, @"ERTLocalizedStrings", nil)

@interface ERTRatesVC : UIViewController <ERTCurrenciesTableProtocol>

@property (nonatomic, weak) IBOutlet NSLayoutConstraint * tableYposition;

@property (nonatomic, weak) IBOutlet UIView * listContainerView;
@property (nonatomic, weak) IBOutlet UIView * ratesView;

@property (nonatomic, weak) IBOutlet UIScrollView * scrollView;

@property (nonatomic, weak) IBOutlet UILabel * ratesTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * ratesValueLabel;
@property (nonatomic, weak) IBOutlet UILabel * ratesHistoryLabel;

- (ERTCurrencyPair *)currentCurrencyPair;


@end

