//
//  JCColumnBuyHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnBuyHeadView.h"

#import "JCColumnDetailTitleHeadView.h"
@implementation JCColumnBuyHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(8), 0));
    }];
    
    
    JCColumnDetailTitleHeadView *headView = [JCColumnDetailTitleHeadView new];
    [self addSubview:headView];
    [headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.offset(0);
        make.height.mas_equalTo(AUTO(44));
    }];
    headView.titleLab.text = @"订单详情";
    
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(headView.mas_bottom);
        make.size.mas_equalTo(CGSizeMake(AUTO(110), AUTO(94)));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView);
        make.left.equalTo(self.imgView.mas_right).offset(AUTO(8));
        make.right.offset(AUTO(-10));
        make.height.mas_equalTo(AUTO(20));
    }];
    

    
    [self addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
        make.left.equalTo(self.titleLab);
        make.width.height.mas_equalTo(AUTO(24));
    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(4));
        make.right.offset(AUTO(-15));
    }];
    
    [self addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.bottom.equalTo(self.imgView.mas_bottom);
        make.right.offset(AUTO(-15));
    }];


    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.imgView.mas_bottom).offset(AUTO(13));
        make.right.offset(AUTO(-15));
    }];
}

- (void)setDetailModel:(JCColumnDetailModel *)detailModel {
    _detailModel = detailModel;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:detailModel.image]];
    self.titleLab.text = detailModel.title;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = detailModel.user_name;
    self.dateLab.text = [NSString stringWithFormat:@"第%@期",NonNil(detailModel.period)];
    
    self.timeLab.text = [NSString stringWithFormat:@"创建时间：%@",detailModel.time];
}




- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        [_imgView hg_setAllCornerWithCornerRadius:2];
    }
    return _imgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(12)];
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _dateLab.numberOfLines = 0;
    }
    return _dateLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

@end
