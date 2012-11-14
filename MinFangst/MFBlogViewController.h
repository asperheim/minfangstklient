//
//  MFBlogViewController.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MFBlogViewController : UIViewController <UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *blogEntryTable;

@end
