//
//  JCKindCompleteUserCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCKindCompleteUserCell.h"

@implementation JCKindCompleteUserCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(44);
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(8);
        make.centerY.equalTo(self.contentView);
        make.right.offset(-100);
    }];
    
    [self.contentView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-16);
        make.centerY.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(52, 24));
    }];
}

- (void)setModel:(JCKindUserCompleteModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = model.user_name;
    self.statusLab.text = @"达成";
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:22];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:16 andWeight:1 andTextColor:UIColorFromRGB(0x252424) andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"达成" andFont:14 andWeight:1 andTextColor:COLOR_FB5835 andBackgroundColor:UIColorFromRGB(0xFFE6DE) andTextAlignment:NSTextAlignmentCenter];
        [_statusLab hg_setAllCornerWithCornerRadius:4];
    }
    return _statusLab;
}

@end
