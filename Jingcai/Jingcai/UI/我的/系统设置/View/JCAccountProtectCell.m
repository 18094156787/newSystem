//
//  JCAccountProtectCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/2/3.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAccountProtectCell.h"

@implementation JCAccountProtectCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
        make.right.offset(AUTO(-100));
        make.bottom.offset(AUTO(-12));
    }];
    
    [self.contentView addSubview:self.settingBtn];
    [self.settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(30)));
    }];
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:JCBlackColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIButton *)settingBtn {
    if (!_settingBtn) {
        _settingBtn = [UIButton initWithText:@"去设置>" FontSize:AUTO(15) BackGroundColor:JCClearColor TextColor:COLOR_333333];
        _settingBtn.userInteractionEnabled = NO;
    }
    return _settingBtn;
}


@end
