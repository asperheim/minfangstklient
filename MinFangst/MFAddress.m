//
//  MFAddress.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFAddress.h"

@implementation MFAddress

@synthesize Id;
@synthesize Street;
@synthesize ZipCode;
@synthesize Date;

+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* addressMapping = [RKObjectMapping mappingForClass:[MFAddress class]];
    [addressMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [addressMapping mapKeyPath:@"Street" toAttribute:@"Street"];
    [addressMapping mapKeyPath:@"ZipCode" toAttribute:@"ZipCode"];
    [addressMapping mapKeyPath:@"Date" toAttribute:@"Date"];
    
    addressMapping.setDefaultValueForMissingAttributes = YES;
    addressMapping.setNilForMissingRelationships = YES;
    
    return addressMapping;
}
@end
