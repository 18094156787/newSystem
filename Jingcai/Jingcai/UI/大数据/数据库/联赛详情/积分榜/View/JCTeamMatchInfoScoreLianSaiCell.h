//
//  JCTeamMatchInfoScoreLianSaiCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoScoreLianSaiCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property (nonatomic, assign) BOOL showTop;

//@property (nonatomic, assign) BOOL isTeam;//标记球队详情,YES为球队详情,no为比赛详情

@end

NS_ASSUME_NONNULL_END
