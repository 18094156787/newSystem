//
//  JCTeamMatchInfoScoreXioaZuCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCEventScoreXiaoZuInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoScoreXioaZuCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

//@property (nonatomic, strong) JCEventScoreXiaoZuInfoModel *model;



@property(nonatomic,strong) NSArray *dataArray;

@end

NS_ASSUME_NONNULL_END
