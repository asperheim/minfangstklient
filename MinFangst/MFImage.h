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
@property (strong, nonatomic) NSString* FileNameSuffix;
@property (nonatomic) long              Size;
@property (strong, nonatomic) NSString* MIMEType;
@property (strong, nonatomic) NSString*   ImageBytes;



+ (RKObjectMapping*)objectMapping;

@end
