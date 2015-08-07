//
//  AppDelegate.h
//  KeyValueObserving
//
//  Created by kevin on 15/8/7.
//  Copyright (c) 2015年 kevin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) NSMutableArray *dataTableView;
-(NSInteger)countOfDataTableView;
-(id)objectInDataTableViewAtIndex:(NSUInteger)index;
-(void)addDataTableViewObject:(id)object;
-(void)removeDataTableViewObject:(id)object;
-(void)insertDataTableView:(NSArray *)array atIndexes:(NSIndexSet *)indexes;
@end

