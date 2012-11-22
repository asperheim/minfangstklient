//
//  MFDashboardViewController.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 13.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFDashboardViewController.h"
#import "MFFishRecognitionViewController.h"
#import "MFMapViewController.h"
#import "MFBlogViewController.h"
#import "MFFishInfoViewController.h"

@interface MFDashboardViewController ()

@end

@implementation MFDashboardViewController

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
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnBlogClick:(id)sender {
    MFBlogViewController* blogVC = [[MFBlogViewController alloc] initWithNibName:@"MFBlogViewController" bundle:nil];
    
    [self.navigationController pushViewController:blogVC animated:YES];
}

- (IBAction)btnMapClick:(id)sender {
    MFMapViewController* mapVC = [[MFMapViewController alloc] initWithNibName:@"MFMapViewController" bundle:nil];
    
    [self.navigationController pushViewController:mapVC animated:YES];
}

- (IBAction)btnFishFaceClick:(id)sender {
    MFFishRecognitionViewController* fishRecVC = [[MFFishRecognitionViewController alloc] initWithNibName:@"MFFishRecognitionViewController" bundle:nil];
    
    [self.navigationController pushViewController:fishRecVC animated:YES];
}

- (IBAction)btnFishFactsClick:(id)sender {
    MFFishInfoViewController *fishInfoVC = [[MFFishInfoViewController alloc] initWithNibName:@"MFFishInfoViewController" bundle:nil];
    
    [self.navigationController pushViewController:fishInfoVC animated:YES];
}

- (IBAction)btnSettingsClick:(id)sender {
}

- (IBAction)btnLogoutClick:(id)sender {
}
@end
