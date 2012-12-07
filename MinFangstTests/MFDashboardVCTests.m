//
//  MFDashboardVCTests.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 23.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFDashboardVCTests.h"
#import "MFDashboardViewController.h"
#import "OCMock/OCMockObject.h"

@implementation MFDashboardVCTests {
    id dashboardVCMock;
}

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
    dashboardVCMock = [OCMockObject mockForClass:[MFDashboardViewController class]];
}

- (void)tearDown
{
    // Tear-down code here.
    dashboardVCMock = nil;
    
    [super tearDown];
}

- (void)test_btnBlogClick_WhenUserClicksBlogButton_MethodShouldBeCalled {
    
    UIButton* btnBlog = [[UIButton alloc] init];
    [[dashboardVCMock expect] btnBlogClick:btnBlog];
    
    [dashboardVCMock btnBlogClick:btnBlog];
    [dashboardVCMock verify];
    
}

- (void)test_btnFishFaceClick_WhenUserClicksFishFaceButton_MethodShouldBeCalled {
    
    UIButton* btnFishFace = [[UIButton alloc] init];    
    [[dashboardVCMock expect] btnFishFaceClick:btnFishFace];
    
    [dashboardVCMock btnFishFaceClick:btnFishFace];
    [dashboardVCMock verify];
}

- (void)test_btnMapClick_WhenUserClicksMapButton_MethodShouldBeCalled {
    
    UIButton* btnMap = [[UIButton alloc] init];
    [[dashboardVCMock expect] btnMapClick:btnMap];
    
    [dashboardVCMock btnMapClick:btnMap];
    [dashboardVCMock verify];
}

- (void)test_btnFishFactsClick_WhenUserClicksFishFactsButton_MethodShouldBeCalled {
    
    UIButton* btnFishFacts = [[UIButton alloc] init];
    [[dashboardVCMock expect] btnFishFactsClick:btnFishFacts];
    
    [dashboardVCMock btnFishFactsClick:btnFishFacts];
    [dashboardVCMock verify];
}

- (void)test_btnSettingsClick_WhenUserClicksSettingsButton_MethodShouldBeCalled {
    UIButton* btnSettings = [[UIButton alloc] init];
    [[dashboardVCMock expect] btnSettingsClick:btnSettings];
    
    [dashboardVCMock btnSettingsClick:btnSettings];
    [dashboardVCMock verify];
}

@end
