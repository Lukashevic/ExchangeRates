//
//  NSAttributedString+ERTString.h
//  ExchangeRates
//
//  Created by Max Lukashevich on 28.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSAttributedString (ERTString)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                           kerning:(CGFloat)kerning
                                       lineSpacing:(CGFloat)spaciing;
@end
