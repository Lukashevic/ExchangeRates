//
//  AppDelegate.m
//  ExchangeRates
//
//  Created by Max Lukashevich on 26.11.15.
//  Copyright © 2015 mlukashevich. All rights reserved.
//

#import "AppDelegate.h"
#import "ERTDataManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

  [MagicalRecord setShouldDeleteStoreOnModelMismatch:YES];
  [MagicalRecord enableShorthandMethods];
  [MagicalRecord setupAutoMigratingCoreDataStack];
  [MagicalRecord setLoggingLevel:MagicalRecordLoggingLevelError];
  
  [ERTDataManager prefillDataIfNeed];
  [DDLog addLogger:[DDTTYLogger sharedInstance]];

  return YES;
}

@end
