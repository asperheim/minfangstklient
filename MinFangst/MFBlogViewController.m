//
//  MFBlogViewController.m
//  MinFangst
//
//  Created by Tore Brandtzæg on 14.11.12.
//  Copyright (c) 2012 Anders Asperheim. All rights reserved.
//

#import "MFBlogViewController.h"

@interface MFBlogViewController ()
- (IBAction)addButtonClick:(id)sender;
- (IBAction)refreshButtonClick:(id)sender;
@end

@implementation MFBlogViewController

@synthesize blogEntryTable;
@synthesize blogEntries;

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
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return blogEntries.count;
    //return 2;
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *MyIdentifier = @"CellId";
    
    MFBlogEntry* blogEntry = [blogEntries objectAtIndex:indexPath.item];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:MyIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault  reuseIdentifier:MyIdentifier];
    }
    
    cell.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
    
    
    cell.textLabel.text = blogEntry.Title;
    cell
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
