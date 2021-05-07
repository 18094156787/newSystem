//
//  JCTeamMatchInfoPlanView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCTeamMatchModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoPlanView : JCBaseView

@property (nonatomic,strong) UIImageView *backImgView;

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *awayLab;

@property (nonatomic,strong) UIImageView *countImgView;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) JCTeamMatchModel *model;

@end

NS_ASSUME_NONNULL_END
