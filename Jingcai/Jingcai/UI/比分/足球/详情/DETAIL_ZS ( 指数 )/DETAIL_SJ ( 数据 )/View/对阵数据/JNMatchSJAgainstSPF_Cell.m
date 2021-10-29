//
//  JNMatchSJAgainstSPF_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstSPF_Cell.h"

@implementation JNMatchSJAgainstSPF_Cell

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(28));
    }];

    
    [self addSubview:self.eqalLab];
    [self.eqalLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(25));
        make.width.mas_equalTo(SCREEN_WIDTH/3.0f);
    }];
    
    [self addSubview:self.eqalInfoLab];
    [self.eqalInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.eqalLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.eqalLab);
        make.height.mas_equalTo(AUTO(18));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.eqalLab.mas_left);
        make.top.equalTo(self.eqalLab).offset(-5);
        make.bottom.equalTo(self.eqalInfoLab).offset(5);
        make.width.mas_equalTo(0.5);
    }];
    
    UIView *lineView1 = [UIView new];
    lineView1.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView1];
    [lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.eqalLab.mas_right);
        make.top.equalTo(self.eqalLab).offset(-5);
        make.bottom.equalTo(self.eqalInfoLab).offset(5);
        make.width.mas_equalTo(0.5);
    }];
    
    [self addSubview:self.winLab];
    [self.winLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.eqalLab);
     make.right.equalTo(self.eqalLab.mas_left).offset(-1);
     make.height.mas_equalTo(AUTO(25));
     make.width.mas_equalTo(SCREEN_WIDTH/3.0f);
    }];

    [self addSubview:self.winInfoLab];
    [self.winInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.winLab.mas_bottom).offset(AUTO(10));
     make.centerX.equalTo(self.winLab);
     make.height.mas_equalTo(AUTO(18));
    }];
    
    
    [self addSubview:self.loseLab];
    [self.loseLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.eqalLab);
        make.left.equalTo(self.eqalLab.mas_right).offset(1);
        make.height.mas_equalTo(AUTO(25));
        make.width.mas_equalTo(SCREEN_WIDTH/3.0f);
    }];
    
    [self addSubview:self.loseInfoLab];
    [self.loseInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.loseLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.loseLab);
        make.height.mas_equalTo(AUTO(18));
    }];

}

- (void)setModel:(JCBigDataMonthProduceModel *)model {
    _model = model;
    self.titleLab.text = @"  胜平负概率分布";
    self.winLab.text = [NSString stringWithFormat:@"%.0f%%",[model.ai_op_win floatValue]*100];
    self.eqalLab.text = [NSString stringWithFormat:@"%.0f%%",[model.ai_op_draw floatValue]*100];
    self.loseLab.text = [NSString stringWithFormat:@"%.0f%%",[model.ai_op_lose floatValue]*100];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:[COLOR_002868 colorWithAlphaComponent:0.06] andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)winLab {
    if (!_winLab) {
        _winLab = [UILabel initWithTitle:@"" andFont:AUTO(28) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _winLab;
}

- (UILabel *)eqalLab {
    if (!_eqalLab) {
        _eqalLab = [UILabel initWithTitle:@"" andFont:AUTO(28) andWeight:3 andTextColor:COLOR_30B27A andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _eqalLab;
}

- (UILabel *)loseLab {
    if (!_loseLab) {
        _loseLab = [UILabel initWithTitle:@"" andFont:AUTO(28) andWeight:3 andTextColor:COLOR_002868 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseLab;
}

- (UILabel *)winInfoLab {
    if (!_winInfoLab) {
        _winInfoLab = [UILabel initWithTitle:@"主胜" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _winInfoLab;
}

- (UILabel *)eqalInfoLab {
    if (!_eqalInfoLab) {
        _eqalInfoLab = [UILabel initWithTitle:@"平" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _eqalInfoLab;
}

- (UILabel *)loseInfoLab {
    if (!_loseInfoLab) {
        _loseInfoLab = [UILabel initWithTitle:@"客胜" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _loseInfoLab;
}
- (UIImageView *)leftLineImgView {
    if (!_leftLineImgView) {
        _leftLineImgView = [UIImageView new];
        _leftLineImgView.image = JCIMAGE(@"match_dec_left");
    }
    return _leftLineImgView;
}
- (UIImageView *)rightLineImgView {
    if (!_rightLineImgView) {
        _rightLineImgView = [UIImageView new];
        _rightLineImgView.image = JCIMAGE(@"match_dec_right");
    }
    return _rightLineImgView;
}

@end
