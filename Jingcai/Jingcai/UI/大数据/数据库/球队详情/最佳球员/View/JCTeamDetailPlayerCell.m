//
//  JCTeamDetailPlayerCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailPlayerCell.h"

@implementation JCTeamDetailPlayerCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;

    [self.contentView addSubview:self.rankLab];
    [self.rankLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.left.offset(0);
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.offset(0);
        make.right.offset(AUTO(-15));
        make.width.mas_equalTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.teamImgView];
    [self.teamImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.rankLab.mas_right);
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(24));
    }];

    
    [self.contentView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.right.equalTo(self.countLab.mas_left);
        make.left.equalTo(self.teamImgView.mas_right).offset(AUTO(5));
    }];
    

}

- (void)setModel:(JCEventScorePlayerModel *)model {
    _model = model;
    [self.teamImgView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:JCIMAGE(@"userImg_default")];
    self.teamLab.text= model.name_zh;
    self.countLab.text = model.num;

}


- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _typeLab;
}

- (UILabel *)rankLab {
    if (!_rankLab) {
        _rankLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _rankLab;
}



- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _teamLab.numberOfLines= 2;
    }
    return _teamLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _countLab;
}

//- (UIImageView *)userImgView {
//    if (!_userImgView) {
//        _userImgView = [UIImageView new];
//        [_userImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
//    }
//    return _userImgView;
//}
//
//- (UILabel *)userLab {
//    if (!_userLab) {
//        _userLab = [UILabel initWithTitle:@"球员" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
//        _userLab.numberOfLines = 2;
//    }
//    return _userLab;
//}

- (UIImageView *)teamImgView {
    if (!_teamImgView) {
        _teamImgView = [UIImageView new];
        _teamImgView.contentMode = UIViewContentModeScaleAspectFill;
        [_teamImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _teamImgView;
}

@end
