//
//  MFMapViewShowDetailsViewController.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 21.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class MFFishEvent;
@class MFCollectionDelegate;

@interface MFMapViewShowDetailsViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblCoords;
@property (weak, nonatomic) IBOutlet UITextView *txtComment;
@property (weak, nonatomic) IBOutlet UICollectionView *cellViewImages;
@property (strong, nonatomic) MFFishEvent * currentUserMadeAnnot;
@property (strong, nonatomic) MFCollectionDelegate* viewDelegate;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil passedData:(MFFishEvent *) objectToBePassed;
- (void)loadData;

@end
