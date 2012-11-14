//
//  MFLocation.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MFLocation : NSObject

@property (nonatomic) int Id;
@property (nonatomic) float Latitude;
@property (nonatomic) float Longitude;
@property (nonatomic) float MAMSL;

+ (RKObjectMapping*)objectMapping;

@end
