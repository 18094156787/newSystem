//
//  JNMatchSJAgainstTeam_HistoryBattleCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataVS_AnalysisModel.h"
#import "JNMatchSJAgainstTeam_HistoryBattleContentCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstTeam_HistoryBattleCell : JCBaseTableViewCell_New<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *leftLineImgView;

@property (nonatomic,strong) UIImageView *rightLineImgView;

@property (nonatomic,strong) UIView *homeView;

@property (nonatomic,strong) UIView *awayView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) JCBigDataVS_AnalysisModel *model;

@end

NS_ASSUME_NONNULL_END
