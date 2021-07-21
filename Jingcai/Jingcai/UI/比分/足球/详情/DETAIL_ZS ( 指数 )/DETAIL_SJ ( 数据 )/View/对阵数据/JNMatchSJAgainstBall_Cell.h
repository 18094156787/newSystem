//
//  JNMatchSJAgainstBall_Cell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCBigDataMonthProduceModel.h"
#import "JCBigDataAnalysisModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JNMatchSJAgainstBall_Cell : JCBaseTableViewCell_New

@property (nonatomic,strong) UILabel *titleInfoLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *homeProgressView;

@property (nonatomic,strong) UIView *awayProgressView;

@property (nonatomic,strong) UILabel *homeRateLab;

@property (nonatomic,strong) UILabel *awayRateLab;

@property (nonatomic,strong) UIView *homeView;

@property (nonatomic,strong) UIView *awayView;

@property (nonatomic,strong) UILabel *homeInfoLab;

@property (nonatomic,strong) UILabel *awayInfoLab;

@property (nonatomic,strong) UIImageView *leftLineImgView;

@property (nonatomic,strong) UIImageView *rightLineImgView;

@property (nonatomic,assign) BOOL is_rq;//no是进球数,yes是让球

@property (nonatomic,assign) BOOL is_win;//no是失球,yes是入球

@property (nonatomic,strong) JCBigDataMonthProduceModel *model;

@property (nonatomic,strong) JCBigDataAnalysisModel *home_analysisModel;//球队分析

@property (nonatomic,strong) JCBigDataAnalysisModel *away_analysisModel;//球队分析

@end

NS_ASSUME_NONNULL_END
