//
//  KLoginButton.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KLoginButton.h"

@implementation KLoginButton
-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor=[UIColor colorWithString:@"#3085D3"];
    [self setTitle:@"Login" forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

@end
