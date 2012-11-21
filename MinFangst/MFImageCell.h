//
//  MFImageCell.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 20.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFImageCell : UICollectionViewCell

@property (weak, nonatomic) UIImage* image;

- (id)initWithFrame:(CGRect)frame;
- (void)setImageUrl:(NSString*)urlString;
@end
