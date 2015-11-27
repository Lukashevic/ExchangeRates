//
//  ERTSpacingLabel.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 27.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTLabel.h"

@implementation ERTLabel

- (void)setText:(NSString *)text {
  NSRange textRange = NSMakeRange(0, text.length);
  NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
  [attributedString addAttribute:NSKernAttributeName
                           value:@(self.letterSpacing)
                           range:textRange];
  
  if (self.lineSpacing) {
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = self.lineSpacing;
    paragraphStyle.alignment = self.textAlignment;
    NSDictionary *attributes = @{NSParagraphStyleAttributeName: paragraphStyle};
    [attributedString addAttributes:attributes range:textRange];
  }
  self.attributedText = attributedString;
}

@end
