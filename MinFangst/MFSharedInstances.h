//
//  MFSharedInstances.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 20.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFLogin.h"

@interface MFSharedInstances : NSObject

@property (strong, nonatomic) MFLogin* login;

+ (MFSharedInstances *)sharedInstance;

@end
