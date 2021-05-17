//
//  JNMatchSJLianSaiScoreTableViewCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJLianSaiScoreTableViewCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
