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

@interface MFMapViewEditEventControllerViewController : UIViewController <UICollectionViewDelegate, UIAlertViewDelegate, RKRequestDelegate, RKObjectLoaderDelegate>
@property (strong, nonatomic) MFFishEvent * currentUserMadeAnnot;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblCoords;
@property (weak, nonatomic) IBOutlet UICollectionView *cellViewBilder;

@property (strong, nonatomic) IBOutlet UITextView *txtCommentField;
@property (strong, nonatomic) MKMapView* mapView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed currentMapView: (MKMapView*)mapView;

@end
