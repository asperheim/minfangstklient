//
//  MFCollectionDelegate.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 21.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MFCollectionDelegate : NSObject <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic) NSArray* images;

- (id)initWithImageArray:(NSMutableArray*)imagesArray;

@end
