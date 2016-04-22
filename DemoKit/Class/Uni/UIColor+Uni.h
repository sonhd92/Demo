//
//  UIColor+Uni.h
//  Medic
//
//  Created by KVip on 3/12/14.
//  Copyright (c) 2014 NBT. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Uni)

+ (UIColor *) colorWithString: (NSString *) str;
+ (UIColor *)colorWithRGB:(NSUInteger)color;
+ (UIColor *)random;

@end
