//
//  MFFishCameraTests.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 04.12.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFFishCameraVCTests.h"
#import "OCMock/OCMockObject.h"
#import "MFFishCameraViewController.h"

@implementation MFFishCameraVCTests {
    id fishCameraVCMock;
}

-(void)setUp {
    [super setUp];
    
    fishCameraVCMock = [OCMockObject mockForClass:[MFFishCameraViewController class]];
}

-(void)tearDown	{
    fishCameraVCMock = nil;
    
    [super tearDown];
}

@end
