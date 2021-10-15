//
//  JCColumnDetailTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailTopView.h"

@implementation JCColumnDetailTopView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(110), AUTO(94)));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView);
        make.left.equalTo(self.imgView.mas_right).offset(AUTO(8));
        make.right.offset(AUTO(-10));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(4));
        make.right.offset(AUTO(-10));
    }];
    
    [self addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imgView);
        make.left.equalTo(self.titleLab);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(4));
        make.width.mas_lessThanOrEqualTo(AUTO(100));
    }];
    

    [self addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgView);
        make.left.equalTo(self.nameLab.mas_right).offset(AUTO(4));
        make.right.offset(AUTO(-15));
    }];

}

- (void)data {
    self.imgView.backgroundColor = JCBaseColor;
    self.titleLab.text = @"英超精选方案推荐英超精选方案推荐";
    self.contentLab.text = @"专栏第3期";
    self.headImgView.backgroundColor = JCBaseColor;
    self.nameLab.text = @"老詹带你飞";
    
    NSString *price = [NSString stringWithFormat:@"实付：%@红币",@"688"];
    NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
    NSRange range = [price rangeOfString:@"实付："];
    [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)],NSForegroundColorAttributeName:COLOR_2F2F2F} range:range];
    self.priceLab.attributedText = attr;
    
    
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        [_imgView hg_setAllCornerWithCornerRadius:2];
    }
    return _imgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _contentLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

@end
