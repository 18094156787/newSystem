//
//  JCTeamMatchInfoPlanView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoPlanView.h"

@implementation JCTeamMatchInfoPlanView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    [self addSubview:self.backImgView];
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(77));
    }];
    
    [self.backImgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.offset(AUTO(10));
    }];
    
    UIImageView *countImgView = [UIImageView new];
    [self.backImgView addSubview:countImgView];
    countImgView.image = JCIMAGE(@"img_fa");
    [countImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.offset(AUTO(10));
        make.size.mas_equalTo(CGSizeMake(AUTO(54), AUTO(16)));
    }];
    self.countImgView = countImgView;
    
    [countImgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    [self.backImgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(40));
        make.centerX.equalTo(self.backImgView);
        make.width.mas_equalTo(AUTO(35));
    }];
    
    [self.backImgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.infoLab.mas_left);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.backImgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoLab.mas_right);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.backImgView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(AUTO(-55));
        make.left.offset(AUTO(5));
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    [self.backImgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(AUTO(55));
        make.right.offset(AUTO(-5));
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    
}

- (void)setModel:(JCTeamMatchModel *)model {
    _model = model;
    self.timeLab.text = model.match_time;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.homeLogo] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.homeImgView.backgroundColor = JCWhiteColor;
    }];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.awayLogo] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        self.awayImgView.backgroundColor = JCWhiteColor;
    }];
    self.homeLab.text = model.homeName;
    self.awayLab.text = model.awayName;
    if ([model.fangan_count integerValue]>0) {
        self.countLab.text = [NSString stringWithFormat:@"%@场方案",model.fangan_count];
        self.countImgView.hidden = NO;
    }else{
        self.countLab.text = @"";
        self.countImgView.hidden = YES;
    }
        
        
}


- (UIImageView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIImageView new];
        _backImgView.image = JCIMAGE(@"home_img_bs");
        [_backImgView hg_setAllCornerWithCornerRadius:AUTO(4)];
    }
    return _backImgView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"VS" andFont:12 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
        [_homeImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;
        [_awayImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _awayImgView;
}

- (UILabel *)homeLab {
    if (!_homeLab) {
        _homeLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
    }
    return _homeLab;
}

- (UILabel *)awayLab {
    if (!_awayLab) {
        _awayLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _awayLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}

@end
