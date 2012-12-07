//
//  MFFishCameraViewController.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 04.12.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>

@interface MFFishCameraViewController : UIViewController <UINavigationControllerDelegate, UIImagePickerControllerDelegate, RKRequestDelegate, RKObjectLoaderDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgCamera;
@property (weak, nonatomic) IBOutlet UILabel *lblInfo;

@end
