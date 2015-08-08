//
//  TVCTabelView.m
//  KeyValueObserving
//
//  Created by kevin on 15/8/7.
//  Copyright (c) 2015年 kevin. All rights reserved.
//
#import "AppDelegate.h"

#import "TVCTabelView.h"

@interface TVCTabelView ()
-(IBAction)btnAddClick:(id)sender;
-(IBAction)btnRemoveClick:(id)sender;
@end

@implementation TVCTabelView

- (void)viewDidLoad {
    [super viewDidLoad];

    [self InitKVO];
    // Uncomment the following line to preserve selection between presentations.
    
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
   
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)InitKVO
{
    AppDelegate* delegate=[UIApplication sharedApplication].delegate;
//    [delegate.dataTableView addObserver:self forKeyPath:@"count" options:NSKeyValueObservingOptionNew context:NULL];
    
//    [delegate addObserver:self forKeyPath:@"dataTableView.count" options:NSKeyValueObservingOptionNew context:NULL];
    
    [delegate addObserver:self forKeyPath:@"countOfDataTableView" options:NSKeyValueObservingOptionNew|NSKeyValueObservingOptionOld context:nil];
    
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"keypath:::%@",keyPath);
    NSLog(@"object:::%@",NSStringFromClass([object class]));
    NSLog(@"change:::%@",change);
    
    
    
    if([keyPath isEqualToString:@"countOfDataTableView"])
    {
        [self.tableView reloadData];
    }
    
//    if([super respondsToSelector:@selector(observeValueForKeyPath:ofObject:change:context:)])
//    {
//        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
//    }
}

-(void)dealloc
{
    AppDelegate* delegate=[UIApplication sharedApplication].delegate;
    [delegate removeObserver:self forKeyPath:@"countOfDataTableView"];
}

-(IBAction)btnAddClick:(id)sender
{
    AppDelegate* delegate=[UIApplication sharedApplication].delegate;
//    [delegate.dataTableView addObject:[NSString stringWithFormat:@"%lu",[delegate.dataTableView count]]];
    
    [delegate addDataTableViewObject:[NSString stringWithFormat:@"%lu",[delegate.dataTableView count]]];
    
//    [self.tableView reloadData];
}

-(IBAction)btnRemoveClick:(id)sender
{
    AppDelegate* delegate=[UIApplication sharedApplication].delegate;
//    [delegate.dataTableView removeLastObject];
    
    if ([delegate countOfDataTableView]==0) {
        return;
    }
    
    [delegate removeDataTableViewObject:[delegate objectInDataTableViewAtIndex:[delegate countOfDataTableView]-1]];
    
//    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [[self aryData] count];
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CellId" forIndexPath:indexPath];
    cell.textLabel.text=[NSString stringWithFormat:@"%@",[[self aryData] objectAtIndex:[indexPath row]]];
    // Configure the cell...
    
    return cell;
}

-(NSMutableArray*)aryData
{
    AppDelegate* delegate=[UIApplication sharedApplication].delegate;
    return [delegate dataTableView];
}
/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
