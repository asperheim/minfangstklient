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

@interface MFLogin : NSObject
@property int Id;
@property (nonatomic, retain) NSDate* LoginTime;
@property (nonatomic, retain) NSDate* LogoutTime;
@property (nonatomic, retain) NSString* Ip;
@property (nonatomic, retain) MFSession* Session;
+ (RKObjectMapping*)objectMapping;
@end
