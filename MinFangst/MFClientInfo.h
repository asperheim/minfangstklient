//
//  MFClientInfo.h
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFClientInfo : NSObject

@property (nonatomic) int Id;
@property (weak, nonatomic) NSString * Type;
@property (weak, nonatomic) NSString * ClientId;
@property (weak, nonatomic) NSString * SoftwareVersion;

- (id) initWithType: (NSString * ) type ClientId: (NSString * ) clientId SoftwareVersion: (NSString*) softwareVersion;

- (NSDictionary * ) toDictionary;

@end
