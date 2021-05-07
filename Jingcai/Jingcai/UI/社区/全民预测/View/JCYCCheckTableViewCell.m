//
//  JCYCCheckTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCCheckTableViewCell.h"

@implementation JCYCCheckTableViewCell

- (void)initViews {
    UIView *redView = [UIView new];
    redView.backgroundColor = COLOR_EF2F2F;
    [self.contentView addSubview:redView];
    [redView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(AUTO(16));
        make.size.mas_equalTo(CGSizeMake(AUTO(3), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(redView);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
        make.left.equalTo(self.titleLab);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.infoLabel];
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.teamLab.mas_bottom).offset(AUTO(5));
        make.left.equalTo(self.titleLab);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLabel);
        make.left.equalTo(self.infoLabel.mas_right);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    self.titleLab.text = @"19/09/26 12:34";
    self.teamLab.text = @"中国 VS 美国";
    self.infoLab.text = @"主胜 2.86";
}

- (void)setModel:(JCYCResultModel *)model {
    _model = model;
    self.titleLab.text = model.title;
    self.teamLab.text = model.team;
    self.infoLab.text = model.result;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    }
    return _titleLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _teamLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    }
    return _teamLab;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [UILabel labelTitle:@"预测: " andFont:AUTO(10) andWeight:0 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(15)];
    }
    return _infoLabel;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(15)];
    }
    return _infoLab;
}

@end
