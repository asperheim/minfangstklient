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
@class MFCollectionDelegate;

@interface MFMapViewEditEventControllerViewController : UIViewController <UIAlertViewDelegate, RKRequestDelegate, RKObjectLoaderDelegate>
@property (strong, nonatomic) MFFishEvent * currentUserMadeAnnot;
@property (strong, nonatomic) IBOutlet UITextField *txtName;
@property (weak, nonatomic) IBOutlet UILabel *lblCoords;
@property (weak, nonatomic) IBOutlet UICollectionView *cellViewImages;

@property (strong, nonatomic) IBOutlet UITextView *txtCommentField;
@property (strong, nonatomic) MKMapView* mapView;
@property (strong, nonatomic) MFCollectionDelegate* viewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed currentMapView: (MKMapView*)curMapView isNew: (BOOL)isNewAnnotation;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed isNew: (BOOL)isNewAnnotation;

@end
