//
//  MFClientInfo.h
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MFClientInfo : NSObject

@property (nonatomic) int Id;
@property (strong, nonatomic) NSString * Type;
@property (strong, nonatomic) NSString * ClientId;
@property (strong, nonatomic) NSString * SoftwareVersion;

- (id) initWithType: (NSString * ) type ClientId: (NSString * ) clientId SoftwareVersion: (NSString*) softwareVersion;

+ (RKObjectMapping*)objectMapping;
@end
