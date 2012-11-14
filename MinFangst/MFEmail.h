//
//  MFEmail.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MFEmail : NSObject

@property (nonatomic) int Id;
@property (strong, nonatomic) NSString* Address;
@property (nonatomic) int Priority;
@property (strong, nonatomic) NSDate* Date;

+ (RKObjectMapping*)objectMapping;

@end
