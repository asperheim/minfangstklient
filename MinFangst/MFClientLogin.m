//
//  MFClientLogin.m
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFClientLogin.h"
#import "MFClientInfo.h"

@implementation MFClientLogin
@synthesize Id;
@synthesize Username;
@synthesize Password;
@synthesize ClientInfo;

+ (MFClientLogin *) fromDictionary: (NSDictionary * ) jsonDict {
    return nil;
}

- (id) initWithUsername: (NSString * ) username Password: (NSString * ) password ClientInfo: (MFClientInfo*) clientInfo {
    
    self = [super init];
    
    if(self) {
        self.Username = username;
        self.Password = password;
        self.ClientInfo = clientInfo;
    }
    return self;
}

+ (RKObjectMapping*)objectMapping {
    
    RKObjectMapping* clientLoginMapping = [RKObjectMapping mappingForClass:[MFClientLogin class]];
    [clientLoginMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [clientLoginMapping mapKeyPath:@"Username" toAttribute:@"Username"];
    [clientLoginMapping mapKeyPath:@"Password" toAttribute:@"Password"];
    [clientLoginMapping mapKeyPath:@"ClientInfo" toRelationship:@"ClientInfo" withMapping:[MFClientInfo objectMapping]];
    
    clientLoginMapping.setDefaultValueForMissingAttributes = YES;
    clientLoginMapping.setNilForMissingRelationships = YES;
    
    return clientLoginMapping;
}

@end
