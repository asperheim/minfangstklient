//
//  MFPassword.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFPassword : NSObject

@property (nonatomic) int Id;
@property (strong, nonatomic) NSString* PasswordClearText;
@property (strong, nonatomic) NSString* PasswordHash;
@property (strong, nonatomic) NSDate* Date;

@end
