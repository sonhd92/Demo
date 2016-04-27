//
//  ViewController.m
//  DemoApp
//
//  Created by khanh on 4/21/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "ShowMiniShopViewController.h"
#import "ViewController.h"
#import <DemoKit/DemoKit.h>
#import <GoogleMobileAds/GoogleMobileAds.h>
@interface ViewController () <KLoginButtonDelegate>

@property(strong, nonatomic) ShowMiniShopViewController *shopVC;

@end

@implementation ViewController{
    GADBannerView* bannerView;
}

- (void)viewDidLoad {
  [super viewDidLoad];
    CGPoint pAdmob=CGPointMake([UIScreen mainScreen].bounds.size.width/2-160, [UIScreen mainScreen].bounds.size.height-50);
    //Google Admob
//    [KDemo showAdAtViewController:self position:pAdmob adUnitID:@"ca-app-pub-3940256099942544/2934735716"];
}

#pragma mark LogiNButton Delegate
- (void)loginButtonDidLogOut:(KLoginButton *)loginButton {
  //    KLoginButton* a=loginButton;
}
- (void)loginButton:(KLoginButton *)loginButton
    didCompleteWithResult:(KManagerResult *)result
                    error:(NSError *)error {
  self.shopVC =
      [self.storyboard instantiateViewControllerWithIdentifier:@"miniShop"];
  [self.navigationController pushViewController:self.shopVC animated:YES];
}
@end
