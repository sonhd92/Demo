//
//  KMiniShopViewController.h
//  DemoKit
//
//  Created by Hoang Duc Son on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KMiniShopViewControllerDelegate <NSObject>


@end
@interface KMiniShopViewController : UIViewController
@property (weak, nonatomic) IBOutlet id<KMiniShopViewControllerDelegate> delegate;

@end
