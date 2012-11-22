//
//  MFBlogEntry.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFBlogEntry.h"
#import "MFUser.h"

@implementation MFBlogEntry

@synthesize Id;
@synthesize User;
@synthesize Title;
@synthesize Content;
@synthesize Tags;
@synthesize CreateDate;
@synthesize EditDate;

+ (RKObjectMapping*)objectMapping {
    RKObjectMapping* blogEntryMapping = [RKObjectMapping mappingForClass:[MFBlogEntry class]];
    [blogEntryMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [blogEntryMapping mapKeyPath:@"User" toRelationship:@"User" withMapping:[MFUser objectMapping]];
    [blogEntryMapping mapKeyPath:@"Title" toAttribute:@"Title"];
    [blogEntryMapping mapKeyPath:@"Content" toAttribute:@"Content"];
    [blogEntryMapping mapKeyPath:@"Tags" toAttribute:@"Tags"];
    [blogEntryMapping mapKeyPath:@"CreateDate" toAttribute:@"CreateDate"];
    [blogEntryMapping mapKeyPath:@"EditDate" toAttribute:@"EditDate"];
    
    blogEntryMapping.setDefaultValueForMissingAttributes = YES;
    blogEntryMapping.setNilForMissingRelationships = YES;
    
    return blogEntryMapping;
}

@end
