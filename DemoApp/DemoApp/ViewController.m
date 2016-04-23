//
//  ViewController.m
//  DemoApp
//
//  Created by khanh on 4/21/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "ViewController.h"
#import <DemoKit/DemoKit.h>
@interface ViewController ()<KLoginButtonDelegate>

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark LogiNButton Delegate
-(void)loginButtonDidLogOut:(KLoginButton *)loginButton{
//    KLoginButton* a=loginButton;
}
-(void)loginButton:(KLoginButton *)loginButton didCompleteWithResult:(KManagerResult *)result error:(NSError *)error{
//    KManagerResult*abc=result;
}
@end
