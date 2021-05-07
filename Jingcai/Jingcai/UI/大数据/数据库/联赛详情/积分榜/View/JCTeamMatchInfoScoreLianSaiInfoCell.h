//
//  JCTeamMatchInfoScoreLianSaiInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCEventScoreLianSaiInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoScoreLianSaiInfoCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *rankLab;

@property (nonatomic,strong) UILabel *teamLab;

@property (nonatomic,strong) UILabel *numberLab;//场次

@property (nonatomic,strong) UILabel *spfLab;//胜/平/负

@property (nonatomic,strong) UILabel *jsLab;//进/失

@property (nonatomic,strong) UILabel *scoreLab;//积分

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *groupLab;//联赛小组

@property (nonatomic, assign) BOOL isTeam;//标记球队详情,YES为球队详情,no为比赛详情

@property (nonatomic,strong) JCEventScoreLianSaiInfoModel *model;

@end

NS_ASSUME_NONNULL_END
