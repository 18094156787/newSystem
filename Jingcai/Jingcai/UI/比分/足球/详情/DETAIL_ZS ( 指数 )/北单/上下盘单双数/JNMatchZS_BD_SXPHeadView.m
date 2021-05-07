//
//  JNMatchZS_BD_SXPHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_BD_SXPHeadView.h"

@implementation JNMatchZS_BD_SXPHeadView

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    
    float width = AUTO(60);
    

    
    [bgView addSubview:self.xsLab];
    [self.xsLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.xdLab];
    [self.xdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.xsLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.ssLab];
    [self.ssLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.xdLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.sdLab];
    [self.sdLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.right.equalTo(self.ssLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.right.equalTo(self.sdLab.mas_left).offset(1);
    }];
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"发布时间" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _timeLab.layer.borderWidth = 1;
        _timeLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _timeLab;
}

- (UILabel *)sdLab {
    if (!_sdLab) {
        _sdLab = [UILabel initWithTitle:@"上单" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _sdLab.layer.borderWidth = 1;
        _sdLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _sdLab;
}

- (UILabel *)ssLab {
    if (!_ssLab) {
        _ssLab = [UILabel initWithTitle:@"上双" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _ssLab.layer.borderWidth = 1;
        _ssLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _ssLab;
}

- (UILabel *)xdLab {
    if (!_xdLab) {
        _xdLab = [UILabel initWithTitle:@"下单" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _xdLab.layer.borderWidth = 1;
        _xdLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _xdLab;
}


- (UILabel *)xsLab {
    if (!_xsLab) {
        _xsLab = [UILabel initWithTitle:@"下双" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _xsLab.layer.borderWidth = 1;
        _xsLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _xsLab;
}

@end
