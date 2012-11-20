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


@interface MFMapViewEditEventControllerViewController ()

- (IBAction)saveButtonClick:(id)sender;

@end

@implementation MFMapViewEditEventControllerViewController

@synthesize currentUserMadeAnnot;
@synthesize txtName;
@synthesize txtCommentField;
@synthesize lblCoords;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        //NSLog(@"objectToBePassed %@", objectToBePassed.Location);
        self.currentUserMadeAnnot = objectToBePassed;

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Set up nav bar
    UIBarButtonItem *saveButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                                                                                target:self
                                                                                action:@selector(saveButtonClick:)];
    
    self.navigationItem.rightBarButtonItem = saveButton;
    
    self.title = currentUserMadeAnnot.title;
    
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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) saveButtonClick:(id)sender {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Fisketur"
                                                    message:@"Fisketuren er lagret"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil];
    
    [[RKObjectManager sharedManager] postObject:currentUserMadeAnnot delegate:self];
    
    /*[[RKObjectManager sharedManager] postObject:currentUserMadeAnnot usingBlock:^(RKObjectLoader *loader) {
        [loader.mappingProvider setMapping:[MFFishEvent objectMapping] forKeyPath:@"FishEvent"];
        loader.targetObject = nil;
        loader.delegate = self;
    }];*/
    [alert show];
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
