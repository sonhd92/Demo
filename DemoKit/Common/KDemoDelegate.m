//
//  KDemoDelegate.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KDemoDelegate.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@implementation KDemoDelegate
+ (instancetype)sharedInstance{
    static KDemoDelegate * kdemo;
    static dispatch_once_t *oneT;
    dispatch_once(&oneT, ^{
        kdemo=[KDemoDelegate new];
    });
    return kdemo;
}
- (BOOL)application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
    [FBSDKLoginButton class];
    [[FBSDKApplicationDelegate sharedInstance] application:application
                             didFinishLaunchingWithOptions:launchOptions];
    return YES;
}

- (BOOL)application:(UIApplication *)application
            openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication
         annotation:(id)annotation{
    return [[FBSDKApplicationDelegate sharedInstance] application:application
                                                          openURL:url
                                                sourceApplication:sourceApplication
                                                       annotation:annotation];
}
@end
