//
//  MFSession.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 12.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFSession.h"

@implementation MFSession
@synthesize Id;
@synthesize Token;
@synthesize Begin;
@synthesize Expires;

- (NSString *)description {
    return [NSString stringWithFormat:@"Id: %d - Token: %@ - Begin: %@ - Expires: %@", self.Id, self.Token, self.Begin, self.Expires];
}

+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* sessionMapping = [RKObjectMapping mappingForClass:[MFSession class]];
    [sessionMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [sessionMapping mapKeyPath:@"Token" toAttribute:@"Token"];
    [sessionMapping mapKeyPath:@"Begin" toAttribute:@"Begin"];
    [sessionMapping mapKeyPath:@"Expires" toAttribute:@"Expires"];
    sessionMapping.setDefaultValueForMissingAttributes = YES;
    sessionMapping.setNilForMissingRelationships = YES;
    
    return sessionMapping;
}
@end
