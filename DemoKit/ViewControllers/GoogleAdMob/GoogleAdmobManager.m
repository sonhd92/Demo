//
//  GoogleAdmobManager.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/27/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "GoogleAdmobManager.h"
#import <GoogleMobileAds/GoogleMobileAds.h>
@implementation GoogleAdmobManager{
    GADBannerView* bannerView;
}
+ (instancetype)sharedInstance {
    static GoogleAdmobManager *kdemo;
    static dispatch_once_t oneT;
    dispatch_once(&oneT, ^{
        kdemo = [GoogleAdmobManager new];
    });
    return kdemo;
}
- (void)showAdAtViewController:(UIViewController*)fromView position:(CGPoint)position adUnitID:(NSString*)adID{
    if (fromView) {
        CGRect fView=CGRectMake(position.x, position.y, 320, 50);
        UIView* v=[[UIView alloc] initWithFrame:fView];
        v.backgroundColor=[UIColor redColor];
        
        bannerView=[[GADBannerView alloc] initWithFrame:fView];
        [fromView.view sendSubviewToBack:bannerView];
        [fromView.view addSubview:v];
        bannerView.rootViewController=fromView;
        bannerView.adUnitID=adID;
        GADRequest *request = [GADRequest request];
        request.testDevices = @[
                                @"2077ef9a63d2b398840261c8221a0c9a"  // Eric's iPod Touch
                                ];
        [bannerView loadRequest:request];
    }
}
@end
