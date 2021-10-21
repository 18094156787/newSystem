//
//  JCColumnDetailIntroduceCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailIntroduceCollectionCell.h"

@implementation JCColumnDetailIntroduceCollectionCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [UIColorFromRGB(0xFF9427) colorWithAlphaComponent:0.16];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.titileLab];
    [self.titileLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-65));
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.right.offset(AUTO(-15));
    }];
    
    [self data];
}

- (void)data {
    self.titileLab.text = [NSString stringWithFormat:@"%@ %@",@"用户昵称****",@"已成功订阅第13期专栏"];
    self.timeLab.text = @"刚刚";
}

- (UILabel *)titileLab {
    if (!_titileLab) {
        _titileLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titileLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

@end
