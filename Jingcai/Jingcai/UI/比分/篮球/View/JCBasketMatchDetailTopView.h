//
//  JCBasketMatchDetailTopView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCWMatchBall.h"
#import <WebKit/WebKit.h>
#import "JCAnimationLoadingView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketMatchDetailTopView : JCBaseView<WKNavigationDelegate, WKUIDelegate>

@property (nonatomic, strong)JCWMatchBall * matchBall;

@property (nonatomic, strong) JCBasketBallMatchBall *basketBallMatch;

@property (nonatomic,strong) UIImageView *bgImgView;

@property (nonatomic,strong) UIImageView *topView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *ongongTimeLab;//比赛进行时间

@property (nonatomic,strong) UILabel *timeLab;

@property (nonatomic,strong) UIImageView *homeImgView;

@property (nonatomic,strong) UIImageView *awayImgView;

@property (nonatomic,strong) UILabel *homeNameLab;

@property (nonatomic,strong) UILabel *awayNameLab;

@property (nonatomic,strong) UILabel *scoreLab;

@property (nonatomic,strong) UILabel *halfScoreLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UIButton *aniLiveBtn;//动画直播

@property (nonatomic,strong) JCAnimationLoadingView *loadingView;

@property (strong, nonatomic) WKWebView *wkWebView; //webview

@property (strong, nonatomic) UIButton *backBtn;

@property (assign, nonatomic) BOOL isLoad;

@property (nonatomic,copy) void(^addAniBlock)(float height);

@property (nonatomic,copy) void(^JCBackBlock)(void);

@end

NS_ASSUME_NONNULL_END
