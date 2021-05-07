//
//  JNMatchDetailZRTeamHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchDetailZRTeamHeadView.h"

@implementation JNMatchDetailZRTeamHeadView

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_F0F0F0;
    bgView.layer.borderColor = COLOR_DBDBDB.CGColor;
    bgView.layer.borderWidth = 0.5;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, AUTO(8), 0, AUTO(8)));
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _titleLab.layer.borderColor = COLOR_DBDBDB.CGColor;
//        _titleLab.layer.borderWidth = 0.5;
    }
    return _titleLab;
}

@end
