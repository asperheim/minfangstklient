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
@synthesize Title;
@synthesize Comment;

+ (RKObjectMapping *)objectMapping {
    
    RKObjectMapping* fishEventMapping = [RKObjectMapping mappingForClass:[MFFishEvent class]];
    [fishEventMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [fishEventMapping mapKeyPath:@"Location" toAttribute:@"Location"];
    [fishEventMapping mapKeyPath:@"DateTime" toAttribute:@"DateTime"];
    [fishEventMapping mapKeyPath:@"Images" toRelationship:@"Images" withMapping:[MFImage objectMapping]];
    [fishEventMapping mapKeyPath:@"Title" toAttribute:@"Title"];
    [fishEventMapping mapKeyPath:@"Comment" toAttribute:@"Comment"];
    
    fishEventMapping.setDefaultValueForMissingAttributes = YES;
    fishEventMapping.setNilForMissingRelationships = YES;
    
    return fishEventMapping;
}
@end
