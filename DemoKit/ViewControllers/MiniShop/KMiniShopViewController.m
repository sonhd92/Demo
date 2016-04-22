//
//  KMiniShopViewController.m
//  DemoKit
//
//  Created by Hoang Duc Son on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KMiniShopViewController.h"

@interface KMiniShopViewController () <UITableViewDelegate,
                                       UITableViewDataSource>
@property(weak, nonatomic) IBOutlet UITableView *shopTableview;
@property(strong, nonatomic) NSArray *shopItems;

@end

@implementation KMiniShopViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  self.shopItems =
      [NSArray arrayWithObjects:@"Remove Ads", @"100 Coin", @"1000 Coint", nil];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return [self.shopItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  NSString *identifier = @"cell";
  UITableViewCell *cell =
      [tableView dequeueReusableCellWithIdentifier:identifier];
  if (cell == nil) {
    cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                  reuseIdentifier:identifier];
  }
    cell.textLabel.text = [self.shopItems objectAtIndex:indexPath.row];
  return cell;
}
@end
