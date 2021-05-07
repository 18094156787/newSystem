//
//  JNMatchZS_ZSDetailInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_ZSDetailInfoCell.h"

@implementation JNMatchZS_ZSDetailInfoCell

- (void)initViews {
//    · 射手榜 ·
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)setModel:(JNMatchZS_PLModel *)model {
    _model = model;
    self.titleLab.backgroundColor = model.is_select?JCWhiteColor:COLOR_F4F6F9;
//    self.titleLab.textColor = model.is_select?JCBaseColor:COLOR_333333;
    self.titleLab.text = model.company_name;
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:COLOR_F0F0F0 andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
