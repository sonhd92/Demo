//
//  KManagerResult.m
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import "KManagerResult.h"

@implementation KManagerResult
+ (instancetype)currentUser{
    static KManagerResult *obj;
    static dispatch_once_t *oneT;
    dispatch_once(&oneT, ^{
        obj=[KManagerResult new];
    });
    return obj;
}
@end
