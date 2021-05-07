//
//  JNMatchDetailView_New.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/1/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchDetailView_New.h"
#import "JCTeamDetailWMStickVC.h"
@implementation JNMatchDetailView_New

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
        make.left.offset(SCREEN_WIDTH/8.0f);
        make.bottom.equalTo(self.scoreLab);
        make.height.mas_equalTo(AUTO(40));
        make.width.mas_equalTo(SCREEN_WIDTH/4.0f);;
    }];

    [self.topView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-SCREEN_WIDTH/8.0f);
        make.bottom.equalTo(self.scoreLab);
        make.height.mas_equalTo(AUTO(40));
        make.width.mas_equalTo(SCREEN_WIDTH/4.0f);;
    }];

    [self.topView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.homeImgView);
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(120));
        make.height.mas_equalTo(AUTO(35));
    }];

    [self.topView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.awayImgView);
        make.top.equalTo(self.awayImgView.mas_bottom).offset(AUTO(12));
        make.width.mas_equalTo(AUTO(120));
        make.height.mas_equalTo(AUTO(35));
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
        if (weakSelf.matchBall.home_team.id.length>0) {
            JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
            vc.team_id = weakSelf.matchBall.home_team.id;
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        }

    }];

    [self.awayImgView bk_whenTapped:^{
        if (weakSelf.matchBall.away_team.id.length>0) {
            JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
            vc.team_id = weakSelf.matchBall.away_team.id;
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        }

    }];
    
    
}


- (void)setMatchBall:(JCMatchBall *)matchBall {
    _matchBall = matchBall;
    self.titleLab.text = [NSString stringWithFormat:@"%@",matchBall.competition.short_name_zh];
    self.timeLab.text = matchBall.get_match_time;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.home_team.logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:matchBall.away_team.logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeNameLab.text = NonNil(matchBall.home_team.name_zh);
    self.awayNameLab.text = NonNil(matchBall.away_team.name_zh);
    if ([matchBall.coverage_mlive integerValue]==1) {
        self.aniLiveBtn.hidden = matchBall.live_url.length>0?NO:YES;
    }
//    self.ongongTimeLab.text = matchBall.match_competition;
//    self.halfScoreLab.hidden = matchBall.halfScore.length==0?YES:NO;

   
//    self.statusLab.text = @"完场";
//0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定
    if (matchBall.status_id>1&&matchBall.status_id<9) {
        self.scoreLab.text = [NSString stringWithFormat:@"%@:%@",matchBall.home_all_score,matchBall.away_all_score];
        if (matchBall.status_id>3) {
            self.halfScoreLab.text = [NSString stringWithFormat:@"(半场%@:%@)",matchBall.home_half_score,matchBall.away_half_score];
        }
        if (matchBall.status_id==2||matchBall.status_id==4) {
            double currentTime = [[NSDate date] timeIntervalSince1970];
            if ([matchBall.second_half_time floatValue]>0) {
                //计算时间差
               
                double distance = currentTime-[matchBall.second_half_time floatValue];
                self.ongongTimeLab.text = [NSString stringWithFormat:@"%.0f'",distance/60+45];
    //            [NSDate dateWithTimeIntervalSince1970:(NSTimeInterval)]
            }else{

                double distance = currentTime-[matchBall.first_half_time floatValue];
                self.ongongTimeLab.text = [NSString stringWithFormat:@"%.0f'",distance/60];
                
            }
        }else {
            self.ongongTimeLab.text = matchBall.status_cn;
        }



        
//        if (matchBall.status_id==8) {
//            self.ongongTimeLab.text = matchBall.status_cn;
//        }


    }else{
        self.scoreLab.text = @"VS";
        self.halfScoreLab.text = @"";
        self.ongongTimeLab.text = matchBall.status_cn;

    }
    
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
        return;
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
        _halfScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
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
