//
//  MFPassword.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFPassword.h"

@implementation MFPassword

@synthesize Id;
@synthesize PasswordClearText;
@synthesize PasswordHash;
@synthesize Date;

+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* passwordMapping = [RKObjectMapping mappingForClass:[MFPassword class]];
    [passwordMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [passwordMapping mapKeyPath:@"PasswordClearText" toAttribute:@"PasswordClearText"];
    [passwordMapping mapKeyPath:@"PasswordHash" toAttribute:@"PasswordHash"];
    [passwordMapping mapKeyPath:@"Date" toAttribute:@"Date"];

    passwordMapping.setDefaultValueForMissingAttributes = YES;
    passwordMapping.setNilForMissingRelationships = YES;
    
    return passwordMapping;
}
@end
