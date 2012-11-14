//
//  MFFishEvent.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFLocation.h"
#import <RestKit/RestKit.h>

@interface MFFishEvent : NSObject

@property (nonatomic) int Id;
@property (strong, nonatomic) MFLocation* Location;
@property (strong, nonatomic) NSDate* DateTime;
@property (strong, nonatomic) NSMutableArray* Images;
@property (strong, nonatomic) NSString* Title;
@property (strong, nonatomic) NSString* Comment;

+ (RKObjectMapping*)objectMapping;
@end
