//
//  MFImageCell.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 20.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFImageCell.h"

@implementation MFImageCell

- (id)initWithFrame:(CGRect)frame url:(NSString *)urlString
{
    self = [super initWithFrame:frame];
    if (self) {
        NSURL *url = [NSURL URLWithString:urlString];
        self.image = [UIImage imageWithData: [NSData dataWithContentsOfURL:url]];
        
        UIImageView* view = [[UIImageView alloc] initWithImage:self.image];
        [self.contentView addSubview:view];
    }
    return self;
}

@end
