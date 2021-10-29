//
//  JCDakaColumnAssociatedView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDakaColumnAssociatedView.h"

@implementation JCDakaColumnAssociatedView

- (void)initViews {
//    self.backgroundColor = JCWhiteColor;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    self.bgView = bgView;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(20), AUTO(15), 0, AUTO(15)));
    }];
    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 3;
    bgView.layer.shadowColor = [UIColor colorWithRed:4/255.0 green:57/255.0 blue:101/255.0 alpha:0.12].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,0);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 20;
    
    [bgView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.centerY.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(110), AUTO(94)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.imgView);
        make.left.equalTo(self.imgView.mas_right).offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    
    [bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(4));
        make.right.offset(AUTO(-8));
    }];
    

  

    [self addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.imgView);
        make.left.equalTo(self.titleLab);
        make.right.offset(AUTO(-15));
    }];

}

- (void)setModel:(JCColumnInfoModel *)model {
    _model = model;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.image]];
    self.titleLab.text = model.title;
    self.contentLab.text = model.synopsis;
    self.dateLab.text = [NSString stringWithFormat:@"第%@期",NonNil(model.period)];
}



- (void)setHaveBottomDistance:(BOOL)haveBottomDistance {
    _haveBottomDistance = haveBottomDistance;
    if (haveBottomDistance) {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(AUTO(20), AUTO(15), AUTO(15), AUTO(15)));
        }];
    }else{
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.edges.insets(UIEdgeInsetsMake(AUTO(20), AUTO(15), 0, AUTO(15)));
        }];
    }
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

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 2;
    }
    return _contentLab;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _dateLab;
}


@end
