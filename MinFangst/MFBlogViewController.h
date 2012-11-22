//
//  MFBlogViewController.h
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RestKit/RestKit.h>
#import "MFBlogEntry.h"

@interface MFBlogViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, RKRequestDelegate, RKObjectLoaderDelegate>
@property (weak, nonatomic) IBOutlet UITableView *blogEntryTable;
@property (strong, nonatomic, retain) NSMutableArray* blogEntries;


- (void) getBlogEntries;
@end
