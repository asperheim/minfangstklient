//
//  MFFishCameraViewController.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 04.12.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFFishCameraViewController.h"
#import <RestKit/RestKit.h>

@interface MFFishCameraViewController ()

- (void) takePicture:(id) sender;

@end

@implementation MFFishCameraViewController

@synthesize imgCamera;

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
    self.title = @"Fiskekamera";
    
    UIBarButtonItem* cameraBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(takePicture:)];
    
    cameraBarButtonItem.isAccessibilityElement = YES;
    [cameraBarButtonItem setAccessibilityLabel:@"Camera"];

    [[self navigationItem] setRightBarButtonItem:cameraBarButtonItem];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)takePicture:(id) sender {
    
    UIImagePickerController *imagePicker = [[UIImagePickerController alloc] init];
    
    // Checks if camera is availible, if not it just shows the photo library
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypeCamera];
    } else {
        [imagePicker setSourceType:UIImagePickerControllerSourceTypePhotoLibrary];
    }
    
    [imagePicker setDelegate:self];
    
    [self presentViewController:imagePicker animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
    
    [self.lblInfo setHidden:YES];
    [self.imgCamera setImage:image];
    
    //TEMPORARY POST, it's not supposed to be here, jsut for testing purposes
    [[RKObjectManager sharedManager] postObject:image delegate:self];
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
