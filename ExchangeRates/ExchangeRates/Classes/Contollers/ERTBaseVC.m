//
//  ERTBaseVC.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 28.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "ERTBaseVC.h"

@interface ERTBaseVC ()

@end

@implementation ERTBaseVC

- (void)showAlertWithError:(NSError *)error {
  UIAlertController * alert = [UIAlertController alertControllerWithTitle:error.localizedDescription
                                                                  message:error.localizedFailureReason
                                                           preferredStyle:UIAlertControllerStyleAlert];
  UIAlertAction * action = [UIAlertAction actionWithTitle:@"OK"
                                                    style:UIAlertActionStyleDestructive
                                         handler:^(UIAlertAction *action) {
                                           [alert dismissViewControllerAnimated:YES completion:nil];
                                         }];
  [alert addAction:action];
  [self presentViewController:alert animated:YES completion:nil];
}

@end
