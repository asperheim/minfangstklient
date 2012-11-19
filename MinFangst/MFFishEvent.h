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
#import <MapKit/MapKit.h>

@interface MFFishEvent : NSObject <MKAnnotation>

@property (nonatomic) int Id;
@property (strong, nonatomic) MFLocation* Location;
@property (strong, nonatomic) NSDate* DateTime;
@property (strong, nonatomic) NSMutableArray* Images;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, assign) CLLocationCoordinate2D coordinate;

+ (RKObjectMapping*)objectMapping;

- (void) setCoordinate:(CLLocationCoordinate2D) newCoordinate;
@end
