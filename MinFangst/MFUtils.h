//
//  MFUtils.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 13.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFUtils : NSObject
+ (NSString *) md5HexDigest: (NSString * ) input;
+(NSString*)GetUUID;
@end
