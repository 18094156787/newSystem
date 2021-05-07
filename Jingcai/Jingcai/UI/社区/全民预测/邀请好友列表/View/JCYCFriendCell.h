//
//  JCYCFriendCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCFriendCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, assign) UITableViewStyle style;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong)NSMutableArray *dataArray;

@end

NS_ASSUME_NONNULL_END
