//
//  JCMathEnterGaolTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMathEnterGaolTipView.h"
#import <SDWebImage/UIImage+GIF.h>
#import <SDWebImage/UIImage+GIF.h>
@implementation JCMathEnterGaolTipView

- (void)initViews {
    [self addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(80));
    }];
    
    [self.bgImgView addSubview:self.gifImgView];
    [self.gifImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.bgImgView);
//        make.right.offset(0);
        make.size.mas_equalTo(CGSizeMake(132,72));
    }];
    
    [self.bgImgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.right.offset(AUTO(-33));
        make.height.mas_equalTo(AUTO(20));
        make.width.mas_equalTo(AUTO(42));
    }];
    
    
    [self.bgImgView addSubview:self.matchNameLab];
    [self.matchNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.left.offset(AUTO(165));
        make.right.equalTo(self.timeLab.mas_left);
        make.height.mas_equalTo(AUTO(20));
    }];
    

    
    [self.bgImgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.matchNameLab);
        make.top.offset(AUTO(28));
        make.height.mas_equalTo(AUTO(23));
    }];
    
    [self.bgImgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.matchNameLab);
        make.top.equalTo(self.homeNameLab.mas_bottom);
        make.height.mas_equalTo(AUTO(20));
    }];
    


    
    [self.bgImgView addSubview:self.homeScoreLab];
    [self.homeScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.timeLab);
        make.centerY.equalTo(self.homeNameLab);
        make.width.mas_equalTo(AUTO(40));
        
    }];
    
    [self.bgImgView addSubview:self.awayScoreLab];
    [self.awayScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.timeLab);
        make.centerY.equalTo(self.awayNameLab);
    }];
    
    [self.bgImgView addSubview:self.ballImgView];
    [self.ballImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeNameLab.mas_left).offset(-2);
        make.centerY.equalTo(self.homeNameLab);
        make.width.height.mas_equalTo(AUTO(12));
    }];
    
    
//    [self.bgImgView addSubview:self.settingScoreLab];
//    [self.settingScoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.bgImgView);
//        make.right.offset(AUTO(-18  ));
//        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(20)));
//    }];
    
//    [self.bgImgView addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.bgImgView);
//        make.right.offset(AUTO(-60));
//    }];
    
    WeakSelf;
    [self.settingScoreLab bk_whenTapped:^{
        
        if (weakSelf.JCGoalBall) {
            weakSelf.JCGoalBall();
        }
    }];
    
}



//- (void)data {
////    [self.gifImgView sd]
////    NSString *path = [[NSBundle mainBundle] pathForResource:@"jc_enterlball" ofType:@"gif"];
////    NSData *data = [NSData dataWithContentsOfFile:path];
////    self.gifImgView.image = [UIImage sd_imageWithGIFData:data];
////    self.gifImgView.animationImages
//    NSMutableArray *imageArray = [NSMutableArray array];
//    for (int i=0; i<45; i++) {
//        NSString *name = [NSString stringWithFormat:@"jc_enterlball_%d",i];
//        UIImage *img = JCIMAGE(name);
//        [imageArray addObject:img];
//    }
//    self.gifImgView.animationImages = imageArray;
//    self.gifImgView.animationDuration = 1.5;
//    [self.gifImgView startAnimating];
//
//    self.timeLab.text = @"50'";
//    self.matchNameLab.text = @"球会友谊";
//    self.homeNameLab.text = @"主队";
//    self.awayNameLab.text = @"主队";
//    self.homeScoreLab.text = @"5";
//    self.awayScoreLab.text = @"6";
//
//    self.homeNameLab.textColor = JCWhiteColor;
//    self.homeNameLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
//    self.homeScoreLab.textColor = JCWhiteColor;
//    self.homeScoreLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
//
//    self.awayNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.8];
//    self.awayNameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
//    self.awayScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.8];
//    self.awayScoreLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
//
//    [self.ballImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.awayNameLab.mas_left).offset(-2);
//        make.centerY.equalTo(self.awayNameLab);
//        make.width.height.mas_equalTo(AUTO(12));
//    }];
//
//}

- (void)setModel:(JCTipMatchInfoModel *)model {
    _model = model;
    self.timeLab.text = [NSString stringWithFormat:@"%@'",model.goal_time];
    self.matchNameLab.text = model.competition_name;
    self.homeNameLab.text = model.home_team_name;
    self.awayNameLab.text = model.away_team_name;
    self.homeScoreLab.text = model.home_score;
    self.awayScoreLab.text = model.away_score;
    
    self.gifImgView.animationImages = self.imageArray;
    self.gifImgView.animationDuration = 1.5;
    [self.gifImgView startAnimating];
        

    if ([model.position integerValue]==1) {
        self.homeNameLab.textColor = JCWhiteColor;
        self.homeNameLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
        self.homeScoreLab.textColor = JCWhiteColor;
        self.homeScoreLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
        
        self.awayNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.8];
        self.awayNameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        self.awayScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.8];
        self.awayScoreLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        
        [self.ballImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.homeNameLab.mas_left).offset(-2);
            make.centerY.equalTo(self.homeNameLab);
            make.width.height.mas_equalTo(AUTO(12));
        }];

    }else{
        
        self.homeNameLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.8];
        self.homeNameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        self.homeScoreLab.textColor = [JCWhiteColor colorWithAlphaComponent:0.8];
        self.homeScoreLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        
        self.awayNameLab.textColor = JCWhiteColor;
        self.awayNameLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
        self.awayScoreLab.textColor = JCWhiteColor;
        self.awayScoreLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];

        
        [self.ballImgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(self.awayNameLab.mas_left).offset(-2);
            make.centerY.equalTo(self.awayNameLab);
            make.width.height.mas_equalTo(AUTO(12));
        }];
    }
        
}

- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.image= JCIMAGE(@"img_jq_bg");
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

- (UIImageView *)gifImgView {
    if (!_gifImgView) {
        _gifImgView = [UIImageView new];
    }
    return _gifImgView;
}

- (UIImageView *)ballImgView {
    if (!_ballImgView) {
        _ballImgView = [UIImageView new];
        _ballImgView.image= JCIMAGE(@"jc_jq_ball");
    }
    return _ballImgView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_000000 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _timeLab;
}

- (UILabel *)matchNameLab {
    if (!_matchNameLab) {
        _matchNameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_000000 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _matchNameLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayNameLab;
}

- (UILabel *)homeScoreLab {
    if (!_homeScoreLab) {
        _homeScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeScoreLab;
}

- (UILabel *)awayScoreLab {
    if (!_awayScoreLab) {
        _awayScoreLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _awayScoreLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"进球！" andFont:AUTO(16) andWeight:3 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)settingScoreLab {
    if (!_settingScoreLab) {
        _settingScoreLab = [UILabel initWithTitle:@"去设置" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _settingScoreLab.userInteractionEnabled = YES;
        [_settingScoreLab hg_setAllCornerWithCornerRadius:AUTO(10)];
    }
    return _settingScoreLab;
}
- (NSMutableArray *)imageArray {
    if (!_imageArray) {
        _imageArray = [NSMutableArray array];
        for (int i=0; i<45; i++) {
            NSString *name = [NSString stringWithFormat:@"jc_enterlball_%d",i];
            UIImage *img = JCIMAGE(name);
            [_imageArray addObject:img];
        }
    }
    return _imageArray;
}

@end
