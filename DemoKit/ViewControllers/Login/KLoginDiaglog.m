//
//  KLoginDiaglog.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KLoginDiaglog.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
@interface KLoginDiaglog ()<FBSDKLoginButtonDelegate>
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *btnLoginFacebook;

@end

@implementation KLoginDiaglog

- (void)viewDidLoad {
    [super viewDidLoad];
    self.screenName=@"LoginDialog";
    self.btnLoginFacebook.readPermissions =@[@"public_profile", @"email", @"user_friends"];
}
- (void)returnResult:(KManagerResult *)result error:(NSError*)err{
    [self doClose:nil];
    if (_delegate) {
        [_delegate LoginDialogWithResult:result error:err];
    }
}
- (IBAction)doClose:(id)sender {
    [self.navigationController.view removeFromSuperview];
    [self.navigationController removeFromParentViewController];
}
#pragma mark Facebook Login Delegate
-(void)loginButton:(FBSDKLoginButton *)loginButton didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result error:(NSError *)error{
    if ([FBSDKAccessToken currentAccessToken]) {
        [[[FBSDKGraphRequest alloc] initWithGraphPath:@"me" parameters:@{@"fields":@"id,name,email"}]
         startWithCompletionHandler:^(FBSDKGraphRequestConnection *connection, id result, NSError *error) {
             KManagerResult * obj;
             if (!error) {
                 NSString* fbToken=[FBSDKAccessToken currentAccessToken].tokenString;
                 [AppCommon setToken:fbToken];
                 NSString* name=[result valueForKey:@"name"];
                 NSString *email=[result valueForKey:@"email"];
                 obj=[KManagerResult new];
                 obj.userName=[result valueForKey:@"name"];
                 obj.accessToken=fbToken;
                 obj.userEmail=email;
             }
             [self returnResult:obj error:error];
         }];
    }
}

-(void)loginButtonDidLogOut:(FBSDKLoginButton *)loginButton{
    [[NSNotificationCenter defaultCenter] postNotificationName:Notification_Logout object:nil];
}
@end
