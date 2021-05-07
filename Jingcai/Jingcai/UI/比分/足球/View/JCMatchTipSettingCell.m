//
//  JCMatchTipSettingCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchTipSettingCell.h"

@implementation JCMatchTipSettingCell

- (void)initViews {
    self.contentView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.switchBtn];
    [self.switchBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(35)));
    }];
    
}

- (void)setIs_on:(NSString *)is_on {
    _is_on = is_on;
    if ([is_on intValue]==1) {
        [_switchBtn setOn:YES];
    }else{
        [_switchBtn setOn:NO];
    }
}

- (void)switchBtnClick:(UISwitch *)sender {
    NSString *is_on = @"0";
    if (sender.isOn) {
        is_on = @"1";
    }
    if (self.JCSettingBlock) {
        self.JCSettingBlock(self.type,is_on);
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _titleLab;
}

- (UISwitch *)switchBtn {
    if (!_switchBtn) {
        _switchBtn = [UISwitch new];
        [_switchBtn addTarget:self action:@selector(switchBtnClick:) forControlEvents:UIControlEventValueChanged];
        [_switchBtn setOn:YES];
        _switchBtn.onTintColor = JCBaseColor;
    }
    return _switchBtn;
}

@end
