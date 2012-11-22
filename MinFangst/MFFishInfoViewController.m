//
//  MFFishInfoViewController.m
//  MinFangst
//
//  Created by Anders Asperheim on 22.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFFishInfoViewController.h"

@interface MFFishInfoViewController ()

@end

@implementation MFFishInfoViewController

@synthesize mainWebView;


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
    
    NSString *urlAddress = @"http://en.wikipedia.org/wiki/Salmon";
    
    //Create a URL object.
    NSURL *url = [NSURL URLWithString:urlAddress];
    
    //URL Requst Object
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url];
    
    //Load the request in the UIWebView.
    [mainWebView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
