//
//  JCBasketMatchDetailTeamScoreCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBasketMatchDetailZBFormModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketMatchDetailTeamScoreCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) JCBasketMatchDetailZBFormModel *formModel;


@end

NS_ASSUME_NONNULL_END
