//
//  JCTeamDetailBaseInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailBaseInfoCell.h"

@implementation JCTeamDetailBaseInfoCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setModel:(JCTeamMatchBaseInfoModel *)model {
    _model = model;
    self.titleLab.text = model.name;
    self.contentLab.text = model.desc;
}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab  = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab  = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _contentLab;
}

@end
