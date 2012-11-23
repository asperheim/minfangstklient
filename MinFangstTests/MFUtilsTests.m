//
//  MFUtilsTests.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 23.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFUtilsTests.h"
#import "MFUtils.h"
#import <CommonCrypto/CommonDigest.h>

@implementation MFUtilsTests

- (void)testMd5HexDigest {
    NSString* input = @"This is a string";
    NSString* md5Hex = [MFUtils md5HexDigest:input];
    
    STAssertTrue((CC_MD5_DIGEST_LENGTH * 2) == md5Hex.length, @"MD5 hex should be the same length as the MD5_DIGEST_LENGTH constant times two.");
}

-(void)testGetUUID {
    NSString* uuid = [MFUtils getUUID];
    
    STAssertTrue(uuid.length == 36, @"A UUID should have a length of 36 characters, 32 hexadecimal digits and 4 hyphens.");
    
    //Check if it's in the correct format 8-4-4-4-12 
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern:@"^[0-9A-F]{8}-([0-9A-F]{4}-){3}[0-9A-F]{12}$" options:NSRegularExpressionCaseInsensitive error:nil];
    
    NSArray *matches = [regex matchesInString:uuid
                                      options:0
                                        range:NSMakeRange(0, [uuid length])];
    
    if (matches.count == 0) {
        STFail(@"The UUID was not in the excpected format of 8-4-4-4-12 hexadecimal digits");
    }
}

@end
