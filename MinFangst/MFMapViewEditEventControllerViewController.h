//
//  MFMapViewEditEventControllerViewController.h
//  MinFangst
//
//  Created by Anders Asperheim on 16.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFMapViewEditEventControllerViewController.h"
#import "MFMapViewController.h"
#import <MapKit/MapKit.h>

@interface MFMapViewEditEventControllerViewController : UIViewController
@property (strong, nonatomic) MFFishEvent * currentUserMadeAnnot;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (strong, nonatomic) IBOutlet UITextField *txtLat;
@property (strong, nonatomic) IBOutlet UITextField *txtLong;
@property (strong, nonatomic) IBOutlet UITextView *txtCommentField;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed;
@end
