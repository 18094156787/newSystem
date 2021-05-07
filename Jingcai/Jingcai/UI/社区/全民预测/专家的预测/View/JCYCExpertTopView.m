//
//  JCYCExpertTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCExpertTopView.h"
#import "JCYCRankStickyVC.h"
#import "JCYCExpertYcRecordViewController.h"
#import "JCYCExpertYcRecondWMStickyVC.h"
@implementation JCYCExpertTopView

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;

    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    self.gl = [CAGradientLayer layer];
    self.gl.frame = CGRectMake(0,0,SCREEN_WIDTH,110+kNavigationBarHeight);
    self.gl.startPoint = CGPointMake(0.5, 0.05);
    self.gl.endPoint = CGPointMake(0.5, 1);
    self.gl.colors = @[(__bridge id)[UIColor colorWithRed:187/255.0 green:0/255.0 blue:61/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:72/255.0 green:4/255.0 blue:31/255.0 alpha:1.0].CGColor];
    self.gl.locations = @[@(0), @(1.0f)];
//    self.bgView.layer.cornerRadius = 68;
    [self.bgView.layer addSublayer:self.gl];

    [self addSubview:self.contentBgView];
    [self.contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(kNavigationBarHeight);
        make.height.mas_equalTo(110);
    }];
    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.top.offset(AUTO(20));
        make.width.height.mas_equalTo(AUTO(48));
    }];
    
    [self.contentBgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(3);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLab.mas_bottom).offset(2);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.qianyueView];
    [self.qianyueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgView.mas_centerX);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(15)));
    }];
    
    
    [self.contentBgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-35));
        make.centerY.equalTo(self.nameLab).offset(-5);
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-35));
        make.top.equalTo(self.countLab.mas_bottom);
    }];
    
    UIImageView *indicateImgView = [UIImageView new];
    [self.contentBgView addSubview:indicateImgView];
    indicateImgView.image = JCIMAGE(@"jc_match_myIndicate");
    [indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.historyLab.mas_right);
        make.centerY.equalTo(self.historyLab);
        make.width.height.mas_equalTo(AUTO(22));
    }];
    self.indicateImgView = indicateImgView;
    
    UIView *historyBgView = [UIView new];
    [self.contentBgView insertSubview:historyBgView belowSubview:self.historyLab];
    [historyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.historyLab);
        make.right.equalTo(indicateImgView);
    }];
    
    WeakSelf;
    [historyBgView bk_whenTapped:^{
        if (weakSelf.noClick) {
            return;
        }
        JCYCExpertYcRecondWMStickyVC *vc = [JCYCExpertYcRecondWMStickyVC new];
        vc.expertID = weakSelf.expertID;
        vc.title = [NSString stringWithFormat:@"%@的战绩",weakSelf.model.user_name];
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
    [self.countLab bk_whenTapped:^{
        if (weakSelf.noClick) {
            return;
        }
        JCYCExpertYcRecondWMStickyVC *vc = [JCYCExpertYcRecondWMStickyVC new];
        vc.expertID = weakSelf.expertID;
        vc.title = [NSString stringWithFormat:@"%@的战绩",weakSelf.model.user_name];
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
//    [self.contentBgView addSubview:self.bottombgView];
//    [self.bottombgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(12);
//        make.right.offset(-12);
//        make.top.equalTo(self.headImgView.mas_bottom).offset(0);
//        make.height.mas_equalTo(AUTO(92));
//    }];

    
//    [self data];
    
 
}


//- (void)data {
//    self.nameLab.text = @"杰克船长008";
//    self.infoLab.text = @"本周：3 连红 | 命中 3 场";
//    self.countLab.text = @"5次";
//    self.historyLab.text = @"历史上榜";
////    self.bottombgView.backgroundColor = [UIColor yellowColor];
//    self.contentLab.text = @"本周再中 5 次就能瓜分万元现金";
//}

//- (void)setCommom_Model:(JCYuceCommomModel *)commom_Model {
//    _commom_Model = commom_Model;
//    
//    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:commom_Model.user_img]];
//    self.nameLab.text = commom_Model.user_name;
//    self.countLab.text = [NSString stringWithFormat:@"%@次",commom_Model.top_num];
//    self.historyLab.text = @"历史上榜";
//    self.qianyueView.hidden = [commom_Model.top integerValue]==1?NO:YES;
//    
//    self.infoLab.text = [NSString stringWithFormat:@"本周：%@ 连红 | 命中 %@ 场",NonNil(commom_Model.red_num),NonNil(userModel.hit_num)];
//}

- (void)setUserModel:(JCYCTopUserInfoModel *)userModel {
    _userModel = userModel;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:userModel.user_info.user_img]];
    self.nameLab.text = userModel.user_info.user_name;
    self.countLab.text = [NSString stringWithFormat:@"%@次",userModel.top_num];
    self.historyLab.text = @"历史上榜";
    self.qianyueView.hidden = [userModel.top integerValue]==1?NO:YES;
    
    self.infoLab.text = [NSString stringWithFormat:@"本周：%@ 连红 | 命中 %@ 场",NonNil(userModel.red_num),NonNil(userModel.hit_num)];
}

- (void)setModel:(JCYCUserInfoModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
    self.nameLab.text = model.user_name;
    self.countLab.text = model.rank_count;
    self.historyLab.text = @"历史上榜";
    self.contentLab.text = model.yc_desc;
    self.qianyueView.hidden = [model.top integerValue]==1?NO:YES;
    
    self.infoLab.text = [NSString stringWithFormat:@"本周：%@ 连红 | 命中 %@ 场",NonNil(model.lianhong),NonNil(model.mingzhong)];
}



- (void)setNoClick:(BOOL)noClick {
    _noClick = noClick;
   self.indicateImgView.hidden = noClick;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];

    }
    return _bgView;;
}

- (UIView *)contentBgView {
    if (!_contentBgView) {
        _contentBgView = [UIView new];
    }
    return _contentBgView;;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = COLOR_F0F0F0;
        [_bottomView hg_setCornerOnTopWithRadius:12];
    }
    return _bottomView;;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.layer.borderWidth = 1;
        _headImgView.layer.borderColor = COLOR_A9A9A9.CGColor;
        _headImgView.layer.cornerRadius = AUTO(24);
        _headImgView.layer.masksToBounds = YES;
    }
    return _headImgView;;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    }
    return _nameLab;
}



- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _countLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(20)];
        _countLab.userInteractionEnabled = YES;
    }
    return _countLab;
}

- (UILabel *)historyLab {
    if (!_historyLab) {
        _historyLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
        _historyLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _historyLab;
}

- (UIImageView *)qianyueView {
    if (!_qianyueView) {
        _qianyueView = [UIImageView new];
        _qianyueView.image = JCIMAGE(@"jc_qianyue_tag");
        _qianyueView.hidden = YES;
    }
    return _qianyueView;;
}

- (UIImageView *)bottombgView {
    if (!_bottombgView) {
        _bottombgView = [UIImageView new];
        _bottombgView.image = JCIMAGE(@"jc_match_myBg");
//        [_bottombgView hg_setAllCornerWithCornerRadius:AUTO(28)];
    }
    return _bottombgView;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    }
    return _contentLab;
}

- (UILabel *)predicateLab {
    if (!_predicateLab) {
        _predicateLab = [UILabel initWithTitle:@"去预测" andFont:16 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _predicateLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    }
    return _predicateLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
        
    }
    return _infoLab;
}

@end
