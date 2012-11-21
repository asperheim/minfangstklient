//
//  MFImageCell.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 20.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFImageCell.h"

@implementation MFImageCell

@synthesize image;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

- (void)setImageUrl:(NSString *)urlString {
    NSURL *url = [NSURL URLWithString:urlString];
    self.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
    
    UIImageView* view = [[UIImageView alloc] initWithImage:self.image];
    [self.contentView addSubview:view];
}

@end
