//
//  JCMatchQBTitleHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMatchQBTitleHeadView.h"

@implementation JCMatchQBTitleHeadView

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, AUTO(8), 0, AUTO(8)));
    }];
    
    [bgView addSubview:self.colorView];
    [self.colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.colorView.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self);
    }];
    
    [self addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.offset(0);
        make.height.mas_equalTo(0.5);
    }];

}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab  = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIView *)colorView {
    if (!_colorView) {
        _colorView = [UIView new];
    }
    return _colorView;
}

-(UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_F0F0F0;
    }
    return _lineView;
}
@end
