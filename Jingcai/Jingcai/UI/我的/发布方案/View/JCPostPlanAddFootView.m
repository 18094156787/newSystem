//
//  JCPostPlanAddFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostPlanAddFootView.h"

@implementation JCPostPlanAddFootView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.postBtn];
    [self.postBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(40));
    }];
}


- (UIButton *)postBtn {
    if (!_postBtn) {
        _postBtn = [UIButton initWithText:@"添加比赛" FontSize:AUTO(14) BackGroundColor:JCClearColor     TextColors:COLOR_999999];
        [_postBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, AUTO(10), 0, 0)];
        [_postBtn setImage:JCIMAGE(@"button-increase") forState:0];
        [_postBtn setImage:JCIMAGE(@"button-increase") forState:UIControlStateHighlighted];
        _postBtn.layer.borderColor = COLOR_F0F0F0.CGColor;
        _postBtn.layer.borderWidth = 1;
        _postBtn.layer.cornerRadius = 5;
        _postBtn.layer.masksToBounds = YES;
    }
    return _postBtn;
}


@end
