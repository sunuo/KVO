//
//  AppDelegate.m
//  KeyValueObserving
//
//  Created by kevin on 15/8/7.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize dataTableView;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.dataTableView=[NSMutableArray arrayWithArray:@[@"0",@"1"]];
    // Override point for customization after application launch.
    return YES;
}


- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}
#pragma mark--key-value coding

-(NSInteger)countOfDataTableView
{
    return [self.dataTableView count];
}

-(id)objectInDataTableViewAtIndex:(NSUInteger)index
{
    return [self.dataTableView objectAtIndex:index];
}

-(void)addDataTableViewObject:(id)object
{
    [self.dataTableView addObject:object];
}
-(void)removeDataTableViewObject:(id)object
{
    [self.dataTableView removeObject:object];
}

-(void)insertDataTableView:(NSArray *)array atIndexes:(NSIndexSet *)indexes
{
    [self.dataTableView insertObjects:array atIndexes:indexes];
}
@end
