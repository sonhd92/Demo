//
//  KMiniShopCustomButton.h
//  DemoKit
//
//  Created by Hoang Duc Son on 4/25/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KMiniShopCustomButtonDelegate <NSObject>

@end
@interface KMiniShopCustomButton : UIButton
@property(weak, nonatomic) IBOutlet id<KMiniShopCustomButtonDelegate> delegate;
- (void)showMiniShop;
@end
