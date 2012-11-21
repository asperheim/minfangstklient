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
#import "MFMapViewEditEventControllerViewController.h"
#import "MFLocation.h"
#import "MFSharedInstances.h"
#import "MFImage.h"
#import "MFMapViewShowDetailsViewController.h"

@interface MFMapViewController ()


- (void)getFishEvents;

@end

@implementation MFMapViewController

@synthesize mapView;
@synthesize fishEvents;
@synthesize longPressRecog;
@synthesize currentUserMadeAnnot;

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
    
    // Set up view
    self.title = @"Fiskekart";
    
    // Set up mapview
    [mapView setZoomEnabled:YES];
    [mapView setScrollEnabled:YES];
    [mapView setMapType:MKMapTypeStandard];
    mapView.delegate = self;
    
    
    // Set up startup region
    MKCoordinateRegion region;
    CLLocationDegrees degreesLat = 59.920269;
    CLLocationDegrees degreesLong = 10.749332;
    region.center = CLLocationCoordinate2DMake(degreesLat, degreesLong);
    region.span = MKCoordinateSpanMake(0.1, 0.1);
    [mapView setRegion:region animated:YES];
    
    // Download fishevents and populate map
    [self getFishEvents];
    
    
    // Set properties for UI Elements
    longPressRecog.minimumPressDuration = 2;
    
    //
    
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
        [fishevent setCoordinate: CLLocationCoordinate2DMake(fishevent.Location.Latitude, fishevent.Location.Longitude)];
    }
    
    fishEvents = [NSMutableArray arrayWithArray: objects];
    
    [mapView addAnnotations:fishEvents];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}


- (IBAction)pressFor2Sek:(id)sender {
    if (longPressRecog.state != UIGestureRecognizerStateBegan)
        return;
    
    CGPoint touchPoint = [longPressRecog locationInView:self.mapView];
    
    CLLocationCoordinate2D touchMapCoordinate =
    [self.mapView convertPoint:touchPoint toCoordinateFromView:self.mapView];
    
    NSDate* currentTime = [NSDate date];
    currentUserMadeAnnot = [[MFFishEvent alloc] init];
    
    [currentUserMadeAnnot setCoordinate:touchMapCoordinate];
    
    currentUserMadeAnnot.title = @"Fisketur!";
    currentUserMadeAnnot.subtitle = @"Her har jeg fisket";
    currentUserMadeAnnot.User = [MFSharedInstances sharedInstance].login.User;
    currentUserMadeAnnot.DateTime = currentTime;
    
    [self.mapView addAnnotation:currentUserMadeAnnot];
    [fishEvents addObject:currentUserMadeAnnot];
    
    MFMapViewEditEventControllerViewController * mapEditEventVC = [[MFMapViewEditEventControllerViewController alloc] initWithNibName:@"MFMapViewEditEventControllerViewController" bundle:nil passedData:currentUserMadeAnnot currentMapView:mapView isNew:YES];
    
    
    [self.navigationController pushViewController:mapEditEventVC animated:YES];
    
}

- (MKAnnotationView *)mapView:(MKMapView *)sender viewForAnnotation:(id < MKAnnotation >)annotation
{
    static NSString *reuseId = @"StandardPin";
    
    MKPinAnnotationView *aView = (MKPinAnnotationView *)[sender
                                                         dequeueReusableAnnotationViewWithIdentifier:reuseId];
    if (aView == nil)
    {
        aView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation
                                                 reuseIdentifier:reuseId];
        aView.rightCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        aView.canShowCallout = YES;
    }
    
    aView.annotation = annotation;			
    
    return aView;   
}

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control
{
    //NSLog(@"accessory button tapped for annotation %@", view.annotation);
    
     MFMapViewShowDetailsViewController* mapShowDetailsVC = [[MFMapViewShowDetailsViewController alloc] initWithNibName:@"MFMapViewShowDetailsViewController" bundle:nil passedData:view.annotation];
    
    [self.navigationController pushViewController:mapShowDetailsVC animated:YES];
    
}
@end
