//
//  JCColumnDetailTitleHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/19.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailTitleHeadView.h"

@implementation JCColumnDetailTitleHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(4), AUTO(16)));
    }];
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(4));
        make.centerY.equalTo(self);
        make.right.offset(AUTO(-15));
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.bottom.offset(0);
        make.right.offset(0);
        make.height.mas_equalTo(1);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_F0F0F0;
        _lineView.hidden = YES;
    }
    return _lineView;
}

@end
