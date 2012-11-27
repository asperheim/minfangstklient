//
//  MFLoginViewController.h
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MFClientLogin.h"
#import <RestKit/RestKit.h>

@interface MFLoginViewController : UIViewController <RKRequestDelegate, RKObjectLoaderDelegate>

@property (weak, nonatomic) IBOutlet UITextField *txtBrukernavn;
@property (weak, nonatomic) IBOutlet UITextField *txtPassord;
@property (weak, nonatomic) IBOutlet UIButton *btnLoggInn;
@property (strong, nonatomic) IBOutlet UIActivityIndicatorView *loginActivityMonitor;


- (IBAction)btnLoggInnClick:(id)sender;
- (void) sendRequest: (MFClientLogin *) clientLogin;
- (IBAction)textFieldReturn:(id)sender;

@end
