//
//  JCTeamMatchInfoTongJiItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoTongJiItemCell.h"

@implementation JCTeamMatchInfoTongJiItemCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    bgView.frame = CGRectMake(AUTO(10), 3, SCREEN_WIDTH/2.0f-AUTO(11), AUTO(64));

    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 5;
    bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.05].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,2);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 4;
    [self.contentView addSubview:bgView];
    
    
    
    
    [bgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(52, 18));
    }];
    
    [bgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.offset(8);
        make.width.height.mas_equalTo(40);
    }];
    
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.equalTo(self.headImgView.mas_right).offset(2);
    }];

    
    [self addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.equalTo(self.nameLab.mas_right).offset(2);
    }];
}

- (void)setModel:(JCTeamMatchTongjiModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    self.nameLab.text = model.name_zh;
    if ([model.team_type integerValue]==1) {
        self.iconImgView.image = JCIMAGE(@"matchTeam_icon_wmgj");
    }else{
        self.iconImgView.image = JCIMAGE(@"matchTeam_icon_dgzd");
    }
    
    self.numberLab.text = [NSString stringWithFormat:@"(%@)",model.most_titles_num];
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:20];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:14 andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}
- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:COLOR_A9A9A9 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _numberLab;
}

@end
