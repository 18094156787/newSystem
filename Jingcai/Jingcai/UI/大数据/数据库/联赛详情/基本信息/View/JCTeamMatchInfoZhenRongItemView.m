//
//  JCTeamMatchInfoZhenRongItemView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoZhenRongItemView.h"

@implementation JCTeamMatchInfoZhenRongItemView

- (void)initViews {
    [self addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(36);
    }];
    
    [self addSubview:self.numberBgView];
    [self.numberBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.headImgView.mas_bottom).offset(-10);
        make.size.mas_equalTo(CGSizeMake(32, 12));
    }];
    
    [self.numberBgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-2);
        make.centerY.equalTo(self.numberBgView);
        make.width.height.mas_equalTo(8);
    }];
    
    [self.numberBgView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.equalTo(self.iconImgView.mas_left);
        make.centerY.equalTo(self.numberBgView);
    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.numberBgView.mas_bottom).offset(2);
        make.width.mas_equalTo(AUTO(60));
    }];
    
}

- (void)setModel:(JCTeamMatchPlayerModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    self.numberBgView.backgroundColor = JCBaseColor;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.team_logo]];
    self.numberLab.text = [NSString stringWithFormat:@"%.1f",[model.rating floatValue]/100.0f];
    self.nameLab.text = model.short_name_zh.length>0?model.short_name_zh:model.name_zh;
    if ([model.rating floatValue]>=900) {
        self.numberBgView.backgroundColor = COLOR_FF4642;
        self.headImgView.layer.borderColor = COLOR_FF4642.CGColor;
    }else if ([model.rating floatValue]>=800&&[model.rating floatValue]<900) {
        self.numberBgView.backgroundColor = COLOR_FF8242;
        self.headImgView.layer.borderColor = COLOR_FF8242.CGColor;
    }else{
        self.numberBgView.backgroundColor = COLOR_FFBA42;
        self.headImgView.layer.borderColor = COLOR_FFBA42.CGColor;
    }
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.layer.borderWidth= 1;
        _headImgView.layer.cornerRadius = AUTO(18);
        _headImgView.layer.masksToBounds = YES;
//        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(18)];
    }
    return _headImgView;
}

- (UIView *)numberBgView {
    if (!_numberBgView) {
        _numberBgView = [UIView new];
        [_numberBgView hg_setAllCornerWithCornerRadius:AUTO(6)];
    }
    return _numberBgView;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:10 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _numberLab;
}


- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        [_iconImgView hg_setAllCornerWithCornerRadius:4];
    }
    return _iconImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:10 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _nameLab;
}


@end
