//
//  JCBasketBallMatchDetailErrorCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCMatchGoalDistributionInfoProgressView.h"
#import "JCBasketMatchDetailZBFanGuiModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchDetailErrorCell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *homeFgLab;

@property (nonatomic,strong) UILabel *awayFgLab;

@property (nonatomic,strong) UILabel *homeFgInfoLab;

@property (nonatomic,strong) UILabel *awayFgInfoLab;

@property (nonatomic,strong) UILabel *homeZtLab;

@property (nonatomic,strong) UILabel *awayZtLab;

@property (nonatomic,strong) UILabel *homeZtInfoLab;

@property (nonatomic,strong) UILabel *awayZtInfoLab;



@property (nonatomic,strong) JCMatchGoalDistributionInfoProgressView *defenTwoProgressView;//3分

@property (nonatomic,strong) JCMatchGoalDistributionInfoProgressView *defenThreeProgressView;//2分

@property (nonatomic,strong) JCMatchGoalDistributionInfoProgressView *faqiuProgressView;//罚球

@property (nonatomic,strong) JCMatchGoalDistributionInfoProgressView *mingzhongProgressView;//罚球命中

@property (nonatomic,strong) NSMutableArray *viewArray;

@property (strong, nonatomic) NSArray *fgArray;

@property (strong, nonatomic) JCBasketMatchDetailZBFanGuiModel *fgInfoModel;//犯规信息

@end

NS_ASSUME_NONNULL_END
