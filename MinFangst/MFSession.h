//
//  MFSession.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 12.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MFSession : NSObject
@property (nonatomic) int Id;
@property (strong, nonatomic) NSString* Token;
@property (strong, nonatomic) NSDate* Begin;
@property (strong, nonatomic) NSDate* Expires;

+ (RKObjectMapping*)objectMapping;
@end
