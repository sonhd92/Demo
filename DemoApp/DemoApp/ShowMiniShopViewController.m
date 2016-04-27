//
//  ShowMiniShopViewController.m
//  DemoApp
//
//  Created by Hoang Duc Son on 4/25/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "ShowMiniShopViewController.h"
#import <DemoKit/DemoKit.h>

@interface ShowMiniShopViewController () <KMiniShopCustomButtonDelegate>
@property (weak, nonatomic) IBOutlet KMiniShopCustomButton *showShopButton;

@end

@implementation ShowMiniShopViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
    if ([self respondsToSelector:@selector(edgesForExtendedLayout)])
        self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}
- (IBAction)showMiniShop:(id)sender {
  [_showShopButton showMiniShop];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little
preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
