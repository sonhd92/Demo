//
//  AppCommon.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "AppCommon.h"
@implementation AppCommon
+ (NSString*)getToken{
    NSString * token=[[NSUserDefaults standardUserDefaults] objectForKey:TOKEN];
    return token;
}
+ (void)setToken:(id)token{
    [[NSUserDefaults standardUserDefaults] setObject:token forKey:TOKEN];
}
@end
