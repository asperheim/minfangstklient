//
//  MFLocation.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFLocation.h"

@implementation MFLocation

@synthesize Id;
@synthesize Latitude;
@synthesize Longitude;
@synthesize MAMSL;


+ (RKObjectMapping *)objectMapping {
    
    RKObjectMapping* locationMapping = [RKObjectMapping mappingForClass:[MFLocation class]];
    [locationMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [locationMapping mapKeyPath:@"Latitude" toAttribute:@"Latitude"];
    [locationMapping mapKeyPath:@"Longitude" toAttribute:@"Longitude"];
    [locationMapping mapKeyPath:@"MAMSL" toAttribute:@"MAMSL"];
    
    locationMapping.setDefaultValueForMissingAttributes = YES;
    locationMapping.setNilForMissingRelationships = YES;
    
    return locationMapping;
}
@end
