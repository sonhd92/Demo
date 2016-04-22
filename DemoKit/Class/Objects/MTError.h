//
//  KLoginButton.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//
#import <Foundation/Foundation.h>

#define MT_NETWORK_ERROR 10000
#define MT_ERROR_MALFORMED_RESPONSE 10001
#define MT_ERROR_NO_DATA            10002

@interface MTError : NSObject

@property (nonatomic, assign) int code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, readonly) BOOL success;


+ (MTError *)errorWithDictionary:(NSDictionary *)dic;
+ (MTError *)errorWithCode:(int)code;
+(NSString*)checkMessage:(NSNumber*)errorCode;

@end
