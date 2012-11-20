//
//  MFImage.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFUser.h"
#import "MFLocation.h"
@class MFFishEvent;

@interface MFImage : NSObject

@property (nonatomic) int Id;
@property (strong, nonatomic) NSDate* DateTime;
@property (strong, nonatomic) NSString* Comment;
@property (strong, nonatomic) NSString* Title;
@property (strong, nonatomic) NSString* FileName;
@property (strong, nonatomic) NSString* OriginalFileName;
+ (RKObjectMapping*)objectMapping;

@end
