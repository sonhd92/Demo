//
//  KMiniShopCustomButton.m
//  DemoKit
//
//  Created by Hoang Duc Son on 4/25/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KMiniShopCustomButton.h"
#import "KMiniShopViewController.h"

@implementation KMiniShopCustomButton

- (void)showMiniShop {
  KMiniShopViewController *vc = [[KMiniShopViewController alloc] init];
  NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
  vc = [[KMiniShopViewController alloc]
      initWithNibName:@"KMiniShopViewController"
               bundle:frameworkBundle];
  vc.delegate = self;
  UINavigationController *nav =
      [[UINavigationController alloc] initWithRootViewController:vc];
  nav.navigationBarHidden = YES;
  UIViewController *parentVC =
      (UIViewController *)[self.superview nextResponder];
  [parentVC addChildViewController:nav];
  [parentVC.view addSubview:nav.view];
}

@end
