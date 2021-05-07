//
//  JCBasketMatchDetailTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketMatchDetailTopView.h"
#import "JCTeamDetailWMStickVC.h"
@implementation JCBasketMatchDetailTopView

- (void)initViews {
    [self addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight);
        make.left.right.bottom.equalTo(self);
    }];
    
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight);
        make.left.right.bottom.equalTo(self);
    }];
    
    [self.topView addSubview:self.ongongTimeLab];
    [self.ongongTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView);
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(16));
    }];

    [self.topView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView);
        make.top.equalTo(self.ongongTimeLab.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.topView addSubview:self.halfScoreLab];
    [self.halfScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topView);
        make.top.equalTo(self.scoreLab.mas_bottom).offset(AUTO(10));

    }];

    [self.topView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(SCREEN_WIDTH/4.0f-AUTO(40));
        make.bottom.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(40));
    }];

    [self.topView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-SCREEN_WIDTH/4.0f+AUTO(40));
        make.bottom.equalTo(self.scoreLab);
        make.width.height.mas_equalTo(AUTO(40));
    }];

    [self.topView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeImgView);
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(100));
        make.height.mas_equalTo(AUTO(40));
    }];

    [self.topView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayImgView);
        make.top.equalTo(self.awayImgView.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(100));
        make.height.mas_equalTo(AUTO(40));
    }];



    [self.topView addSubview:self.aniLiveBtn];
    [self.aniLiveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.topView).offset(AUTO(-12));
        make.centerX.equalTo(self.topView);
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(20)));
    }];
    
    UIImageView *liveImgView = [UIImageView new];
    liveImgView.image = JCIMAGE(@"zhibo_live_small");
    [self.aniLiveBtn addSubview:liveImgView];
    [liveImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(10);
        make.centerY.equalTo(self.aniLiveBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(11)));
    }];
    
    UILabel *liveLab = [UILabel initWithTitle:@"动画" andFont:AUTO(10) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.aniLiveBtn addSubview:liveLab];
    [liveLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(liveImgView.mas_right).offset(2);
        make.centerY.equalTo(self.aniLiveBtn);
    }];
    

    WeakSelf;
    [self.homeImgView bk_whenTapped:^{
        if (weakSelf.matchBall.homeId.length>0) {
            JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
            vc.team_id = weakSelf.matchBall.homeId;
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        }

    }];

    [self.awayImgView bk_whenTapped:^{
        if (weakSelf.matchBall.awayId.length>0) {
            JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
            vc.team_id = weakSelf.matchBall.awayId;
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        }

    }];
    
    
}


- (void)setMatchBall:(JCWMatchBall *)matchBall {
    _matchBall = matchBall;
    self.titleLab.text = NonNil(matchBall.leagueName);
    self.timeLab.text = [matchBall introOfDetail];
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.homeLogo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.awayLogo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeNameLab.text = NonNil(matchBall.homeName);
    self.awayNameLab.text = NonNil(matchBall.awayName);
    self.aniLiveBtn.hidden = [matchBall.animation integerValue]==1?NO:YES;
    self.ongongTimeLab.text = matchBall.match_competition;
    self.halfScoreLab.hidden = matchBall.halfScore.length==0?YES:NO;
    if (matchBall.matchStatus ==1) {
        
        self.scoreLab.text = @"VS";
        self.halfScoreLab.text = matchBall.halfScore;
        self.statusLab.text = matchBall.match_competition;
    }else  if (matchBall.matchStatus ==2){
        self.scoreLab.text = matchBall.fullScore;
        self.halfScoreLab.text = [NSString stringWithFormat:@"(%@)",matchBall.halfScore];
        self.statusLab.text = matchBall.match_competition;
    }else {
         self.scoreLab.text = NonNil(matchBall.fullScore);
        if (matchBall.matchStatus ==4||matchBall.matchStatus ==5) {
            self.scoreLab.text = @"VS";
        }
        self.halfScoreLab.text = [NSString stringWithFormat:@"(%@)",matchBall.halfScore];
        self.statusLab.text = matchBall.match_competition;
    }
    
}

- (void)setBasketBallMatch:(JCBasketBallMatchBall *)basketBallMatch {
    _basketBallMatch = basketBallMatch;
    self.aniLiveBtn.hidden = YES;
//    self.titleLab.text = NonNil(matchBall.leagueName);
    self.timeLab.text = basketBallMatch.match_time;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:basketBallMatch.away_team_logo    ] placeholderImage:JCIMAGE(@"ic_match_basketball")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:basketBallMatch.home_team_logo] placeholderImage:JCIMAGE(@"ic_match_basketball")];
    self.homeNameLab.text = NonNil(basketBallMatch.away_team_name);
    self.awayNameLab.text = NonNil(basketBallMatch.home_team_name);
//    self.aniLiveBtn.hidden = [matchBall.animation integerValue]==1?NO:YES;
    self.ongongTimeLab.text = basketBallMatch.status_cn;

//    self.halfScoreLab.hidden = [basketBallMatch.is_show_half_score intValue]==1?NO:YES;

    if ([basketBallMatch.status_id intValue]>1&&[basketBallMatch.status_id intValue]<11) {
        self.scoreLab.text = [NSString stringWithFormat:@"%@ - %@",basketBallMatch.away_scores_sum,basketBallMatch.home_scores_sum];
        self.halfScoreLab.text = [NSString stringWithFormat:@"(%@ - %@)",basketBallMatch.away_scores_half_sum,basketBallMatch.home_scores_half_sum];
    }else
    {
//        self.scoreLab.textColor = JCBaseColor
        self.scoreLab.text = @"VS";
        self.halfScoreLab.text = @"";
    }
//    self.statusLab.text = basketBallMatch.match_competition;
//    if (basketBallMatch.matchStatus ==1) {
//
//        self.scoreLab.text = @"VS";
//        self.halfScoreLab.text = basketBallMatch.halfScore;
//        self.statusLab.text = basketBallMatch.match_competition;
//    }else  if (basketBallMatch.matchStatus ==2){
//        self.scoreLab.text = basketBallMatch.fullScore;
//        self.halfScoreLab.text = [NSString stringWithFormat:@"(%@)",basketBallMatch.halfScore];
//        self.statusLab.text = basketBallMatch.match_competition;
//    }else {
//         self.scoreLab.text = NonNil(basketBallMatch.fullScore);
//        if (basketBallMatch.matchStatus ==4||basketBallMatch.matchStatus ==5) {
//            self.scoreLab.text = @"VS";
//        }
//        self.halfScoreLab.text = [NSString stringWithFormat:@"(%@)",basketBallMatch.halfScore];
//        self.statusLab.text = basketBallMatch.match_competition;
//    }
}

-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    // 获取加载网页的标题
//    if (self.titleStr.length==0) {
//        self.title = self.wkWebView.title;
//    }
//
//    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
////    [self updateNavigationItems];
//    if (self.loadSuccessBlock) {
//        self.loadSuccessBlock();
//    }
//    [self addSubview:self.wkWebView];
//    self.wkWebView.backgroundColor = JCBlackColor;
//    self.isLoad = YES;
    [self.loadingView removeFromSuperview];
    
}

- (void)aniLiveBtnClick {
    if (self.matchBall.live_url.length==0) {
        return;;
    }
    float height = kWMMatchDetailHeaderViewHeight;
//    float height = kWMMatchDetailHeaderViewHeight+50;
    if (self.addAniBlock) {
        self.addAniBlock(kWMMatchDetailHeaderViewHeight+0.01);
    }
    
    
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.matchBall.live_url]];

    
//    if (!self.isLoad) {
        self.wkWebView = [WKWebView new];
        self.wkWebView.navigationDelegate = self;
        self.wkWebView.UIDelegate = self;

//        _wkWebView.isOpaque = false;
        self.wkWebView.opaque = NO;
//        self.wkWebView.backgroundColor = JCBaseColor;
//        self.wkWebView.scrollView.backgroundColor = COLOR_999999;
    self.wkWebView.frame = CGRectMake(0, -kNavigationBarHeight, SCREEN_WIDTH,height);
    self.wkWebView.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.7];
    [self.wkWebView loadRequest:request];
    [self.topView addSubview:self.wkWebView];
    [self.wkWebView addSubview:self.loadingView];
    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(self);
    }];
    
    self.backBtn.frame = CGRectMake(0, StatusBar_HEIGHT, 44, 44);
    [self addSubview:self.backBtn];
//    }


}

- (void)backBtnClick {
    if (self.JCBackBlock) {
        self.JCBackBlock();
    }
}


- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.image = JCIMAGE(@"match_top_bg");
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

- (UIImageView *)topView {
    if (!_topView) {
        _topView = [UIImageView new];
        _topView.userInteractionEnabled = YES;
    }
    return _topView;
}


- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = JCWhiteColor;
        [_bottomView hg_setCornerOnTopWithRadius:AUTO(15)];
    }
    return _bottomView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
//        [_homeImgView hg_setAllCornerWithCornerRadius:AUTO(25)];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
        _homeImgView.userInteractionEnabled = YES;
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
//        [_awayImgView hg_setAllCornerWithCornerRadius:AUTO(25)];
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;
         _awayImgView.userInteractionEnabled = YES;
    }
    return _awayImgView;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(28) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _scoreLab;
}

- (UILabel *)halfScoreLab {
    if (!_halfScoreLab) {
        _halfScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _halfScoreLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeNameLab.numberOfLines = 2;
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayNameLab.numberOfLines = 2;
    }
    return _awayNameLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:[JCWhiteColor colorWithAlphaComponent:0.75] andBackgroundColor:[JCClearColor colorWithAlphaComponent:0.1] andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

- (UILabel *)ongongTimeLab {
    if (!_ongongTimeLab) {
        _ongongTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _ongongTimeLab;
}



- (UIButton *)aniLiveBtn {
    if (!_aniLiveBtn) {
        _aniLiveBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:[COLOR_000000 colorWithAlphaComponent:0.3] TextColors:JCWhiteColor];
        [_aniLiveBtn hg_setAllCornerWithCornerRadius:AUTO(14)];
        [_aniLiveBtn addTarget:self action:@selector(aniLiveBtnClick) forControlEvents:UIControlEventTouchUpInside];
        
        _aniLiveBtn.hidden = YES;
    }
    return _aniLiveBtn;
}

//- (WKWebView *)wkWebView {
//    if (!_wkWebView) {
//        _wkWebView = [WKWebView new];
//        _wkWebView.navigationDelegate = self;
//        _wkWebView.UIDelegate = self;
////        _wkWebView.isOpaque = false;
//        _wkWebView.opaque = NO;
//        _wkWebView.backgroundColor = JCBaseColor;
//        _wkWebView.scrollView.backgroundColor = COLOR_999999;
//    }
//    return _wkWebView;
//}
- (JCAnimationLoadingView *)loadingView {
    if (!_loadingView) {
        _loadingView = [JCAnimationLoadingView new];
    }
    return _loadingView;
}

- (UIButton *)backBtn {
    if (!_backBtn) {
        _backBtn = [UIButton new];
        [_backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:0];
        [_backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:UIControlStateHighlighted];
        [_backBtn addTarget:self action:@selector(backBtnClick) forControlEvents:UIControlEventTouchUpInside];
        _backBtn.userInteractionEnabled = YES;
    }
    return _backBtn;
}

@end
