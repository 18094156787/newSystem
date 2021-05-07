//
//  JCTeamMatchInfoMatchContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamMatchModel.h"
#import "JCTeamMatchInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoMatchContentCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>


@property (nonatomic, strong)  UIView *bgView;

@property (nonatomic, strong) UITableView *tableView;

@property(nonatomic,strong) NSArray *dataArray;

@property(nonatomic,assign) BOOL showResult;//是否显示胜平负图标

@property(nonatomic,strong) JCTeamMatchInfoModel *infoModel;

@end

NS_ASSUME_NONNULL_END
