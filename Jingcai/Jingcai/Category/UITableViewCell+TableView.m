//
//  UITableViewCell+TableView.m
//  Jingcai
//
//  Created by Rain on 2018/12/6.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "UITableViewCell+TableView.h"

@implementation UITableViewCell (TableView)
- (UITableView *)tableView {
    UIView * tableView = self.superview;
    while (![tableView isKindOfClass:[UITableView class]] && tableView) {
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}
@end
