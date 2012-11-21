//
//  MFCollectionDelegate.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 21.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFCollectionDelegate.h"
#import "MFImage.h"
#import "MFImageCell.h"

@implementation MFCollectionDelegate

@synthesize images;

- (id)initWithImageArray:(NSMutableArray *)imagesArray {    
    self = [super init];
    if (self) {
        self.images = [NSMutableArray arrayWithArray:imagesArray];
    }
    
    return self;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return images.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    MFImage* image = [images objectAtIndex:indexPath.item];
    NSString * completeUrl = [NSString stringWithFormat:@"http://fishback.azurewebsites.net/Media/Images/%@_thumbnail.%@", image.FileName, image.FileNameSuffix];
    
    MFImageCell* cell = [cv dequeueReusableCellWithReuseIdentifier:@"imgCell" forIndexPath:indexPath];
    
    [cell setImageUrl:completeUrl];
    
    return cell;
}


@end
