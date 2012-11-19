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

@interface MFMapViewEditEventControllerViewController ()

@end

@implementation MFMapViewEditEventControllerViewController

@synthesize currentUserMadeAnnot;
@synthesize txtName;
@synthesize txtLong;
@synthesize txtLat;
@synthesize txtCommentField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        NSLog(@"objectToBePassed %@", objectToBePassed.Location);
        self.currentUserMadeAnnot = objectToBePassed;

        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = currentUserMadeAnnot.title;
    
    self.txtName.text = currentUserMadeAnnot.title;
    self.txtCommentField.text = currentUserMadeAnnot.subtitle;
    self.txtLat.text = [NSString stringWithFormat:@"%f", currentUserMadeAnnot.Location.Latitude];
    self.txtLong.text = [NSString stringWithFormat:@"%f", currentUserMadeAnnot.Location.Longitude];}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
