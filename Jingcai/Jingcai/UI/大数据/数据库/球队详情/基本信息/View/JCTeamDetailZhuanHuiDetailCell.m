    //
//  JCTeamDetailZhuanHuiDetailCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailZhuanHuiDetailCell.h"

@implementation JCTeamDetailZhuanHuiDetailCell

- (void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(AUTO(3));
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLab.mas_bottom).offset(2);
        make.left.equalTo(self.nameLab);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.nameLab);
        make.width.height.mas_equalTo(AUTO(20));
    }];
    
    [self.contentView addSubview:self.teamLab];
    [self.teamLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.iconImgView.mas_left).offset(AUTO(-8));
        make.centerY.equalTo(self.nameLab);
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.teamLab);
        make.centerY.equalTo(self.timeLab);
    }];
}

- (void)setModel:(JCTeamDetailZhuanHuiModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.player_logo] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = model.player_name;
    self.timeLab.text = model.transfer_time;
//    if (model.team.length==0) {
////        self.iconImgView.hidden = YES;
//        [self.teamLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.offset(AUTO(-15));
//        }];
//    }else{
////        self.iconImgView.hidden = NO;
//
//        [self.teamLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.right.offset(AUTO(-30));
//        }];
//    }
    self.teamLab.text = model.from_team_name.length==0?@"-":model.from_team_name;
    self.infoLab.text = model.transfer_type;

}


- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(20)];
        _headImgView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)teamLab {
    if (!_teamLab) {
        _teamLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _teamLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

@end
