//
//  UIImage+Uni.m
//  Medic
//
//  Created by Ngo Ba Thuong on 3/25/14.
//  Copyright (c) 2014 NBT. All rights reserved.
//

#import "UIImage+Uni.h"

@implementation UIImage (Uni)
+ (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size andRoundSize:(CGFloat)roundSize {
    
    CGRect rect = CGRectMake(0.0f, 0.0f, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    if (roundSize > 0) {
        UIBezierPath* roundedRectanglePath = [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius: roundSize];
        [color setFill];
        [roundedRectanglePath fill];
    } else {
        CGContextSetFillColorWithColor(context, [color CGColor]);
        CGContextFillRect(context, rect);
        
    }
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

+ (UIImage *)imageWithSize:(CGSize)size drawing:(void (^)(CGContextRef ctx, CGSize size))drawing;
{
    int pixelsWide = size.width;
	int pixelsHigh = size.height;
    CGContextRef    context = NULL;
    CGColorSpaceRef colorSpace;
    void *          bitmapData;
    int             bitmapByteCount;
    int             bitmapBytesPerRow;
    
    bitmapBytesPerRow   = (pixelsWide * 4); //4
    bitmapByteCount     = (bitmapBytesPerRow * pixelsHigh);
    
    bitmapData = malloc( bitmapByteCount );
    memset(bitmapData, 0, bitmapByteCount);  // set memory to black, alpha 0
    if (bitmapData == NULL)
    {
        return NULL;
    }
    
	colorSpace = CGColorSpaceCreateDeviceRGB();
	context = CGBitmapContextCreate (bitmapData, // instead of bitmapData
                                     pixelsWide,
                                     pixelsHigh,
                                     8,      // bits per component
                                     bitmapBytesPerRow,
                                     colorSpace,
                                     (CGBitmapInfo)kCGImageAlphaPremultipliedFirst);
    CGContextSetFillColorSpace(context, colorSpace);
	CGColorSpaceRelease(colorSpace);
    
    
    if (context == NULL)
    {
        free (bitmapData);
        return NULL;
    }
    
    // BEGIN DRAWING
    
    drawing (context, size);
    
    // END DRAWING
    CGImageRef cgImage = CGBitmapContextCreateImage(context);
	UIImage *retImage = [UIImage imageWithCGImage:cgImage];
	CGImageRelease(cgImage);
	CGContextRelease(context);
    free(bitmapData);
    
	return retImage;
}

+ (UIImage *)stretch:(UIImage *)img;
{
    NSInteger leftcap = floor(img.size.width / 2);
    NSInteger topcap = floor(img.size.height / 2);
    img = [img stretchableImageWithLeftCapWidth:leftcap topCapHeight:topcap];
    
    return img;
}

- (UIImage *)stretch;
{
    return [UIImage stretch:self];
}

@end
