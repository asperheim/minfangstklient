//
//  MFImage.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFImage.h"
#import "MFUser.h"
#import "MFLocation.h"
#import "MFFishEvent.h"

@implementation MFImage

@synthesize Id;
//@synthesize User;
@synthesize DateTime;
@synthesize Comment;
//@synthesize Location;
@synthesize Title;
@synthesize FileName;
@synthesize OriginalFileName;
@synthesize Size;
@synthesize MIMEType;
@synthesize FileNameSuffix;
@synthesize ImageBytes;

+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* imageMapping = [RKObjectMapping mappingForClass:[MFImage class]];
    [imageMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    //[imageMapping mapKeyPath:@"User" toRelationship:@"User" withMapping:[MFUser objectMapping]];
    [imageMapping mapKeyPath:@"DateTime" toAttribute:@"DateTime"];
    [imageMapping mapKeyPath:@"Comment" toAttribute:@"Comment"];
    //[imageMapping mapKeyPath:@"Location" toRelationship:@"Location" withMapping:[MFLocation objectMapping]];
    [imageMapping mapKeyPath:@"Title" toAttribute:@"Title"];
    [imageMapping mapKeyPath:@"FileName" toAttribute:@"FileName"];
    [imageMapping mapKeyPath:@"OriginalFileName" toAttribute:@"OriginalFileName"];
    [imageMapping mapKeyPath:@"FileNameSuffix" toAttribute:@"FileNameSuffix"];
    [imageMapping mapKeyPath:@"Size" toAttribute:@"Size"];
    [imageMapping mapKeyPath:@"MIMEType" toAttribute:@"MIMEType"];
    [imageMapping mapKeyPath:@"Bytes" toAttribute:@"ImageBytes"];
    
    imageMapping.setDefaultValueForMissingAttributes = YES;
    imageMapping.setNilForMissingRelationships = YES;
    
    return imageMapping;
}

@end
