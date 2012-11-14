//
//  MFUser.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <RestKit/RestKit.h>

@interface MFUser : NSObject

@property (nonatomic) int Id;
@property (strong, nonatomic) NSString* Username;
@property (strong, nonatomic) NSString* Firstname;
@property (strong, nonatomic) NSString* Lastname;
@property (strong, nonatomic) NSDate* Birthdate;

@property (strong, nonatomic) NSMutableArray* Passwords;
@property (strong, nonatomic) NSMutableArray* Emails;
@property (strong, nonatomic) NSMutableArray* Addresses;
@property (strong, nonatomic) NSMutableArray*Phones;

+ (RKObjectMapping*)objectMapping;

@end
