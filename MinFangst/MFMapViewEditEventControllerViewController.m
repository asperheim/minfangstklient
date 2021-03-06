//
//  MFMapViewEditEventControllerViewController.m
//  MinFangst
//
//  Created by Anders Asperheim on 16.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFMapViewEditEventControllerViewController.h"
#import "MFMapViewController.h"
#import "MFFishEvent.h"
#import <MapKit/MapKit.h>
#import <QuartzCore/QuartzCore.h>
#import <RestKit/RestKit.h>
#import "MFImageCell.h"
#import "MFImage.h"
#import "MFCollectionDelegate.h"
#import "MFMapViewShowDetailsViewController.h"


@interface MFMapViewEditEventControllerViewController () {
    BOOL isSaved;
    BOOL isNew;
}

- (IBAction)saveButtonClick:(id)sender;
- (IBAction)cancelButtonClick:(id)sender;

@end

@implementation MFMapViewEditEventControllerViewController

@synthesize currentUserMadeAnnot;
@synthesize txtName;
@synthesize txtCommentField;
@synthesize lblCoords;
@synthesize cellViewImages;
@synthesize viewDelegate;
@synthesize mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed currentMapView:(MKMapView *)curMapView isNew:(BOOL)isNewAnnotation
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //NSLog(@"objectToBePassed %@", objectToBePassed.Location);
        self.currentUserMadeAnnot = objectToBePassed;
        self->isSaved = NO;
        self.mapView = curMapView;
        self->isNew = isNewAnnotation;
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed isNew:(BOOL)isNewAnnotation
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //NSLog(@"objectToBePassed %@", objectToBePassed.Location);
        self.currentUserMadeAnnot = objectToBePassed;
        self->isSaved = NO;
        self->isNew = isNewAnnotation;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    txtCommentField.isAccessibilityElement = YES;
    txtCommentField.accessibilityLabel = @"Comments";
    
    // Set up nav bar
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(saveButtonClick:)];
    saveButton.isAccessibilityElement = YES;
    saveButton.accessibilityLabel = @"Done";
    
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                   target:self
                                   action:@selector(cancelButtonClick:)];
    cancelButton.isAccessibilityElement = YES;
    cancelButton.accessibilityLabel = @"Cancel";
    
    
    self.navigationItem.rightBarButtonItem = saveButton;
    self.navigationItem.leftBarButtonItem = cancelButton;
    [self.navigationItem setHidesBackButton:YES];
    
    if (isNew)
        self.title = @"Ny hendelse";
    else
        self.title = [NSString stringWithFormat:@"Endre '%@'", currentUserMadeAnnot.title];
    
    self.txtName.text = currentUserMadeAnnot.title;
    self.txtCommentField.text = currentUserMadeAnnot.subtitle;
    self.lblCoords.text = [NSString stringWithFormat:@"%f %f",
                           currentUserMadeAnnot.coordinate.latitude,
                           currentUserMadeAnnot.coordinate.longitude];
    
    
    // adding border to the imageView
    [self.txtCommentField.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.txtCommentField.layer setBorderWidth: 1.0];
    
    self.txtCommentField.layer.cornerRadius = 9.0;
    self.txtCommentField.layer.masksToBounds = YES;
    
    self.viewDelegate = [[MFCollectionDelegate alloc] initWithImageArray:currentUserMadeAnnot.Images];
    cellViewImages.delegate = viewDelegate;
    cellViewImages.dataSource = viewDelegate;
    [self.cellViewImages registerClass:[MFImageCell class] forCellWithReuseIdentifier:@"imgCell"];
}

- (void)viewWillDisappear:(BOOL)animated {
    if (!isSaved) {
        if (mapView && isNew) {
            [self.mapView removeAnnotation:currentUserMadeAnnot];
        }
        
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) saveButtonClick:(id)sender {
    
    currentUserMadeAnnot.title = self.txtName.text;
    currentUserMadeAnnot.subtitle = self.txtCommentField.text;
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hendelsen er lagret"
                                                    message:[NSString stringWithFormat:@"%@ er lagret.",
                                                             currentUserMadeAnnot.title]
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    alert.isAccessibilityElement = YES;
    
    if (isNew) {
        [[RKObjectManager sharedManager] postObject:currentUserMadeAnnot delegate:self];
    } else {
        [[RKObjectManager sharedManager] putObject:currentUserMadeAnnot delegate:self];
    }
    
    isSaved = YES;
    
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    //TODO: pop back to showDetails with updated data instead of popping to map
    NSArray* array = [self.navigationController viewControllers];
    [self.navigationController popToViewController:[array objectAtIndex:array.count - (isNew ? 2 : 3)] animated:YES];
    
}

- (void)cancelButtonClick:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

//RKRequestDelegate method

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    if ([request isGET]) {
        // Handling GET
        
        if ([response isOK]) {
            // Success! Let's take a look at the data
            NSLog(@"Retrieved from GET: %@", [response bodyAsString]);
        }
        
    } else if ([request isPOST]) {
        
        // Handling POST
        if ([response isJSON]) {
            NSLog(@"Got a JSON response back from our POST: %@", [response bodyAsString]);
        }
    }
}

//RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {

    NSLog(@"Got %d objects from server!", objects.count);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}

- (void)objectLoaderDidLoadUnexpectedResponse:(RKObjectLoader *)objectLoader {
    NSLog(@"objectLoaderDidLoadUnexpectedResponse!");
}

@end
