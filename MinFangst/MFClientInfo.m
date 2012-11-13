//
//  MFClientInfo.m
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFClientInfo.h"

@implementation MFClientInfo
@synthesize Id;
@synthesize Type;
@synthesize ClientId;
@synthesize SoftwareVersion;

- (id) initWithType: (NSString * ) type ClientId: (NSString * ) clientId SoftwareVersion: (NSString*) softwareVersion {
    self = [super init];
    
    if(self) {
        self.Type = type;
        self.ClientId = clientId;
        self.SoftwareVersion = softwareVersion;
    }
    return self;
}

+ (RKObjectMapping*)objectMapping {
    RKObjectMapping* clientInfoMapping = [RKObjectMapping mappingForClass:[MFClientInfo class]];
    [clientInfoMapping mapKeyPath:@"Id" toAttribute:@"Id"];
    [clientInfoMapping mapKeyPath:@"Type" toAttribute:@"Type"];
    [clientInfoMapping mapKeyPath:@"ClientId" toAttribute:@"ClientId"];
    [clientInfoMapping mapKeyPath:@"SoftwareVersion" toAttribute:@"SoftwareVersion"];
    
    clientInfoMapping.setDefaultValueForMissingAttributes = YES;
    clientInfoMapping.setNilForMissingRelationships = YES;
    
    return clientInfoMapping;
}
@end
