//
//  UITableView+Reload.m
//  CoinWay
//
//  Created by Rain on 2018/8/21.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "UITableView+Reload.h"

@implementation UITableView (Reload)

- (void)reloadRow:(NSInteger)row section:(NSInteger)section {
    [self reloadRow:row section:section withRowAnimation:UITableViewRowAnimationNone];
}
- (void)reloadRow:(NSInteger)row section:(NSInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
    if ([self cellForRowAtIndexPath:indexPath]) {
        [self reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:animation];
    }
}


- (void)reloadSection:(NSInteger)section {
    [self reloadSection:section withRowAnimation:UITableViewRowAnimationNone];
}
- (void)reloadSection:(NSInteger)section withRowAnimation:(UITableViewRowAnimation)animation {
    //越界的section
    if (section >= [self numberOfSections]) {
        return ;
    }
    //当该section的rows大于0再执行刷新,否则崩溃
    if ([self numberOfRowsInSection:section] > 0) {
        NSIndexSet *indexSet = [NSIndexSet indexSetWithIndex:section];
        [self reloadSections:indexSet withRowAnimation:animation];
    }
}

@end
