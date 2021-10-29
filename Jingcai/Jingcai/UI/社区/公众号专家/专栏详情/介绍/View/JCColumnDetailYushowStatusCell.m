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
    bgView.layer.borderColor = JCBaseColor.CGColor;
    bgView.layer.borderWidth = 1;
    bgView.layer.cornerRadius = 2;
    bgView.layer.masksToBounds = YES;
    [self.contentView addSubview:bgView];
    self.bgView = bgView;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.right.offset(AUTO(-15));
        make.bottom.offset(AUTO(-8));
    }];
    
    UIView *topView = [UIView new];
    [bgView addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
//        make.height.mas_equalTo(AUTO(60));
        
    }];
    

    self.yushowView.frame = CGRectMake(0, 0, AUTO(94), 24);
    [topView addSubview:self.yushowView];
    self.gradientLayelayer.frame = CGRectMake(0, 0, AUTO(94), 24);
    //渐变的颜色
    self.gradientLayelayer.colors = @[(__bridge id)UIColorFromRGB(0xFFBE7C).CGColor, (__bridge id)UIColorFromRGB(0xF7993C).CGColor, (__bridge id)UIColorFromRGB(0xEF8821).CGColor];
    //渐变点
    self.gradientLayelayer.locations = @[@0.0, @0.4, @1];
    //起点
    self.gradientLayelayer.startPoint = CGPointMake(0, 0);
    //终点
    self.gradientLayelayer.endPoint = CGPointMake(1, 0);
    //提供形状
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.path = [UIBezierPath bezierPathWithRect:CGRectMake(0, 0, self.gradientLayelayer.frame.size.width, 24)].CGPath;
    self.gradientLayelayer.mask = maskLayer;
    [self.yushowView.layer addSublayer:self.gradientLayelayer];
    
    [self.yushowView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [topView addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.equalTo(self.yushowView.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.height.mas_greaterThanOrEqualTo(AUTO(20));
        make.bottom.offset(AUTO(-3));
    }];
    
    [topView addSubview:self.introduceLab];
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-8));
        make.top.equalTo(self.dateLab).offset(0);
        make.height.mas_greaterThanOrEqualTo(AUTO(20));
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
    self.botomView = botomView;
//    botomView.backgroundColor = [UIColor greenColor];
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
//        make.height.mas_equalTo(AUTO(20));
    }];
    
    [botomView addSubview:self.rateLab];
    [self.rateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-8));
//        make.height.mas_equalTo(AUTO(20));
    }];
    
    [botomView addSubview:self.scrollowView];
    [self.scrollowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(25));
        make.bottom.offset(AUTO(-8));
    }];
    
    WeakSelf;
    [self.introduceLab bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
}

- (void)setModel:(JCLastColumnModel *)model {
    if (!model) {
        return;
    }
//    model.type = @"1";
//    return;
    _model = model;
    
    self.rateLab.text = @"";
    if (model.combat.wl_list.count>0) {
        
        [self.scrollowView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(25));
        }];
        
        [self.botomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(75));
        }];
        
        
        [self.scrollowView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(25));
        }];
        self.infoLab.text = [NSString stringWithFormat:@"当前已推荐%@场 命中%@场",model.combat.match_num,model.combat.match_red];
        self.rateLab.text = [NSString stringWithFormat:@"命中率: %@%%",model.combat.rate];
        [self.scrollowView removeAllSubviews];
        for (int i=0; i<model.combat.wl_list.count; i++) {
            NSString *value = model.combat.wl_list[i];
            UIImageView *imgView = [UIImageView new];
            if ([value integerValue]==1||[value integerValue]==3) {
                imgView.image = JCIMAGE(@"ic_column_red");
            }else if ([value integerValue]==2||[value integerValue]==4) {
                imgView.image = JCIMAGE(@"ic_column_hei");
            }else if ([value integerValue]==5) {
                imgView.image = JCIMAGE(@"ic_column_zou");
            }
            
            imgView.frame = CGRectMake(AUTO(32)*i, 0, AUTO(24), AUTO(24));
            [self.scrollowView addSubview:imgView];
            
            self.scrollowView.contentSize = CGSizeMake(AUTO(32)*model.combat.wl_list.count, AUTO(24));

        }
    }else{
        self.infoLab.text = @"当前方案尚未更新，敬请期待~";
        if ([model.type integerValue]==1) {
            [self.botomView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(AUTO(44));
            }];
        }else{
            [self.botomView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.mas_equalTo(0);
            }];
        }
//
        [self.scrollowView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];


    }
    
    if ([model.type integerValue]==1) {
        self.titleLab.text = @"专栏更新中···";
        self.yushowView.frame = CGRectMake(0, 0, AUTO(94), 24);
        self.gradientLayelayer.frame = CGRectMake(0, 0, AUTO(94), 24);
        self.gradientLayelayer.colors = @[(__bridge id)UIColorFromRGB(0xFF7C7C).CGColor, (__bridge id)UIColorFromRGB(0xF73C3C).CGColor, (__bridge id)UIColorFromRGB(0xEF2121).CGColor];
        [self.yushowView.layer addSublayer:self.gradientLayelayer];
        self.dateLab.text = [NSString stringWithFormat:@"第%@期",model.period];
        self.introduceLab.text = @"周期说明";
        
        if (model.combat.wl_list.count==0) {
            self.infoLab.text = @"当前方案尚未更新，敬请期待~";
        }
       
        

        
    }else if([model.type integerValue]==2) {
        self.titleLab.text = @"已结束";
        self.yushowView.frame = CGRectMake(0, 0, AUTO(52), 24);
        self.gradientLayelayer.frame = CGRectMake(0, 0, AUTO(52), 24);
        self.gradientLayelayer.colors = @[(__bridge id)UIColorFromRGB(0xD2D5E4).CGColor, (__bridge id)UIColorFromRGB(0xC9CDE0).CGColor, (__bridge id)UIColorFromRGB(0xAEB4C8).CGColor];
        [self.yushowView.layer addSublayer:self.gradientLayelayer];
        self.dateLab.text = [NSString stringWithFormat:@"第%@期",model.period];
        self.introduceLab.text = @"周期说明";
    }else if([model.type integerValue]==3) {
        self.titleLab.text = @"专家过往战绩";
        self.yushowView.frame = CGRectMake(0, 0, AUTO(94), 24);
        self.gradientLayelayer.frame = CGRectMake(0, 0, AUTO(94), 24);
        self.gradientLayelayer.colors = @[(__bridge id)UIColorFromRGB(0x7C92FF).CGColor, (__bridge id)UIColorFromRGB(0x3C5BF7).CGColor, (__bridge id)UIColorFromRGB(0x2143EF).CGColor];
        [self.yushowView.layer addSublayer:self.gradientLayelayer];
        self.dateLab.text = [NSString stringWithFormat:@"专家过往推荐「%@-%@」的历史战绩",NonNil(model.combat.event_name),NonNil(model.combat.classfly)];
        self.introduceLab.text = @"";
    }
    
    if ([model.type integerValue]==3) {
        self.bgView.layer.borderColor = UIColorFromRGB(0x2043EF).CGColor;
        
    }else{
        self.bgView.layer.borderColor = JCBaseColor.CGColor;
    }
    [self.yushowView addSubview:self.titleLab];
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
        _dateLab.numberOfLines = 0;
    }
    return _dateLab;
}

- (UILabel *)introduceLab {
    if (!_introduceLab) {
        _introduceLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:0];
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

- (UIView *)yushowView {
    if (!_yushowView) {
        _yushowView = [UIView new];
    }
    return _yushowView;
}
- (CAGradientLayer *)gradientLayelayer {
    if (!_gradientLayelayer) {
        _gradientLayelayer = [CAGradientLayer layer];
        _gradientLayelayer.cornerRadius = 2;
    }
    return _gradientLayelayer;
}
@end
