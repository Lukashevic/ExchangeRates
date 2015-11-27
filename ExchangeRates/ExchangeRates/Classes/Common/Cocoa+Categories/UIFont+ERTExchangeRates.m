//
//  UIFont+ERTExchangeRates.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "UIFont+ERTExchangeRates.h"

@implementation UIFont (ERTExchangeRates)

+ (UIFont *)currenciesListFont {
  return [UIFont fontWithName:@"Lato-Regular" size: 14.0];
}

+ (UIFont *)currenciesListSelectedFont {
  return [UIFont fontWithName:@"Lato-Black" size: 14.0];
}
@end
