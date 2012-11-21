//
//  MFMapViewShowDetailsViewController.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 21.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFMapViewShowDetailsViewController.h"
#import "MFFishEvent.h"
#import <QuartzCore/QuartzCore.h>
#import "MFCollectionDelegate.h"
#import "MFImage.h"
#import "MFImageCell.h"
#import "MFMapViewEditEventControllerViewController.h"

@interface MFMapViewShowDetailsViewController ()
- (IBAction)editButtonClick:(id)sender;
@end

@implementation MFMapViewShowDetailsViewController

@synthesize lblTitle;
@synthesize lblCoords;
@synthesize txtComment;
@synthesize cellViewImages;
@synthesize currentUserMadeAnnot;
@synthesize viewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.currentUserMadeAnnot = objectToBePassed;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Set up nav bar
    UIBarButtonItem *editButton = [[UIBarButtonItem alloc]
                                   initWithBarButtonSystemItem:UIBarButtonSystemItemEdit
                                   target:self
                                   action:@selector(editButtonClick:)];
    
    self.navigationItem.rightBarButtonItem = editButton;
    
    [self loadData];    
    
    // adding border to the imageView
    [self.txtComment.layer setBorderColor: [[UIColor blackColor] CGColor]];
    [self.txtComment.layer setBorderWidth: 1.0];
    
    self.txtComment.layer.cornerRadius = 9.0;
    self.txtComment.layer.masksToBounds = YES;
    
    self.viewDelegate = [[MFCollectionDelegate alloc] initWithImageArray:currentUserMadeAnnot.Images];
    cellViewImages.delegate = viewDelegate;
    cellViewImages.dataSource = viewDelegate;
    [self.cellViewImages registerClass:[MFImageCell class] forCellWithReuseIdentifier:@"imgCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)editButtonClick:(id)sender {
    MFMapViewEditEventControllerViewController* mapEditVC = [[MFMapViewEditEventControllerViewController alloc] initWithNibName:@"MFMapViewEditEventControllerViewController" bundle:nil passedData:currentUserMadeAnnot isNew:NO];
    
    [self.navigationController pushViewController:mapEditVC animated:NO];
}

- (void)loadData {
    self.title = currentUserMadeAnnot.title;
    
    self.lblTitle.text = currentUserMadeAnnot.title;
    self.txtComment.text = currentUserMadeAnnot.subtitle;
    self.lblCoords.text = [NSString stringWithFormat:@"%f %f",
                           currentUserMadeAnnot.coordinate.latitude,
                           currentUserMadeAnnot.coordinate.longitude];
}

@end
