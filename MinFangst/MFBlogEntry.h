//
//  MFBlogEntry.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFBlogEntry : NSObject

@property (nonatomic) int Id;
@property (strong, nonatomic) MFUser* user;
@property (strong, nonatomic) NSString* Title;
@property (strong, nonatomic) NSString* Content;
@property (strong, nonatomic) NSMutableArray* Tags;
@property (strong, nonatomic) NSMutableArray* FishEvents;
@property (strong, nonatomic) NSDate* CreateDate;
@property (strong, nonatomic) NSDate* EditDate;

@end
