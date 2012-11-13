//
//  MFSession.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 12.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MFSession : NSObject
@property int Id;
@property (nonatomic, retain) NSString* Token;
@property (nonatomic, retain) NSDate* Begin;
@property (nonatomic, retain) NSDate* Expires;
+ (RKObjectMapping*)objectMapping;
@end
