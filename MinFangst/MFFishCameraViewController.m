//
//  MFFishCameraViewController.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 04.12.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFFishCameraViewController.h"
#import <RestKit/RestKit.h>
#import "MFImage.h"
#import "MFUtils.h"

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
    
    MFImage* postImage =  [[MFImage alloc] init];
    
    NSData* jpgImage = UIImageJPEGRepresentation(image, 1.0);
    //NSString* imageData = [[NSString alloc] initWithBytes:[jpgImage bytes] length:jpgImage.length encoding: NSUTF8StringEncoding];
    NSString* imageData = [jpgImage description];
    //NSString* imageData = [MFUtils base64StringFromData:jpgImage length:jpgImage.length] ;
    
    postImage.Title = @"Nytt bilde";
    postImage.Comment = @"Dette er et fint kommentarfelt";
    //postImage.OriginalFileName = @"DCIM0000001.jpg";
    postImage.FileNameSuffix = @"jpg";
    //postImage.FileName = @"newFile";
    postImage.ImageBytes = imageData;
    postImage.Size = imageData.length;
    postImage.MIMEType = @"image/jpg";
    postImage.FishEventId = 1;
    
    NSLog(@"\n\n Size: %d \n\n", imageData.length);
    
    [self.lblInfo setHidden:YES];
    [self.imgCamera setImage:image];
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [[RKObjectManager sharedManager] postObject:postImage usingBlock:^(RKObjectLoader *loader){
        loader.delegate = self;
        loader.targetObject = nil;
    }];
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
