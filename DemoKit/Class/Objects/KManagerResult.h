//
//  KManagerResult.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface KManagerResult : NSObject
@property (nonatomic,strong) NSString *userName;
@property (nonatomic,strong) NSString *userEmail;
@property (nonatomic,strong) NSString *accessToken;

+ (instancetype)currentUser;


@end
