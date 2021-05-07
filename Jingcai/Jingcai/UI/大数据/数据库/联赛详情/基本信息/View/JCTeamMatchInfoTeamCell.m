//
//  JCTeamMatchInfoTeamCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoTeamCell.h"

@implementation JCTeamMatchInfoTeamCell

- (void)initViews {
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(28));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-5));
    }];
}

- (void)setModel:(JCDataBaseMatchModel *)model {
    _model = model;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    self.titleLab.text = model.name_zh;
}

- (void)setMatchModel:(JCTeamMatchTongjiModel *)matchModel {
    _matchModel = matchModel;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:matchModel.logo]];
    self.titleLab.text = matchModel.name_zh;
}


-(UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.layer.cornerRadius = AUTO(14);
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

@end
