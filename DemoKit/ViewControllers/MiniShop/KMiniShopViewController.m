//
//  KMiniShopViewController.m
//  DemoKit
//
//  Created by Hoang Duc Son on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KMiniShopViewController.h"
#import <StoreKit/StoreKit.h>

@interface KMiniShopViewController () <
    UITableViewDelegate, UITableViewDataSource, SKPaymentTransactionObserver,
    SKProductsRequestDelegate>
@property(weak, nonatomic) IBOutlet UITableView *shopTableview;
@property(strong, nonatomic) NSArray *shopItems;

@property(strong, nonatomic) SKProduct *products;
@property(copy, nonatomic) NSString *productID;
@property(strong, nonatomic) NSSet *productSet;
@property(strong, nonatomic) SKProductsRequest *productRequest;
@property(strong, nonatomic) UIButton *buyButton;

@end

@implementation KMiniShopViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
  [self.navigationController setNavigationBarHidden:YES animated:animated];
  [super viewWillAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated {
  [self.navigationController setNavigationBarHidden:NO animated:animated];
  [super viewDidDisappear:animated];
}

- (void)viewDidLoad {
  [super viewDidLoad];

    self.buyButton.enabled = NO;
  self.productSet = [NSSet setWithObjects:@"vn.sohagame.appdemo.tuixu1",
                                          @"vn.sohagame.appdemo.tuixu2",
                                          @"vn.sohagame.appdemo.tuixu3", nil];
  self.productRequest =
      [[SKProductsRequest alloc] initWithProductIdentifiers:self.productSet];
  self.productRequest.delegate = self;
  [self.productRequest start];

  self.shopItems = [self.productSet allObjects];

  self.shopTableview.tableFooterView =
      [[UIView alloc] initWithFrame:CGRectZero];
  self.shopTableview.delaysContentTouches = NO;

  for (id view in self.shopTableview.subviews) {
    // looking for a UITableViewWrapperView
    if ([NSStringFromClass([view class])
            isEqualToString:@"UITableViewWrapperView"]) {
      // this test is necessary for safety and because a
      // "UITableViewWrapperView" is NOT a UIScrollView in iOS7
      if ([view isKindOfClass:[UIScrollView class]]) {
        // turn OFF delaysContentTouches in the hidden subview
        UIScrollView *scroll = (UIScrollView *)view;
        scroll.delaysContentTouches = NO;
      }
      break;
    }
  }
}

-(void)getProducts:(UIViewController *)viewController{
    if ([SKPaymentQueue canMakePayments]) {
        SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:self.productSet];
        request.delegate = self;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section {
  return [self.productSet count];
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

  self.productID = [self.shopItems objectAtIndex:indexPath.row];
  cell.textLabel.text = self.productID;

  self.buyButton =
      [[UIButton alloc] initWithFrame:CGRectMake(cell.frame.size.width - 50, 0,
                                                 50, cell.frame.size.height)];
  self.buyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [self.buyButton setTitle:@"Buy" forState:UIControlStateNormal];
  [self.buyButton addTarget:self
                     action:@selector(purchaseItem:)
           forControlEvents:UIControlEventTouchUpInside];
  [cell.contentView addSubview:self.buyButton];

  return cell;
}

- (void)tableView:(UITableView *)tableView
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (IBAction)purchaseItem:(UIButton *)button {
//  SKPayment *payment = [SKPayment paymentWithProduct:self.products];
//  [[SKPaymentQueue defaultQueue] addTransactionObserver:self];
//  [[SKPaymentQueue defaultQueue] addPayment:payment];
}

- (void)productsRequest:(SKProductsRequest *)request
     didReceiveResponse:(SKProductsResponse *)response {
    NSIndexPath *selectedIndexPath = [self.shopTableview
    indexPathForSelectedRow];
    UITableViewCell *selectedCell =
        [self.shopTableview cellForRowAtIndexPath:selectedIndexPath];

    NSArray *myProducts = response.products;
    if (myProducts.count != 0) {
        self.products = myProducts[0];
        self.buyButton.enabled = YES;
        selectedCell.textLabel.text = self.products.localizedTitle;
    }else{
        selectedCell.textLabel.text = @"Product not found";
    }
    myProducts = response.invalidProductIdentifiers;
    
    for (SKProduct *prod in myProducts) {
        NSLog(@"Product not foundABC: %@", prod);
    }
}

- (void)paymentQueue:(SKPaymentQueue *)queue
 updatedTransactions:(NSArray<SKPaymentTransaction *> *)transactions {
    for (SKPaymentTransaction *transaction in transactions) {
        switch (transaction.transactionState) {
            case SKPaymentTransactionStatePurchased: {
                [self unlockFeature];
                [[SKPaymentQueue defaultQueue] finishTransaction:transaction];
                break;
            }
            case SKPaymentTransactionStateFailed: {
                NSLog(@"Transaction Failed");
                [[SKPaymentQueue defaultQueue]
                 finishTransaction:transaction];
                break;
            }
        }
    }
}

-(void)unlockFeature{
    _buyButton.enabled = NO;
    [_buyButton setTitle:@"Purchased"
                forState:UIControlStateDisabled];
    
}
@end
