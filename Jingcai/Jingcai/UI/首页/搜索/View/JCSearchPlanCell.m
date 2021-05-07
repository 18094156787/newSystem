//
//  JCSearchPlanCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCSearchPlanCell.h"

@implementation JCSearchPlanCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.width.height.mas_equalTo(AUTO(24));
        make.bottom.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.headImgView);
        
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.headImgView);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.contentView);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(0.5);
    }];
}


- (void)setModel:(JCDianPingBall *)model {
    _model = model;
   
    
    if (model.out_info.length>0) {
         NSString *title = [NSString stringWithFormat:@"%@%@",model.out_info,model.title];
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:model.out_info];
        [attrTitle addAttribute:NSForegroundColorAttributeName value:COLOR_E7221D range:range];
        self.titleLab.attributedText = attrTitle;
    }else{
        self.titleLab.text = model.title;
    }
//    self.titleLab.text = model.title;

    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
    self.nameLab.text = model.user_name;
    self.timeLab.text = [NSString stringWithFormat:@"截止时间: %@",model.time];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 3;
    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:2 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _timeLab.numberOfLines = 3;
    }
    return _timeLab;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}


@end
