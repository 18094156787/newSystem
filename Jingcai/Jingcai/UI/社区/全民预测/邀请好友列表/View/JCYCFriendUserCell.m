//
//  JCYCFriendUserCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCFriendUserCell.h"

@implementation JCYCFriendUserCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(90));
    }];
    
    [self.contentView addSubview:self.phoneLab];
    [self.phoneLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(85));
        make.left.equalTo(self.nameLab.mas_right).offset(AUTO(20));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(80));
    }];
    

}

- (void)setModel:(JCInviteCodeInfoModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
    self.nameLab.text = model.user_name;
    self.phoneLab.text = model.user_phone;
    self.timeLab.text = model.created_at;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _headImgView;;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _nameLab;
}

- (UILabel *)phoneLab {
    if (!_phoneLab) {
        _phoneLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _phoneLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _phoneLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _timeLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _timeLab.numberOfLines = 0;
    }
    return _timeLab;
}

@end
