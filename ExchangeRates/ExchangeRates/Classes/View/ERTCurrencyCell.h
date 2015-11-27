//
//  ERTCurrencyCell.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import <UIKit/UIKit.h>

extern NSString * const ERTCurrencyCellId;

@interface ERTCurrencyCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel * currenciesLabel;

@end
