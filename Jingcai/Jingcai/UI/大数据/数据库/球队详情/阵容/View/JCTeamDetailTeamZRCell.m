//
//  JCTeamDetailTeamZRCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailTeamZRCell.h"

@implementation JCTeamDetailTeamZRCell

-(void)initViews {
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(7));
        make.centerY.equalTo(self.contentView);
        make.width.mas_lessThanOrEqualTo(AUTO(30));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.numberLab.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.contentView);
//        make.right.offset(AUTO(-80));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.contentView);
    }];
}

- (void)setModel:(JCTeamDetailZhenRongModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:JCIMAGE(@"userImg_default")];
//    model.number = @"4444";
    self.numberLab.text = NonNil(model.shirt_number);
//    self.numberLab.text = @"111";
    self.nameLab.text = model.player_name_zh;
    self.infoLab.text = model.player_market_value;
    
    if (model.shirt_number.length==0) {
//        [self.nameLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
//        }];
//        
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
            make.centerY.equalTo(self.contentView);
        }];
    }else{
//        [self.nameLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.numberLab.mas_right).offset(AUTO(7));
//        }];
        
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.numberLab.mas_right).offset(AUTO(7));
            make.centerY.equalTo(self.contentView);
        }];
    }
}



- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.contentMode = UIViewContentModeScaleAspectFill;
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(14)];
    }
    return _headImgView;
}

- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _numberLab;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_FE644D andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

@end
