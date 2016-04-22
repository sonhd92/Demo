//
//  UIColor+Uni.m
//  Medic
//
//  Created by Ngo Ba Thuong on 3/12/14.
//  Copyright (c) 2014 NBT. All rights reserved.
//

#import "UIColor+Uni.h"

@implementation UIColor (Uni)

+ (UIColor *)random
{
    float r = rand()%255;
    float g = rand()%255;
    float b = rand()%255;
    
    return [UIColor colorWithRed:r/255. green:g/255. blue:b/255. alpha:1];
}

+ (UIColor *)colorWithRGB:(NSUInteger)color
{
    CGFloat r,g,b;
    r = (color >> 16) & 0xFF;
    g = (color >> 8) & 0xFF;
    b = color & 0xFF;
    
     UIColor *c = [[UIColor alloc] initWithRed:r/255.f green:g/255.f blue:b/255.f alpha:1];
    return c;
}

+ (CGFloat) colorComponentFrom: (NSString *) string start: (NSUInteger) start length: (NSUInteger) length {
    NSString *substring = [string substringWithRange: NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat: @"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString: fullHex] scanHexInt: &hexComponent];
    return hexComponent / 255.0;
}

+ (UIColor *) colorWithString: (NSString *) str;
{
    str = [[str stringByReplacingOccurrencesOfString: @"#" withString: @""] uppercaseString];
    CGFloat alpha, red, blue, green;
    switch ([str length]) {
        case 3: // #RGB
            alpha = 1.0f;
            red   = [self colorComponentFrom: str start: 0 length: 1];
            green = [self colorComponentFrom: str start: 1 length: 1];
            blue  = [self colorComponentFrom: str start: 2 length: 1];
            break;
        case 4: // #ARGB
            alpha = [self colorComponentFrom: str start: 0 length: 1];
            red   = [self colorComponentFrom: str start: 1 length: 1];
            green = [self colorComponentFrom: str start: 2 length: 1];
            blue  = [self colorComponentFrom: str start: 3 length: 1];
            break;
        case 6: // #RRGGBB
            alpha = 1.0f;
            red   = [self colorComponentFrom: str start: 0 length: 2];
            green = [self colorComponentFrom: str start: 2 length: 2];
            blue  = [self colorComponentFrom: str start: 4 length: 2];
            break;
        case 8: // #AARRGGBB
            alpha = [self colorComponentFrom: str start: 0 length: 2];
            red   = [self colorComponentFrom: str start: 2 length: 2];
            green = [self colorComponentFrom: str start: 4 length: 2];
            blue  = [self colorComponentFrom: str start: 6 length: 2];
            break;
            
        default:
            return nil;
    }
    
    return [UIColor colorWithRed: red green: green blue: blue alpha: alpha];

}

@end
