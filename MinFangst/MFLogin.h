//
//  MFLogin.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 12.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFSession.h"
#import <RestKit/RestKit.h>
@class MFUser;

@interface MFLogin : NSObject
@property (nonatomic) int Id;
@property (strong, nonatomic) MFUser* User;
@property (strong, nonatomic) NSDate* LoginTime;
@property (strong, nonatomic) NSDate* LogoutTime;
@property (strong, nonatomic) NSString* Ip;
@property (strong, nonatomic) MFSession* Session;
+ (RKObjectMapping*)objectMapping;
@end
