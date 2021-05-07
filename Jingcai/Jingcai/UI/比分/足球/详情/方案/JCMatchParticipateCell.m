//
//  JCMatchParticipateView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/10/24.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCMatchParticipateCell.h"

@implementation JCMatchParticipateCell

- (void)initViews {
    self.contentView.backgroundColor = COLOR_F6F6F6;
    
    [self.contentView addSubview:self.topLineView];
    [self.topLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.bottom.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(AUTO(1));
    }];
    
    [self.contentView addSubview:self.bottomLineView];
    [self.bottomLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.bottom.offset(0);
        make.top.equalTo(self.contentView.mas_centerY);
        make.width.mas_equalTo(AUTO(1));
    }];
    
    [self.contentView addSubview:self.circleView];
    [self.circleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12.50f));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(5));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.circleView.mas_right).offset(AUTO(5));
    }];
    
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLab.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(45));
    }];
    
    [self.contentView addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(6));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(60));
    }];
    
    [self.bottomView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.offset(AUTO(10));
    }];
    
    [self.bottomView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(10));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(10));
    }];
    
    [self.bottomView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLab);
        make.right.offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(4), AUTO(8)));
    }];
    
    [self.contentView addSubview:self.zhongLab];
//    [self.zhongLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.nameLab);
//        make.left.equalTo(self.nameLab.mas_right).offset(AUTO(10));
//        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(13)));
//    }];
    
    [self.contentView addSubview:self.lianhongLab];
//    [self.lianhongLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.nameLab);
//        make.left.equalTo(self.zhongLab.mas_right).offset(AUTO(5));
//        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(13)));
//    }];
//
}

- (void)setModel:(JNMatchParticipateModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
    self.timeLab.text = model.time;
    self.nameLab.text = model.user_name;
    self.infoLab.text = model.content;
    
    CGSize zhongSize = [model.zhong sizeWithAttributes:@{NSFontAttributeName:self.zhongLab.font}];
    float zongWidth = zhongSize.width+14;
    
    CGSize hongSize = [model.lianhong sizeWithAttributes:@{NSFontAttributeName:self.lianhongLab.font}];
    float lianHongWidth = hongSize.width+14;
    if (model.zhong.length>0&&model.lianhong.length>0) {
            [self.zhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.nameLab.mas_right).offset(AUTO(10));
            make.size.mas_equalTo(CGSizeMake(zongWidth, AUTO(13)));
        }];
        
        [self.contentView addSubview:self.lianhongLab];
        [self.lianhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.zhongLab.mas_right).offset(AUTO(5));
            make.size.mas_equalTo(CGSizeMake(lianHongWidth, AUTO(13)));
        }];
    }
    if (model.zhong.length>0&&model.lianhong.length==0) {
            [self.zhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.nameLab.mas_right).offset(AUTO(10));
            make.size.mas_equalTo(CGSizeMake(zongWidth, AUTO(13)));
        }];
        
        [self.contentView addSubview:self.lianhongLab];
        [self.lianhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.zhongLab.mas_right).offset(AUTO(5));
            make.size.mas_equalTo(CGSizeMake(0, AUTO(13)));
        }];
    }
    if (model.zhong.length==0&&model.lianhong.length>0) {
            [self.zhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.nameLab.mas_right).offset(AUTO(10));
            make.size.mas_equalTo(CGSizeMake(0, AUTO(13)));
        }];
        
        [self.contentView addSubview:self.lianhongLab];
        [self.lianhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.zhongLab.mas_right).offset(AUTO(5));
            make.size.mas_equalTo(CGSizeMake(lianHongWidth, AUTO(13)));
        }];
    }
    if (model.zhong.length==0&&model.lianhong.length==0) {
            [self.zhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.nameLab.mas_right).offset(AUTO(10));
            make.size.mas_equalTo(CGSizeMake(0, AUTO(13)));
        }];
        
        [self.contentView addSubview:self.lianhongLab];
        [self.lianhongLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.nameLab);
            make.left.equalTo(self.zhongLab.mas_right).offset(AUTO(5));
            make.size.mas_equalTo(CGSizeMake(0, AUTO(13)));
        }];
    }

    self.lianhongLab.text = model.lianhong;
    self.zhongLab.text = model.zhong;
}

- (UIView *)topLineView {
    if (!_topLineView) {
        _topLineView = [UIView new];
        _topLineView.backgroundColor = COLOR_DDDDDD;
    }
    return _topLineView;
}

- (UIView *)bottomLineView {
    if (!_bottomLineView) {
        _bottomLineView = [UIView new];
        _bottomLineView.backgroundColor = COLOR_DDDDDD;
    }
    return _bottomLineView;
}

- (UIView *)circleView {
    if (!_circleView) {
        _circleView = [UIView new];
        _circleView.backgroundColor = COLOR_F72D27;
        [_circleView hg_setAllCornerWithCornerRadius:AUTO(2.5f)];
    }
    return _circleView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _timeLab.numberOfLines = 2;
    }
    return _timeLab;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.backgroundColor = JCWhiteColor;
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(22.50f)];
    }
    return _headImgView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = JCWhiteColor;
        [_bottomView hg_setCornerOnBottomAndTopRightWithRadius:AUTO(10)];
    }
    return _bottomView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)lianhongLab {
    if (!_lianhongLab) {
        _lianhongLab = [UILabel initWithTitle:@"" andFont:AUTO(9) andWeight:0 andTextColor:COLOR_F72D27 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _lianhongLab.layer.cornerRadius = AUTO(7.50f);
        _lianhongLab.layer.masksToBounds = YES;
        _lianhongLab.layer.borderWidth = 1;
        _lianhongLab.layer.borderColor = COLOR_F72D27.CGColor;
        
    }
    return _lianhongLab;
}

- (UILabel *)zhongLab {
    if (!_zhongLab) {
        _zhongLab = [UILabel initWithTitle:@"" andFont:AUTO(9) andWeight:0 andTextColor:COLOR_0091FF andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _zhongLab.layer.cornerRadius = AUTO(7.50f);
        _zhongLab.layer.masksToBounds = YES;
        _zhongLab.layer.borderWidth = 1;
        _zhongLab.layer.borderColor = COLOR_0091FF.CGColor;
    }
    return _zhongLab;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"common_arrow_right");
    }
    return _indicateImgView;
}

@end
