//
//  JCTeamMatchInfoTongJiCommomCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoTongJiCommomCell.h"

@implementation JCTeamMatchInfoTongJiCommomCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(AUTO(15));
    }];
    
    [self.contentView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-15));
    }];

}
- (void)setModel:(JCTeamMatchBaseInfoModel *)model {
    _model = model;
    self.titleLab.text = model.name;
    self.numberLab.text = model.count;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _numberLab;
}





@end
