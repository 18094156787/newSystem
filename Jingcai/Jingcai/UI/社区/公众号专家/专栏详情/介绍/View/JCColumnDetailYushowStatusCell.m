//
//  JCColumnDetailYushowStatusCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailYushowStatusCell.h"

@implementation JCColumnDetailYushowStatusCell

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
        make.bottom.offset(0);
    }];
    
    UIView *topView = [UIView new];
    [bgView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(AUTO(60));
    }];
    
    UIView *yushowView = [UIView new];
    yushowView.frame = CGRectMake(0, 0, AUTO(94), 24);
    [topView addSubview:yushowView];
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
    
    [topView addSubview:self.introduceLab];
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-8));
        make.top.equalTo(yushowView.mas_bottom).offset(AUTO(3));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [topView addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(self.introduceLab);
    }];
    
    UIView *lineView = [UIView new];
    [bgView addSubview:lineView];
    lineView.backgroundColor = COLOR_F0F0F0;
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.right.offset(-5);
        make.top.equalTo(topView.mas_bottom).offset(AUTO(3));
        make.height.mas_equalTo(0.5);
    }];
    
    UIView *botomView = [UIView new];
    [bgView addSubview:botomView];
    [botomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom);
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(75));
        make.bottom.offset(0);
    }];
    
    [botomView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [botomView addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [botomView addSubview:self.scrollowView];
    [self.scrollowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    WeakSelf;
    [self.introduceLab bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
}

- (void)data {
    self.titleLab.text = @"火爆预售中···";
    self.dateLab.text = @"第13期";
    self.infoLab.text = @"当前已推荐5场 命中3场";
    self.rateLab.text = @"命中率 60.25%";
    
    for (int i=0; i<20; i++) {
        UIImageView *imgView = [UIImageView new];
        imgView.image = JCIMAGE(@"ic_column_red");
        imgView.frame = CGRectMake(AUTO(32)*i, 0, AUTO(24), AUTO(24));
        [self.scrollowView addSubview:imgView];
        
        self.scrollowView.contentSize = CGSizeMake(AUTO(32)*20, AUTO(24));

        
    }
    
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

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)rateLab {
    if (!_rateLab) {
        _rateLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _rateLab;
}


- (UIScrollView *)scrollowView {
    if (!_scrollowView) {
        _scrollowView = [UIScrollView new];
        _scrollowView.showsHorizontalScrollIndicator = NO;
    }
    return _scrollowView;
}

@end
