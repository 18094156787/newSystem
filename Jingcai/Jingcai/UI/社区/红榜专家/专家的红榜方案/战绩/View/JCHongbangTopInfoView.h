//
//  JCHongbangTopInfoView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCHongBangCircleView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangTopInfoView : JCBaseView

@property (nonatomic,strong) UILabel *huibaoInfoLab;

@property (nonatomic,strong) UILabel *recent_hongInfoLab;

@property (nonatomic,strong) UILabel *most_hongInfoLab;

@property (nonatomic,strong) UILabel *huibaoLab;

@property (nonatomic,strong) UILabel *recent_hongLab;

@property (nonatomic,strong) UILabel *most_hongLab;

@property (nonatomic,strong) UILabel *mizhongInfoLab;

@property (nonatomic,strong) UILabel *mizhongLab;

@property (nonatomic,strong) UIView *circleBgView;

@property (nonatomic,strong) JCHongBangCircleView *circleView;

@property (nonatomic,strong) UILabel *zs_infoLab;

@property (nonatomic,strong) UILabel *zjCountLab;//战绩数量

@property (nonatomic,strong) UILabel *zsCountLab;//走势数量

@property (nonatomic,strong) JCWExpertBall *exprtModel;



@end

NS_ASSUME_NONNULL_END
