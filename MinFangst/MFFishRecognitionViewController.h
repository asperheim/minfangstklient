//
//  MFFishRecognitionViewController.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZBarSDK.h"

@interface MFFishRecognitionViewController : UIViewController <ZBarReaderDelegate>

@property (weak, nonatomic) IBOutlet UIImageView *imgCamera;
@property (weak, nonatomic) IBOutlet UITextView *txtInfo;
- (IBAction)scanButtonTapped:(id)sender;
@end
