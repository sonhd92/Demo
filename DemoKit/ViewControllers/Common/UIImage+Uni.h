//
//  UIImage+Uni.h
//  Medic
//
//  Created by Ngo Ba Thuong on 3/25/14.
//  Copyright (c) 2014 NBT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Uni)

+ (UIImage *)imageWithColor:(UIColor *)color;
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size andRoundSize:(CGFloat)roundSize;
+ (UIImage *)stretch:(UIImage *)img;
+ (UIImage *)imageWithSize:(CGSize)size drawing:(void (^)(CGContextRef ctx, CGSize size))drawing;

- (UIImage *)stretch;


@end
