//
//  MFMapViewController.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFMapViewController.h"
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "MFFishEvent.h"
#import <RestKit/RestKit.h>

@interface MFMapViewController ()

@property (nonatomic, copy) NSMutableArray* fishEvents;
- (void)getFishEvents;

@end

@implementation MFMapViewController

@synthesize mapView;
@synthesize fishEvents;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    [mapView setMapType:MKMapTypeStandard];
    
    MKCoordinateRegion region;
    CLLocationDegrees degreesLat = 59.920269;
    CLLocationDegrees degreesLong = 10.749332;
    region.center = CLLocationCoordinate2DMake(degreesLat, degreesLong);
    region.span = MKCoordinateSpanMake(0.1, 0.1);
    [mapView setRegion:region animated:YES];
    [[mapView dequeueReusableAnnotationViewWithIdentifier:] retain]
    
    [self getFishEvents];
}

- (void)getFishEvents {
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/fishevent" usingBlock:^(RKObjectLoader *loader) {
        [loader.mappingProvider setMapping:[MFFishEvent objectMapping] forKeyPath:@"FishEvents"];
        loader.delegate = self;
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//RKRequestDelegate method

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    if ([request isGET]) {
        // Handling GET
        
        if ([response isOK]) {
            // Success! Let's take a look at the data
            NSLog(@"Retrieved from GET: %@", [response bodyAsString]);
        }
        
    }
}

//RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    NSLog(@"Did load %d objects!", objects.count);
    
    for(MFFishEvent *fishevent in objects) {
        CLLocationCoordinate2D coord = CLLocationCoordinate2DMake(fishevent.Location.Latitude, fishevent.Location.Longitude);
        fishevent.coordinate= coord;
    }
    
    //[fishEvents addObjectsFromArray:objects];
    [mapView addAnnotations:objects];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}


@end
