//
//  JCYCRankTopView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCYuceCommomModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCRankTopView : JCBaseView

@property (nonatomic,strong) CAGradientLayer *gl;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIView *contentBgView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UIImageView *headImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UILabel *recordLab;

@property (nonatomic,strong) UILabel *historyLab;

@property (nonatomic,strong) UIImageView *qianyueView;

@property (nonatomic,strong) JCYuceCommomModel *model;


@end

NS_ASSUME_NONNULL_END
