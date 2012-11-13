//
//  MFClientLogin.h
//  MinFangst
//
//  Created by Anders Asperheim on 09.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MFClientInfo.h"
#import <RestKit/RestKit.h>

@interface MFClientLogin : NSObject
@property (nonatomic) int Id;
@property (strong, nonatomic) NSString* Username;
@property (strong, nonatomic) NSString* Password;
@property (strong, nonatomic) MFClientInfo * ClientInfo;

- (id) initWithUsername: (NSString * ) username Password: (NSString * ) password ClientInfo: (MFClientInfo*) clientInfo;

+ (RKObjectMapping*)objectMapping;

@end
