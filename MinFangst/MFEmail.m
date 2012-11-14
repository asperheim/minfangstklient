//
//  MFEmail.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFEmail.h"

@implementation MFEmail

@synthesize Id;
@synthesize Address;
@synthesize Priority;
@synthesize Date;


+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* emailMapping = [RKObjectMapping mappingForClass:[MFEmail class]];
    [emailMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [emailMapping mapKeyPath:@"Address" toAttribute:@"Address"];
    [emailMapping mapKeyPath:@"Priority" toAttribute:@"Priority"];
    [emailMapping mapKeyPath:@"Date" toAttribute:@"Date"];
    
    emailMapping.setDefaultValueForMissingAttributes = YES;
    emailMapping.setNilForMissingRelationships = YES;
    
    return emailMapping;
}
@end
