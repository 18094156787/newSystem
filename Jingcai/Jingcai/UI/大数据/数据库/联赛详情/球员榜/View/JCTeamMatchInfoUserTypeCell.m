//
//  JCTeamMatchInfoUserTypeCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoUserTypeCell.h"

@implementation JCTeamMatchInfoUserTypeCell

- (void)initViews {
//    · 射手榜 ·
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)setModel:(JCEventScorePlayerInfoModel *)model {
    _model = model;
    self.titleLab.backgroundColor = model.is_select?JCWhiteColor:COLOR_F4F6F9;
    self.titleLab.font = model.is_select?[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(13)]:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(13)];
    self.titleLab.text = model.name;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
