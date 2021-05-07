//
//  JCYCRankTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCRankTopView.h"

@implementation JCYCRankTopView

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;

    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    self.gl = [CAGradientLayer layer];
    self.gl.frame = CGRectMake(0,0,SCREEN_WIDTH,100+kNavigationBarHeight);
    self.gl.startPoint = CGPointMake(0.5, 0.05);
    self.gl.endPoint = CGPointMake(0.5, 1);
    self.gl.colors = @[(__bridge id)[UIColor colorWithRed:187/255.0 green:0/255.0 blue:61/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:72/255.0 green:4/255.0 blue:31/255.0 alpha:1.0].CGColor];
//    self.bgView.layer.cornerRadius = 68;
    [self.bgView.layer addSublayer:self.gl];

    [self addSubview:self.contentBgView];
    [self.contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(kNavigationBarHeight);
        make.height.mas_equalTo(80);
    }];
    
//    [self addSubview:self.bottomView];
//    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.right.offset(0);
//        make.bottom.equalTo(self);
//        make.height.mas_equalTo(20);
//    }];
    
    [self.contentBgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.top.offset(AUTO(15));
        make.width.height.mas_equalTo(AUTO(48));
    }];
    

    
    [self.contentBgView addSubview:self.qianyueView];
    [self.qianyueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgView.mas_centerX);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(15)));
    }];
    
    [self.contentBgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.height.mas_equalTo(20);
    }];
    
//    [self.contentBgView addSubview:self.infoLab];
//    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.equalTo(self.nameLab);
//        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(5));
//    }];
    
    [self.contentBgView addSubview:self.recordLab];
    [self.recordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(AUTO(5));
        make.right.offset(AUTO(-35));
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-35));
        make.top.equalTo(self.recordLab.mas_bottom).offset(AUTO(5));
    }];


}




- (void)setModel:(JCYuceCommomModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
    self.nameLab.text = model.user_name;
    self.historyLab.text = @"上周战绩";
    self.recordLab.text = model.week_rank;
    self.qianyueView.hidden = [model.top integerValue]==1?NO:YES;
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

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _infoLab;
}

- (UILabel *)recordLab {
    if (!_recordLab) {
        _recordLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _recordLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(20)];
    }
    return _recordLab;
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



@end
