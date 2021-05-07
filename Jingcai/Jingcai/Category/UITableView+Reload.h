//
//  UITableView+Reload.h
//  CoinWay
//
//  Created by Rain on 2018/8/21.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Reload)
//刷新row
- (void)reloadRow:(NSInteger)row section:(NSInteger)section;
//- (void)reloadRow:(NSInteger)row section:(NSInteger)section withRowAnimation:(UITableViewRowAnimation)animation;
//刷新section
- (void)reloadSection:(NSInteger)section;
//- (void)reloadSection:(NSInteger)section withRowAnimation:(UITableViewRowAnimation)animation;

@end
