//
//  JCTransactionDataModelCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCTransactionDataModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic, strong) UILabel *matchNameLab;//联赛名称

@property (nonatomic, strong) UILabel *matchTimeLab;//比赛时间

@property (nonatomic, strong) UILabel *matchStatusLab;//比赛状态

@property (nonatomic,strong) KKPaddingLabel *typeLab;

@property (nonatomic, strong) UIImageView *homeTeamImgView;//

@property (nonatomic, strong) UIImageView *awayTeamImgView;//

@property (nonatomic, strong) UILabel *homeTeamLab;

@property (nonatomic, strong) UILabel *awayTeamLab;

@property (nonatomic, strong) UILabel *homeScoreLab;

@property (nonatomic, strong) UILabel *awayScoreLab;

@property (nonatomic, strong) UILabel *homeRateLab;

@property (nonatomic, strong) UILabel *awayRateLab;

@property (nonatomic, strong) UIImageView *zhishuImgView;

@property (nonatomic, strong) UILabel *windRateLab;

@property (nonatomic, strong) UILabel *equalRateLab;

@property (nonatomic, strong) UILabel *loseRateLab;

@property (nonatomic, strong) UIImageView *upImgView;

@property (nonatomic, strong) UIImageView *equalImgView;

@property (nonatomic, strong) UIImageView *downImgView;

@property (nonatomic, strong) UILabel *rateChangeLab;

@property (nonatomic, strong) UILabel *infoLab;

@property (nonatomic, strong) UIView *rateChangeView;

@property (nonatomic, strong) JCTransactionDataModel *model;

@end

NS_ASSUME_NONNULL_END
