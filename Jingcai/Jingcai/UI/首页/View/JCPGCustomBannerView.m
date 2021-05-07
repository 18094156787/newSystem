//
//  JCPGCustomBannerView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPGCustomBannerView.h"

@implementation JCPGCustomBannerView


- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    
    if (self) {
        [self initViews];
    }
    
    return self;
}

- (void)initViews {
//    self.backgroundColor = JCBaseColor;
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(16));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(15));
    }];
    
    [self addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.timeLab);
    }];
    
    [self addSubview:self.backImgView];
    [self.backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(52));
    }];
    
    
    

    

    

    
    
    [self.backImgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(40));
        make.centerX.equalTo(self.backImgView);
        make.width.mas_equalTo(AUTO(50));
    }];
    
    [self.backImgView addSubview:self.homeLab];
    [self.homeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.infoLab.mas_left);
        make.centerY.equalTo(self.infoLab);
        make.height.mas_equalTo(AUTO(18));
    }];
    [self.backImgView addSubview:self.awayLab];
    [self.awayLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoLab.mas_right);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(18));
    }];
    
    [self.backImgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.homeLab.mas_left).offset(AUTO(-5));
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.backImgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.awayLab.mas_right).offset(5);
        make.centerY.equalTo(self.infoLab);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    

    
    
}



- (void)setModel:(JCWMatchBall *)model {
    _model = model;
    self.timeLab.text = [NSString stringWithFormat:@"%@ | %@",model.leagueName,model.kickoffTime];
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.homeLogo]];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.awayLogo]];
    self.homeLab.text = model.homeName;
    self.awayLab.text = model.awayName;
    self.countLab.text = [NSString stringWithFormat:@"%ld场方案",model.matchCount];

}

- (UIView *)backImgView {
    if (!_backImgView) {
        _backImgView = [UIView new];
        _backImgView.backgroundColor = COLOR_002868;
        [_backImgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    }
    return _backImgView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"VS" andFont:18 andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;
        _homeImgView.backgroundColor = JCWhiteColor;
        [_homeImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.backgroundColor = JCWhiteColor;
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
