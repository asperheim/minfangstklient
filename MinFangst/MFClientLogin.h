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
@property (weak, nonatomic) NSString* Username;
@property (weak, nonatomic) NSString* Password;
@property (weak, nonatomic) MFClientInfo * ClientInfo;

- (id) initWithUsername: (NSString * ) username Password: (NSString * ) password ClientInfo: (MFClientInfo*) clientInfo;

+ (RKObjectMapping*)objectMapping;

@end
