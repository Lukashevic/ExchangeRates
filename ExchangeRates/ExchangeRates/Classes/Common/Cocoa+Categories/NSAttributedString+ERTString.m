//
//  NSAttributedString+ERTString.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 28.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "NSAttributedString+ERTString.h"

@implementation NSAttributedString (ERTString)

+ (NSAttributedString *)attributedStringWithString:(NSString *)string
                                           kerning:(CGFloat)kerning
                                       lineSpacing:(CGFloat)spaciing {
  NSRange textRange = NSMakeRange(0, string.length);
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
  NSMutableDictionary * attributes = [NSMutableDictionary new];

  if (kerning) {
    [attributes addEntriesFromDictionary:@{NSKernAttributeName : @(kerning)}];
  }
  
  if (spaciing) {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = spaciing;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName: paragraphStyle};
    [attributedString addAttributes:attributes range:textRange];
  }

  [attributedString addAttributes:attributes range:textRange];
  return attributedString;
}
@end
