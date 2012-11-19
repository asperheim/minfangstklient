//
//  MFMapViewController.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <RestKit/RestKit.h>
#import "MFFishEvent.h"

@interface MFMapViewController : UIViewController <RKRequestDelegate, RKObjectLoaderDelegate>
@property (strong, nonatomic, retain) IBOutlet MKMapView *mapView;
@property (strong, nonatomic, retain) MFFishEvent * currentUserMadeAnnot;
@property (strong, nonatomic, retain) NSMutableArray* fishEvents;
@property (strong, nonatomic, retain) IBOutlet UILongPressGestureRecognizer *longPressRecog;


- (IBAction) pressFor2Sek:(id)sender;

@end
