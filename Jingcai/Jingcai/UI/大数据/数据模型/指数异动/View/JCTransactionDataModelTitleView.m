//
//  JCTransactionDataModelTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCTransactionDataModelTitleView.h"

@implementation JCTransactionDataModelTitleView

- (void)initViews {
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(28));
        make.centerY.equalTo(iconView);
    }];
    
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-16));
        make.centerY.equalTo(iconView);
    }];
    
    [self addSubview:self.detailView];
    [self.detailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.top.bottom.offset(0);
        make.width.mas_equalTo(AUTO(80));
    }];
    
    UIImageView *indicateImgView = [UIImageView new];
    indicateImgView.image = JCIMAGE(@"ic_data_right");
    [self.detailView addSubview:indicateImgView];
    [indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.detailView);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    UILabel *detailLab = [UILabel initWithTitle:@"详细数据" andFont:AUTO(13) andWeight:1 andTextColor:UIColorFromRGB(0x0085C7) andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.detailView addSubview:detailLab];
    [detailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(indicateImgView.mas_left).offset(AUTO(-3));
        make.centerY.equalTo(self.detailView);
    }];
    
    WeakSelf;
    [self.detailView bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
    
    
}
- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UIView *)detailView {
    if (!_detailView) {
        _detailView = [UIView new];
    }
    return _detailView;
}
@end
