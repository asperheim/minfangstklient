//
//  MFBlogViewController.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFBlogViewController.h"
#import "MFBlogEntryCell.h"
#import <RestKit/RestKit.h>

@interface MFBlogViewController ()
- (IBAction)addButtonClick:(id)sender;
- (IBAction)refreshButtonClick:(id)sender;
@end

@implementation MFBlogViewController

@synthesize blogEntryTable;
@synthesize blogEntries;
@synthesize blogEntryCell;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Blogginnlegg";
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addButtonClick:)];
    
        UIBarButtonItem *refreshButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(refreshButtonClick:)];
    
    self.navigationItem.rightBarButtonItems = [NSArray arrayWithObjects:addButton, refreshButton, nil];
    [self getBlogEntries];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addButtonClick:(id)sender {
    NSLog(@"addButtonClick");
    
}
- (void)refreshButtonClick:(id)sender {
    NSLog(@"refreshButtonClick");
    [self getBlogEntries];
    [[self blogEntryTable] reloadData];
}

- (void)objectLoader:(RKObjectLoader *)objectLoader didLoadObjects:(NSArray *)objects {
    NSLog(@"Did load %d objects!", objects.count);
    
    blogEntries = [NSMutableArray arrayWithArray: objects];
    NSLog(@"Arrayen har %d elementer", blogEntries.count);
    [[self blogEntryTable] reloadData];
}

- (void)getBlogEntries {
    // Collect all blogentries
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:@"/blogentry" usingBlock:^(RKObjectLoader *loader) {
        [loader.mappingProvider setMapping:[MFBlogEntry objectMapping] forKeyPath:@"BlogEntries"];
        loader.delegate = self;
    }];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
    //return blogEntries.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return blogEntries.count;
    //return 1;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {

    return @"Dilldall";
}



- (void)tableView:(UITableView *)tableView accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
    UIAlertView *messageAlert = [[UIAlertView alloc]
                                 initWithTitle:@"Row Selected" message:@"You've selected a row" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    
    // Display Alert Message
    [messageAlert show];
}


- (MFBlogEntryCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"CellId";
    
    MFBlogEntry* blogEntry = [blogEntries objectAtIndex:indexPath.item];
    
    MFBlogEntryCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        //cell = [[MFBlogEntryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:MyIdentifier];
        [[NSBundle mainBundle] loadNibNamed:@"MFBlogEntryCell" owner:self options:nil];
        cell = blogEntryCell;
        self.blogEntryCell = nil;
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"yyyy-MM-dd"];
    
    NSString* correctDateFormat = [NSString stringWithFormat:@"%@", [df stringFromDate:[NSDate date]]];
    
    
    
    cell.lblTitle.text = blogEntry.Title;
    cell.lblDate.text = correctDateFormat;
    cell.lblUserName = [NSString stringWithFormat:@"%@ %@", blogEntry.User.Firstname, blogEntry.User.Lastname];
    cell.txtViewPreview.text = blogEntry.Content;
    
    NSMutableString* tags = [[NSMutableString alloc] init];
    
    int dictCounter = 0;
    for(NSDictionary *tag in blogEntry.Tags) {
        dictCounter++;
        [tags appendString:[tag valueForKey:@"Text"]];
        
        if(dictCounter < blogEntry.Tags.count)[tags appendString:@", "];
    }
    cell.lblTags.text = tags;
    
    
    
    return cell;
}
//RKRequestDelegate method

- (void)request:(RKRequest*)request didLoadResponse:(RKResponse*)response {
    if ([request isGET]) {
        // Handling GET
        
        if ([response isOK]) {
            // Success! Let's take a look at the data
            NSLog(@"Retrieved from GET: %@", [response bodyAsString]);
        }
        
    }
}

//RKObjectLoaderDelegate methods


- (void)objectLoader:(RKObjectLoader *)objectLoader didFailWithError:(NSError *)error {
    NSLog(@"Encountered an error: %@", error);
}

@end
