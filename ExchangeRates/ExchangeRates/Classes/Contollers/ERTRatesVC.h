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
#import "ERTBaseVC.h"

#define Localized(string) NSLocalizedStringFromTable(string, @"ERTLocalizedStrings", nil)

@interface ERTRatesVC : ERTBaseVC <ERTCurrenciesTableProtocol>

@property (nonatomic, weak) IBOutlet NSLayoutConstraint * tableYposition;
@property (nonatomic, weak) IBOutlet NSLayoutConstraint * ratesYposition;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView * activity;

@property (nonatomic, weak) IBOutlet UIView * listContainerView;
@property (nonatomic, weak) IBOutlet UIView * ratesView;

@property (nonatomic, weak) IBOutlet UILabel * ratesTitleLabel;
@property (nonatomic, weak) IBOutlet UILabel * ratesValueLabel;
@property (nonatomic, weak) IBOutlet UILabel * ratesHistoryLabel;
@property (nonatomic, weak) IBOutlet UILabel * updateTimeLabel;

@property (nonatomic, strong) ERTCurrencyPair * currentCurrencyPair;

@end

