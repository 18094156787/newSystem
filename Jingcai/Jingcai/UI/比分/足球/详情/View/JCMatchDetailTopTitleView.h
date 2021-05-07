//
//  JCMatchDetailTopTitleView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchDetailTopTitleView : JCBaseView

@property (nonatomic,strong) UIView *infoView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) UIView *matchView;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic, strong)JCMatchBall * matchBall;

@property (nonatomic, strong) JCBasketBallMatchBall *basketBallMatch;

@end

NS_ASSUME_NONNULL_END
