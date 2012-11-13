//
//  MFLogin.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 12.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFLogin.h"
#import "MFSession.h"

@implementation MFLogin
@synthesize Id;
@synthesize LoginTime;
@synthesize LogoutTime;
@synthesize Ip;
@synthesize Session;

- (NSString *)description {
    return [NSString stringWithFormat:@"Id: %d - LoginTime: %@ - LogoutTime: %@ - Ip: %@ - Session: %@",
                                        self.Id, self.LoginTime, self.LogoutTime, self.Ip, self.Session];
}

+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* loginMapping = [RKObjectMapping mappingForClass:[MFLogin class]];
    [loginMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [loginMapping mapKeyPath:@"LoginTime" toAttribute:@"LoginTime"];
    [loginMapping mapKeyPath:@"LogoutTime" toAttribute:@"LogoutTime"];
    [loginMapping mapKeyPath:@"Ip" toAttribute:@"Ip"];
    [loginMapping mapKeyPath:@"Session" toRelationship:@"Session" withMapping:[MFSession objectMapping]];
    loginMapping.setDefaultValueForMissingAttributes = YES;
    loginMapping.setNilForMissingRelationships = YES;
    
    return loginMapping;
}
@end
