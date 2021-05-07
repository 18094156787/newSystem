//
//  JNMatchZS_BD_SPFFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchZS_BD_SPFFootView.h"

@implementation JNMatchZS_BD_SPFFootView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(10), 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.centerX.equalTo(bgView);
    }];
    
    [bgView addSubview:self.updownImgView];
    [self.updownImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.titleLab);
        make.right.equalTo(self.titleLab.mas_left).offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(AUTO(10), AUTO(6)));
    }];
}

- (void)setIsShowAll:(BOOL)isShowAll {
    _isShowAll = isShowAll;
    self.updownImgView.image = isShowAll?JCIMAGE(@"narrow_icon"):JCIMAGE(@"expand_icon");
    self.titleLab.text = isShowAll?@"收起":@"查看更多";
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"加载更多" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

- (UIImageView *)updownImgView {
    if (!_updownImgView) {//
        _updownImgView = [UIImageView new];
        _updownImgView.image = JCIMAGE(@"expand_icon");
    }
    return _updownImgView;
}

@end
