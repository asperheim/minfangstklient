//
//  MFPhone.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFPhone.h"

@implementation MFPhone

@synthesize Id;
@synthesize Number;
@synthesize CountryCode;
@synthesize Date;

+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* phoneMapping = [RKObjectMapping mappingForClass:[MFPhone class]];
    [phoneMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [phoneMapping mapKeyPath:@"Number" toAttribute:@"Number"];
    [phoneMapping mapKeyPath:@"CountryCode" toAttribute:@"CountryCode"];
    [phoneMapping mapKeyPath:@"Date" toAttribute:@"Date"];
    
    phoneMapping.setDefaultValueForMissingAttributes = YES;
    phoneMapping.setNilForMissingRelationships = YES;
    
    return phoneMapping;
}
@end
