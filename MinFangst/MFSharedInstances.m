//
//  MFSharedInstances.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 20.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFSharedInstances.h"
#import "MFFishEvent.h"
#import "MFLogin.h"

@implementation MFSharedInstances

@synthesize login;

static MFSharedInstances *sharedInstance = nil;
static MFLogin* sharedLogin = nil;

// Get the shared instance and create it if necessary.
+ (MFSharedInstances *)sharedInstance {
    if (sharedInstance == nil) {
        sharedInstance = [[super allocWithZone:NULL] init];
        }
    
    return sharedInstance;
}

// We can still have a regular init method, that will get called the first time the Singleton is used.
- (id)init
{
    self = [super init];
    
    if (self) {
        // Work your initialising magic here as you normally would
    }
    
    return self;
}

// Equally, we don't want to generate multiple copies of the singleton.
- (id)copyWithZone:(NSZone *)zone {
    return self;
}

@end
