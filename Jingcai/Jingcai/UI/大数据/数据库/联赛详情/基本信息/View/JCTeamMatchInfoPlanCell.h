//
//  JCTeamMatchInfoPlanCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTeamMatchModel.h"
#import "KKPaddingLabel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoPlanCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *backImgView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic,strong) KKPaddingLabel *countLab;

@property (nonatomic,strong) JCTeamMatchModel *model;

@property (nonatomic,strong) JCTeamMatchModel *teamModel;//球队详情基本信息

@end

NS_ASSUME_NONNULL_END
