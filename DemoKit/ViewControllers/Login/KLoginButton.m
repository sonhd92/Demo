//
//  KLoginButton.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KLoginButton.h"
#import "AppCommon.h"
#import "KLoginDiaglog.h"
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface KLoginButton()<KLoginDiaglogDelegate>
@end
@implementation KLoginButton{
    UIViewController *_fromViewController;
    KLoginDiaglog *vc;
}
-(void)awakeFromNib{
    [super awakeFromNib];
    self.backgroundColor=[UIColor colorWithString:@"#3085D3"];
    [self setTitle:@"Sign In" forState:UIControlStateNormal];
    [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self initLoginButton];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(doLogout) name:Notification_Logout object:nil];
}
- (void)initLoginButton{
    _fromViewController=(UIViewController*)[self.superview nextResponder];
    NSString* token=[AppCommon getToken];
    if (!token) {
        [self removeTarget:self action:@selector(onLogout) forControlEvents:UIControlEventTouchUpInside];
        [self setTitle:@"Sign In" forState:UIControlStateNormal];
        [self addTarget:self action:@selector(onMoveLoginDialog) forControlEvents:UIControlEventTouchUpInside];
    }else{
        [self removeTarget:self action:@selector(onMoveLoginDialog) forControlEvents:UIControlEventTouchUpInside];
        [self setTitle:@"Log out" forState:UIControlStateNormal];
        [self addTarget:self action:@selector(onLogout) forControlEvents:UIControlEventTouchUpInside];
    }
}
- (void)onMoveLoginDialog{
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    vc=[[KLoginDiaglog alloc] initWithNibName:@"KLoginDiaglog" bundle:frameworkBundle];
    vc.delegate=self;
    UINavigationController* nav=[[UINavigationController alloc] initWithRootViewController:vc];
    nav.navigationBarHidden=YES;
    UIViewController *parentVC=(UIViewController*)[self.superview nextResponder];
    [parentVC addChildViewController:nav];
    [parentVC.view addSubview:nav.view];

}
- (void)onLogout{
    UIAlertController *alertController = [UIAlertController
                                          alertControllerWithTitle:@""
                                          message:@"Bạn có muốn đăng xuất?"
                                          preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"Huỷ" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *logoutAction=[UIAlertAction actionWithTitle:@"Đăng xuất" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
        [self doLogout];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:logoutAction];
    [_fromViewController presentViewController:alertController animated:YES completion:nil];
}
- (void)doLogout{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:TOKEN];
    [[FBSDKLoginManager new] logOut];
    [self initLoginButton];
    [self returnLogout];
}
- (void) returnLogout{
    if (_delegate) {
        [_delegate loginButtonDidLogOut:self];
    }
}
#pragma mark LoginDialog Delegate
-(void)LoginDialogWithResult:(KManagerResult *)result error:(NSError *)error{
    [self initLoginButton];
    [self returnResult:result error:error];
}
- (void)returnResult:(KManagerResult*)result error:(NSError*)err{
    if (_delegate) {
        [_delegate loginButton:self didCompleteWithResult:result error:err];
    }
}
@end
