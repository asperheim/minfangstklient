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
#import <CommonCrypto/CommonDigest.h>


@interface MFLoginViewController (){
    
    NSArray * data;
}


@end

@implementation MFLoginViewController

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
    RKURL *baseURL = [RKURL URLWithBaseURLString:@"http://192.168.20.194/fishback/api/"];
    RKObjectManager *objectManager = [RKObjectManager objectManagerWithBaseURL:baseURL];
    objectManager.client.baseURL = baseURL;
    
    RKObjectMapping *clientLoginMapping = [RKObjectMapping mappingForClass:[MFClientLogin class]];
    
    [clientLoginMapping mapKeyPathsToAttributes:@"Id", @"Id", nil];
    
    [objectManager.mappingProvider setMapping:clientLoginMapping forKeyPath:@"response.ClientLogins"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLoggInnClick:(id)sender {
    
    NSString * pass = [self md5HexDigest:self.txtPassord.text];
    
    MFClientInfo * clientInfo = [[MFClientInfo alloc] initWithType:@"Iphone Test" ClientId:@"111-1-111-11-11" SoftwareVersion:@"1.0"];
    
    MFClientLogin * clientLogin = [[MFClientLogin alloc] initWithUsername:self.txtBrukernavn.text Password:pass ClientInfo:clientInfo];
    
    
    [self sendRequest: clientLogin];
}


- (void) sendRequest: (MFClientLogin *) clientLogin
{
    
    RKObjectManager *objectManager = [RKObjectManager sharedManager];
    
    objectManager.serializationMIMEType = RKMIMETypeJSON;
    
    objectManager.acceptMIMEType = RKMIMETypeJSON;
  
    RKClient* client = [RKClient clientWithBaseURL:@"http://192.168.20.194/fishback/api"];
    [client post:@"/login" params:clientLogin delegate:<#(NSObject<RKRequestDelegate> *)#>: delegate:self];
}

- (NSString*) md5HexDigest:(NSString*) input {
    const char* str = [input UTF8String];
    
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    
    CC_MD5(str, strlen(str), result);
    
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++) {
        
        [ret appendFormat:@"%02x",result[i]];
    }
    
    return ret;
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error
{
    NSLog(@"Error: %@", [error localizedDescription]);
}

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    NSLog(@"response code: %d", [response statusCode]);
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects
{
    NSLog(@"objects[%d]", [objects count]);
    data = objects;
    
    //[self.tableView reloadData];
}
- (void) block:(RKObjectLoader* ) loader {
    
}
@end
