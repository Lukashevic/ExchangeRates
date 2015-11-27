//
//  ERTCurrencies.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ERTCurrencyPair;

@protocol ERTCurrenciesTableProtocol <NSObject>
- (void)currencyPairSelected:(ERTCurrencyPair *)pair;
@end

@interface ERTCurrenciesVC : UIViewController <UITabBarDelegate, UITableViewDataSource>

@property (nonatomic, weak) id <ERTCurrenciesTableProtocol> delegate;

@end
