//
//  JCMatchGoalDistributionInfoProgressView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWZBStatusModel.h"
#import "JCLiveDistributionModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchGoalDistributionInfoProgressView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *progressView;

@property (nonatomic,strong) UILabel *leftLab;

@property (nonatomic,strong) UILabel *rightLab;

@property (nonatomic,strong) UILabel *leftRateLab;

@property (nonatomic,strong) UILabel *rightRateLab;

@property (nonatomic,strong) JCWZBStatusModel *model;

@property (nonatomic,strong) JCWZBStatusModel *basketBallModel;

@property (nonatomic,strong) JCLiveDistributionModel *shoot_centerModel;//射正球门

@property (nonatomic,strong) JCLiveDistributionModel *shoot_awayModel;//足球直播

@end

NS_ASSUME_NONNULL_END
