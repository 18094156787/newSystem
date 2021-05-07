//
//  JNMatchZS_JC_RqSPFInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/8.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_JC_RqSPFInfoCell.h"

@implementation JNMatchZS_JC_RqSPFInfoCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.bottom.offset(0);
    }];
    

    
    float width = (SCREEN_WIDTH-AUTO(100)-AUTO(20))/4.0f;
    
    [bgView addSubview:self.rloseLab];
    [self.rloseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.reqalLab];
    [self.reqalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.rloseLab.mas_left).offset(1);
        make.width.mas_equalTo(AUTO(45));
    }];
    
    [bgView addSubview:self.rwindLab];
    [self.rwindLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.reqalLab.mas_left).offset(1);
        make.width.mas_equalTo(AUTO(45));
    }];
    
    [bgView addSubview:self.rballLab];
    [self.rballLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.rwindLab.mas_left).offset(1);
        make.width.mas_equalTo(AUTO(45));
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(bgView);
        make.top.offset(-1);
        make.right.equalTo(self.rballLab.mas_left).offset(1);
    }];
}

- (void)setModel:(JNMatchSPFBall *)model {
    _model = model;
    self.timeLab.text = model.created_desc;
    self.rwindLab.text = model.sf3;
    self.reqalLab.text = model.sf1;
    self.rloseLab.text = model.sf0;
    self.rballLab.text = model.goal;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _timeLab.layer.borderWidth = 1;
        _timeLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _timeLab;
}

- (UILabel *)rballLab {
    if (!_rballLab) {
        _rballLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _rballLab.layer.borderWidth = 1;
        _rballLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _rballLab;
}

- (UILabel *)rwindLab {
    if (!_rwindLab) {
        _rwindLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _rwindLab.layer.borderWidth = 1;
        _rwindLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _rwindLab;
}

- (UILabel *)reqalLab {
    if (!_reqalLab) {
        _reqalLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _reqalLab.layer.borderWidth = 1;
        _reqalLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _reqalLab;
}


- (UILabel *)rloseLab {
    if (!_rloseLab) {
        _rloseLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _rloseLab.layer.borderWidth = 1;
        _rloseLab.layer.borderColor = COLOR_DBDBDB.CGColor;
    }
    return _rloseLab;
}

@end
