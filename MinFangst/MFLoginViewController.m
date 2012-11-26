//
//  MFLoginViewController.m
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFLoginViewController.h"
#import "MFClientLogin.h"
#import "MFClientInfo.h"
#import <RestKit/RestKit.h>
#import "MFUtils.h"
#import "MFLogin.h"
#import "MFDashboardViewController.h"
#import "MFSharedInstances.h"

@interface MFLoginViewController ()
- (void)launchDashboard;
- (void)showCustomLoginMessage:(NSString*) errorContent;
@end

@implementation MFLoginViewController
@synthesize loginActivityMonitor;

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
    // Do any additional setup after loading the view from its nib.
    [self.loginActivityMonitor setHidesWhenStopped:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoggInnClick:(id)sender {
    [self.loginActivityMonitor startAnimating];
    self.btnLoggInn.enabled = NO;
    NSString * pass = [MFUtils md5HexDigest:self.txtPassord.text];
    //NSLog(@"Brukernavn: %@,Password: %@, hash: %@", self.txtBrukernavn.text, self.txtPassord.text, pass);
    
    MFClientInfo * clientInfo = [[MFClientInfo alloc] initWithType:@"Iphone Test" ClientId:[MFUtils getUUID] SoftwareVersion:@"1.0"];
    
    MFClientLogin * clientLogin = [[MFClientLogin alloc] initWithUsername:self.txtBrukernavn.text Password:pass ClientInfo:clientInfo];
    
    [self sendRequest: clientLogin];
}


- (void) sendRequest: (MFClientLogin *) clientLogin {
    
    NSLog(@"Sending request...");
    
    //have to use this postObject method, due to the response object (MFLogin) not
    //being of the same type as the object posted (MFClientLogin)
    //loader.targetObjct = nil makes us able to map to different type
    [[RKObjectManager sharedManager] postObject:clientLogin usingBlock:^(RKObjectLoader* loader) {
        loader.targetObject = nil;
        loader.delegate = self;
    }];
    //[[RKObjectManager sharedManager] postObject:clientLogin delegate:self];
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
    
    [MFSharedInstances sharedInstance].login = [objects objectAtIndex:0];
    
    [self.loginActivityMonitor stopAnimating];
    
    [self launchDashboard];

    //NSLog(@"Got %d objects from server! First object is: %@", objects.count, userLogin);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
    [self.loginActivityMonitor stopAnimating];
    self.btnLoggInn.enabled = YES;
    [self showCustomLoginMessage:@"Got an error from the server."];
}

- (void)objectLoaderDidLoadUnexpectedResponse:(RKObjectLoader *)objectLoader {
    NSLog(@"objectLoaderDidLoadUnexpectedResponse!");
    [self.loginActivityMonitor stopAnimating];
    self.btnLoggInn.enabled = YES;
    [self showCustomLoginMessage:@"Got a malformed response from the server."];
    
}

-(void)showCustomLoginMessage:(NSString *)errorContent {
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Login Error" message:errorContent delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    messageAlert.isAccessibilityElement = YES;
    messageAlert.accessibilityLabel = @"Login Error Message";
    
    // Display Alert Message
    [messageAlert show];
}

-(void)launchDashboard {
    
    self.navigationController.navigationBar.hidden = NO;
    [self.navigationController popViewControllerAnimated:YES];
}
@end
