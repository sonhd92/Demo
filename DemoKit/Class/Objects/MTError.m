//
//  KLoginButton.h
//  DemoKit
//
//  Created by nguyenquockhanh on 4/22/16.
//  Copyright © 2016 KVip. All rights reserved.
//
#import "MTError.h"

@implementation MTError

+ (MTError *)errorWithDictionary:(NSDictionary *)dic;
{
    MTError *e = [MTError new];
    NSLog(@"Error: %d",((NSNumber *)dic[@"errorCode"]).intValue);
    e.code = ((NSNumber *)dic[@"errorCode"]).intValue;
    e.message = [self checkMessage:[NSNumber numberWithInt:[dic[@"errorCode"] integerValue]]];
    return e;
}
+ (MTError *)errorWithCode:(int)code;
{
    MTError *e = [MTError new];
    e.code = code;
    e.message = [self checkMessage:[NSNumber numberWithInt:code]];
    return e;
}
+(NSString*)checkMessage:(NSNumber*)errorCode{
    NSPropertyListFormat fm;
    NSBundle *frameworkBundle = [NSBundle bundleForClass:[self class]];
    NSString *path = [frameworkBundle pathForResource:@"ErrorAndMessage" ofType:@"plist"];
    NSArray* items=[NSPropertyListSerialization propertyListWithData:[NSData dataWithContentsOfFile:path] options:kCFPropertyListMutableContainersAndLeaves format:&fm error:nil];
    for (NSDictionary* item in items) {
        if ([errorCode isEqualToNumber:[item objectForKey:@"code"]]) {
            return [item objectForKey:@"message"];
        }
    }
    return nil;
}
- (NSString *)message
{
    return _message;
}

- (BOOL)success
{
    return self.code == 0;
}

@end
