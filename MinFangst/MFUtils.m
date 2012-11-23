//
//  MFUtils.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 13.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MFUtils

+ (NSString*) md5HexDigest:(NSString*) input {
    const char* str = [input UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        [ret appendFormat:@"%02x",result[i]];
    }
    
    return ret;
}

+ (NSString *)getUUID
{
    CFUUIDRef newUniqueId = CFUUIDCreate(kCFAllocatorDefault);
    NSString * uuidString = (__bridge_transfer NSString*)CFUUIDCreateString(kCFAllocatorDefault, newUniqueId);
    CFRelease(newUniqueId);
    
    return uuidString;
}

@end
