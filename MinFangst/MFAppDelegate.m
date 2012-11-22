//
//  MFAppDelegate.m
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFAppDelegate.h"
#import "MFLoginViewController.h"
#import <RestKit/RestKit.h>
#import "MFSession.h"
#import "MFLogin.h"
#import "MFDashboardViewController.h"
#import "MFFishEvent.h"
#import "MFLocation.h"
#import "MFUser.h"
#import "MFImage.h"
#import "MFBlogEntry.h"

@interface MFAppDelegate()

- (void)setupRestKit;

@end

@implementation MFAppDelegate

- (void)setupRestKit {
    
    //instantiate RKClient and RKObjectManager
    NSString* path = @"http://fishback.azurewebsites.net/api";
    //NSString* path = @"http://192.168.20.194/fishback/api";
    
    [RKClient clientWithBaseURLString:path];
    RKObjectManager* manager = [RKObjectManager objectManagerWithBaseURLString:path];
    
    //set some MIME related properties
    manager.acceptMIMEType = RKMIMETypeJSON;
    manager.serializationMIMEType = RKMIMETypeJSON;
    
    //NOTE:
    //  object mapping = REST API -> CLIENT (mapping response from server to an object)
    //  serialization mapping = CLIENT -> REST API (serialize an object to be sent to server)
    
    //creates mapping for ClientInfo
    RKObjectMapping* clientInfoMapping = [MFClientInfo objectMapping];
    [manager.mappingProvider setMapping:clientInfoMapping forKeyPath:@"ClientInfo"];
    [manager.mappingProvider setSerializationMapping:clientInfoMapping.inverseMapping forClass:[MFClientInfo class]];

    //creates mapping for ClientLogin
    RKObjectMapping* clientLoginMapping = [MFClientLogin objectMapping];
    [manager.mappingProvider setMapping:clientLoginMapping forKeyPath:@"ClientLogin"];
    [manager.mappingProvider setSerializationMapping:clientLoginMapping.inverseMapping forClass:[MFClientLogin class]];
  

    //creates mapping for Session
    RKObjectMapping* sessionMapping = [MFSession objectMapping];
    [manager.mappingProvider setMapping:sessionMapping forKeyPath:@"Session"];
    [manager.mappingProvider setSerializationMapping:sessionMapping.inverseMapping forClass:[MFSession class]];

    
    //creates mapping for Login
    RKObjectMapping* loginMapping = [MFLogin objectMapping];
    [manager.mappingProvider setMapping:loginMapping forKeyPath:@"Login"];
    [manager.mappingProvider setSerializationMapping:loginMapping.inverseMapping forClass:[MFLogin class]];

    //MFBlogEntry
    RKObjectMapping* blogEntryMapping = [MFBlogEntry objectMapping];
    [manager.mappingProvider setMapping:blogEntryMapping forKeyPath:@"BlogEntry"];
    [manager.mappingProvider setSerializationMapping:blogEntryMapping.inverseMapping forClass:[MFBlogEntry class]];
    
    
    //MFFishEvent
    RKObjectMapping* fishEventMapping = [MFFishEvent objectMapping];
    [manager.mappingProvider setMapping:fishEventMapping forKeyPath:@"FishEvent"];
    [manager.mappingProvider setSerializationMapping:fishEventMapping.inverseMapping forClass:[MFFishEvent class]];
    
    //MFLocation
    RKObjectMapping* locationMapping = [MFLocation objectMapping];
    [manager.mappingProvider setMapping:locationMapping forKeyPath:@"Location"];
    [manager.mappingProvider setSerializationMapping:locationMapping.inverseMapping forClass:[MFLocation class]];
    
    //MFUser
    RKObjectMapping* userMapping = [MFUser objectMapping];
    [manager.mappingProvider setMapping:userMapping forKeyPath:@"User"];
    [manager.mappingProvider setSerializationMapping:userMapping.inverseMapping forClass:[MFUser class]];
    
    //MFImage
    RKObjectMapping* imageMapping = [MFImage objectMapping];
    [manager.mappingProvider setMapping:imageMapping forKeyPath:@"Image"];
    [manager.mappingProvider setSerializationMapping:imageMapping.inverseMapping forClass:[MFImage class]];
    
    //creates a route for POST to /login
    //when we have this, then RKObjectManager knows that it's supposed to route
    RKObjectRouter* router = [manager router];
    
    
    //MFClientLogin objects to /login when we do a POST
    [router routeClass:[MFClientLogin class] toResourcePath:@"/login" forMethod:RKRequestMethodPOST];
    
    // Route for posting fishevents
    [router routeClass:[MFFishEvent class] toResourcePath:@"/fishevent" forMethod:RKRequestMethodPOST];
    
    // Route for posting blogevents
    [router routeClass:[MFBlogEntry class] toResourcePath:@"/blogentry" forMethod:RKRequestMethodPOST];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    //initiate RestKit releated stuff
    [self setupRestKit];
    
    MFDashboardViewController* dashboardVC = [[MFDashboardViewController alloc] initWithNibName:@"MFDashboardViewController" bundle:nil];
    dashboardVC.title = @"Min Fangst";
    UINavigationController* navController = [[UINavigationController alloc] initWithRootViewController:dashboardVC];
    
    self.window.rootViewController = navController;

    MFLoginViewController * loginVC = [[MFLoginViewController alloc] initWithNibName: @"MFLoginViewController" bundle:nil];    
    
    navController.navigationBar.hidden = YES;
    [navController pushViewController:loginVC animated:YES];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
