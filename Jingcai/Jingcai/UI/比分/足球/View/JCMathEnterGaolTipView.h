//
//  JCMathEnterGaolTipView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCTipMatchInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMathEnterGaolTipView : JCBaseView

@property (nonatomic,strong) UIImageView *bgImgView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *ballImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *homeScoreLab;

@property (nonatomic,strong) UILabel *awayScoreLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *settingScoreLab;

@property (nonatomic,copy) void(^JCGoalBall)(void);

@property (nonatomic,strong) JCTipMatchInfoModel *model;

@end

NS_ASSUME_NONNULL_END
