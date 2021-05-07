//
//  JCMyBindBankCardCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBindBankCardCell.h"

@implementation JCMyBindBankCardCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(70));
    }];
    
    
    [self.contentView addSubview:self.contentTF];
    [self.contentTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.contentView);
        make.height.mas_equalTo(AUTO(30));
    }];


}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UITextField *)contentTF {
    if (!_contentTF) {
        _contentTF = [UITextField new];
        _contentTF.textColor = COLOR_2F2F2F;
        _contentTF.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)];
        _contentTF.placeholder  = @"未填写";
    }
    return _contentTF;
}

@end
