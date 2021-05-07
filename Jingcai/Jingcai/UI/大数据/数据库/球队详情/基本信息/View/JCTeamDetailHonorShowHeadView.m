//
//  JCTeamDetailHonorShowHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailHonorShowHeadView.h"

@implementation JCTeamDetailHonorShowHeadView


- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self addSubview:self.topView];
    [self.topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_equalTo(0.5);
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIView *)topView {
    if (!_topView) {
        _topView = [UIView new];
        _topView.hidden = YES;
        _topView.backgroundColor = COLOR_DDDDDD;
    }
    return _topView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.hidden = YES;
        _bottomView.backgroundColor = COLOR_DDDDDD;
    }
    return _bottomView;
}

@end
    
