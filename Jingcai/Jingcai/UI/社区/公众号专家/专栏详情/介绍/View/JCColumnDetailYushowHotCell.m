//
//  JCColumnDetailYushowHotCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailYushowHotCell.h"

@implementation JCColumnDetailYushowHotCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.layer.borderColor = UIColorFromRGB(0xEF8F2F).CGColor;
    bgView.layer.borderWidth = 1;
    bgView.layer.cornerRadius = 2;
    bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(60));
        make.bottom.offset(0);
    }];
    
    UIView *yushowView = [UIView new];
    yushowView.frame = CGRectMake(0, 0, AUTO(94), 24);
    [bgView addSubview:yushowView];
    CAGradientLayer *layer = [CAGradientLayer layer];
    layer.frame = CGRectMake(0, 0, AUTO(94), 24);
    layer.cornerRadius = 2;
    //渐变的颜色
    layer.colors = @[(__bridge id)UIColorFromRGB(0xFFBE7C).CGColor, (__bridge id)UIColorFromRGB(0xF7993C).CGColor, (__bridge id)UIColorFromRGB(0xEF8821).CGColor];
    //渐变点
    layer.locations = @[@0.0, @0.4, @1];
    //起点
    layer.startPoint = CGPointMake(0, 0);
    //终点
    layer.endPoint = CGPointMake(1, 0);
    //提供形状
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, layer.frame.size.width, 24)].CGPath;
    layer.mask = maskLayer;
    [yushowView.layer addSublayer:layer];
    
    [yushowView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.introduceLab];
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-8));
        make.top.equalTo(yushowView.mas_bottom).offset(AUTO(3));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [bgView addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self.introduceLab);
    }];
    
    WeakSelf;
    [self.introduceLab bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
}

- (void)setPresellColumnModel:(JCPresellColumnModel *)presellColumnModel {
    _presellColumnModel = presellColumnModel;
    self.titleLab.text = @"火爆预售中···";
    self.dateLab.text = [NSString stringWithFormat:@"第%@期",presellColumnModel.period];
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _dateLab;
}

- (UILabel *)introduceLab {
    if (!_introduceLab) {
        _introduceLab = [UILabel initWithTitle:@"周期说明" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:0];
        _introduceLab.userInteractionEnabled = YES;
    }
    return _introduceLab;
}

@end
