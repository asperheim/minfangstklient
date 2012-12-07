//
//  MFFishEvent.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFFishEvent.h"
#import "MFImage.h"
#import "MFBlogEntry.h"

@implementation MFFishEvent

@synthesize Id;
@synthesize User;
@synthesize Location;
@synthesize DateTime;
@synthesize Images;
@synthesize title;
@synthesize subtitle;

@synthesize coordinate;


- (void) setCoordinate:(CLLocationCoordinate2D)newCoordinate {
    
    if (self.Location == nil) {
        self.Location = [[MFLocation alloc] init];
    }
    
    self.Location.Longitude = newCoordinate.longitude;
    self.Location.Latitude = newCoordinate.latitude;
    
    self->coordinate = newCoordinate;

    
}

- (NSString *)description {
    return [NSString stringWithFormat:@"Id: %d - User.Id: %d - Location: %@ - DateTime: %@ - Images: %@ - Title: %@ - Subtitle: %@", self.Id, self.User.Id, self.Location, self.DateTime, self.Images, self.title, self.subtitle];
}

+ (RKObjectMapping *)objectMapping {
    
    RKObjectMapping* fishEventMapping = [RKObjectMapping mappingForClass:[MFFishEvent class]];
    [fishEventMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [fishEventMapping mapKeyPath:@"User" toRelationship:@"User" withMapping:[MFUser objectMapping]];
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
