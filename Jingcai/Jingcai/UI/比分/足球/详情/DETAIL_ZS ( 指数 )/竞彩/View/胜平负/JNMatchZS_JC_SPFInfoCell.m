//
//  JNMatchZS_JCInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_JC_SPFInfoCell.h"

@implementation JNMatchZS_JC_SPFInfoCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    

    
    float width = (SCREEN_WIDTH-AUTO(140)-AUTO(20))/3.0f;
    
    [bgView addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.eqalLab];
    [self.eqalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.loseLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.windLab];
    [self.windLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.eqalLab.mas_left).offset(1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.windLab.mas_left).offset(1);
    }];
}

- (void)setModel:(JNMatchSPFBall *)model {
    _model = model;
    self.timeLab.text = model.created_desc;
    self.windLab.text = model.sf3;
    self.eqalLab.text = model.sf1;
    self.loseLab.text = model.sf0;
}


- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _timeLab.layer.borderWidth = 1;
        _timeLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _timeLab;
}

- (UILabel *)windLab {
    if (!_windLab) {
        _windLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _windLab.layer.borderWidth = 1;
        _windLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _windLab;
}

- (UILabel *)eqalLab {
    if (!_eqalLab) {
        _eqalLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _eqalLab.layer.borderWidth = 1;
        _eqalLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _eqalLab;
}


- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _loseLab.layer.borderWidth = 1;
        _loseLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _loseLab;
}

@end
