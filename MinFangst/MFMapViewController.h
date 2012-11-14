//
//  MFMapViewController.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface MFMapViewController : UIViewController
@property (weak, nonatomic) IBOutlet MKMapView *mapView;

@end