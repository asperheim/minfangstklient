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

+ (NSString *) base64StringFromData: (NSData *)data length: (int)length {
    
    static const char base64EncodingTable[64] = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
    static const short base64DecodingTable[256] = {
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -1, -1, -2, -1, -1, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -1, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, 62, -2, -2, -2, 63,
        52, 53, 54, 55, 56, 57, 58, 59, 60, 61, -2, -2, -2, -2, -2, -2,
        -2,  0,  1,  2,  3,  4,  5,  6,  7,  8,  9, 10, 11, 12, 13, 14,
        15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, -2, -2, -2, -2, -2,
        -2, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40,
        41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2,
        -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2, -2
    };
    
    int lentext = [data length];
    if (lentext < 1) return @"";
    
    char *outbuf = malloc(lentext*4/3+4); // add 4 to be sure
    
    if ( !outbuf ) return nil;
    
    const unsigned char *raw = [data bytes];
    
    int inp = 0;
    int outp = 0;
    int do_now = lentext - (lentext%3);
    
    for ( outp = 0, inp = 0; inp < do_now; inp += 3 )
    {
        outbuf[outp++] = base64EncodingTable[(raw[inp] & 0xFC) >> 2];
        outbuf[outp++] = base64EncodingTable[((raw[inp] & 0x03) << 4) | ((raw[inp+1] & 0xF0) >> 4)];
        outbuf[outp++] = base64EncodingTable[((raw[inp+1] & 0x0F) << 2) | ((raw[inp+2] & 0xC0) >> 6)];
        outbuf[outp++] = base64EncodingTable[raw[inp+2] & 0x3F];
    }
    
    if ( do_now < lentext )
    {
        char tmpbuf[2] = {0,0};
        int left = lentext%3;
        for ( int i=0; i < left; i++ )
        {
            tmpbuf[i] = raw[do_now+i];
        }
        raw = tmpbuf;
        outbuf[outp++] = base64EncodingTable[(raw[inp] & 0xFC) >> 2];
        outbuf[outp++] = base64EncodingTable[((raw[inp] & 0x03) << 4) | ((raw[inp+1] & 0xF0) >> 4)];
        if ( left == 2 ) outbuf[outp++] = base64EncodingTable[((raw[inp+1] & 0x0F) << 2) | ((raw[inp+2] & 0xC0) >> 6)];
    }
    
    NSString *ret = [[NSString alloc] initWithBytes:outbuf length:outp encoding:NSASCIIStringEncoding];
    free(outbuf);
    
    return ret;
}

@end
