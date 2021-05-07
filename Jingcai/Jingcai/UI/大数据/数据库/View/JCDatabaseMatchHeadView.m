//
//  JCDatabaseMatchHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDatabaseMatchHeadView.h"

@implementation JCDatabaseMatchHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(AUTO(32));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self);
        make.right.offset(AUTO(-5));
    }];
    
    [self addSubview:self.upDownBtn];
    [self.upDownBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(1);
    }];
}

- (void)setModel:(JCDataBaseAreaCountryModel *)model {
    _model = model;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.country_logo]];
    self.titleLab.text = model.name_zh;
    self.upDownBtn.selected = model.is_show;
}


-(UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.layer.borderColor = COLOR_DDDDDD.CGColor;
        _iconImgView.layer.borderWidth = 0.5;
        _iconImgView.layer.cornerRadius = AUTO(16);
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIButton *)upDownBtn {
    if (!_upDownBtn) {
        _upDownBtn = [UIButton new];
        _upDownBtn.userInteractionEnabled = NO;
        [_upDownBtn setImage:JCIMAGE(@"database_icon_down") forState:0];
        [_upDownBtn setImage:JCIMAGE(@"database_icon_up") forState:UIControlStateSelected];
    }
    return _upDownBtn;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor= COLOR_F4F6F9;
    }
    return _lineView;
}

@end
