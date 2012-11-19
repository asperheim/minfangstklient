//
//  MFFishEvent.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFFishEvent.h"
#import "MFImage.h"

@implementation MFFishEvent

@synthesize Id;
@synthesize Location;
@synthesize DateTime;
@synthesize Images;
@synthesize title;
@synthesize subtitle;

@synthesize coordinate;

- (id) init {
    if (self == [super init]) {
        
    }
    return self;
}

+ (RKObjectMapping *)objectMapping {
    
    RKObjectMapping* fishEventMapping = [RKObjectMapping mappingForClass:[MFFishEvent class]];
    [fishEventMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [fishEventMapping mapKeyPath:@"Location" toRelationship:@"Location" withMapping:[MFLocation objectMapping]];
    [fishEventMapping mapKeyPath:@"DateTime" toAttribute:@"DateTime"];
    [fishEventMapping mapKeyPath:@"Images" toRelationship:@"Images" withMapping:[MFImage objectMapping]];
    [fishEventMapping mapKeyPath:@"Title" toAttribute:@"title"];
    [fishEventMapping mapKeyPath:@"Comment" toAttribute:@"subtitle"];
    
    fishEventMapping.setDefaultValueForMissingAttributes = YES;
    fishEventMapping.setNilForMissingRelationships = YES;
    
    return fishEventMapping;
}
@end
