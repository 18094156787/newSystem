//
//  JCYCHomeFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHomeFootView.h"

@implementation JCYCHomeFootView

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(20);
        make.top.offset(15);
        make.height.mas_equalTo(15);
    }];
    
    [self addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(10);
        make.height.mas_equalTo(15);
    }];
    
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.teamLab.mas_bottom).offset(5);
        make.height.mas_equalTo(15);
    }];

    
    [self addSubview:self.submitBtn];
    [self.submitBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(SCREEN_WIDTH-125);
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(110, 40));
    }];
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"已选择预测结果" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:14];
    }
    return _titleLab;;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
        _teamLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
    }
    return _teamLab;;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:12];
    }
    return _infoLab;;
}

- (UIButton *)submitBtn {
    if (!_submitBtn) {
        _submitBtn = [UIButton initWithText:@"提交预测" FontSize:0 BackGroundColor:COLOR_DADADA TextColors:JCWhiteColor];
        _submitBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:16];
        [_submitBtn hg_setAllCornerWithCornerRadius:28];
        _submitBtn.userInteractionEnabled = NO;
    }
    return _submitBtn;;
}

@end
