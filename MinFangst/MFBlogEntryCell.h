//
//  MFBlogEntryCell.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 22.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFBlogEntryCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *lblTitle;
@property (weak, nonatomic) IBOutlet UILabel *lblUserName;
@property (weak, nonatomic) IBOutlet UILabel *lblDate;
@property (weak, nonatomic) IBOutlet UIImageView *blogImage;
@property (weak, nonatomic) IBOutlet UITextView *txtViewPreview;
@property (weak, nonatomic) IBOutlet UILabel *lblTags;


@end
