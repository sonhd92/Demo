//
//  KDemo.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/27/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KDemo.h"
#import "GoogleAdmobManager.h"
@implementation KDemo
+ (void)showAdAtViewController:(UIViewController*)fromView position:(CGPoint)miniLibAdPosition adUnitID:(NSString*)adID{
    [[GoogleAdmobManager sharedInstance] showAdAtViewController:fromView position:miniLibAdPosition adUnitID:adID];
}
@end
