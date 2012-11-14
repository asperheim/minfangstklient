	//
//  MFUser.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFUser.h"
#import "MFPassword.h"
#import "MFEmail.h"
#import "MFAddress.h"
#import "MFPhone.h"

@implementation MFUser

@synthesize Id;
@synthesize Username;
@synthesize Firstname;
@synthesize Lastname;
@synthesize Birthdate;
@synthesize Passwords;
@synthesize Emails;
@synthesize Addresses;
@synthesize Phones;


+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* userMapping = [RKObjectMapping mappingForClass:[MFUser class]];
    [userMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [userMapping mapKeyPath:@"Username" toAttribute:@"Username"];
    [userMapping mapKeyPath:@"Firstname" toAttribute:@"Firstname"];
    [userMapping mapKeyPath:@"Lastname" toAttribute:@"Lastname"];
    [userMapping mapKeyPath:@"Birthdate" toAttribute:@"Birthdate"];
    
    /*[userMapping mapKeyPath:@"Passwords" toRelationship:@"Passwords" withMapping:[MFPassword objectMapping]];
    [userMapping mapKeyPath:@"Emails" toRelationship:@"Emails" withMapping:[MFEmail objectMapping]];
    [userMapping mapKeyPath:@"Addresses" toRelationship:@"Addresses" withMapping:[MFAddress objectMapping]];
    [userMapping mapKeyPath:@"Phones" toRelationship:@"Phones" withMapping:[MFPhone objectMapping]];*/
    
    userMapping.setDefaultValueForMissingAttributes = YES;
    userMapping.setNilForMissingRelationships = YES;
    
    return userMapping;
}
@end
