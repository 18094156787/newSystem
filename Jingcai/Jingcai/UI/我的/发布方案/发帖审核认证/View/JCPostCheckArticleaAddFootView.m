//
//  JCPostCheckArticleaAddFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckArticleaAddFootView.h"

@implementation JCPostCheckArticleaAddFootView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 1, 0));
    }];
    self.bgView = bgView;
    
    [bgView addSubview:self.postBtn];
    [self.postBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.right.offset(AUTO(-50));
        make.height.mas_equalTo(AUTO(44));
    }];
}


- (UIButton *)postBtn {
    if (!_postBtn) {
        _postBtn = [UIButton initWithText:@"去编辑" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCBaseColor];
        _postBtn.layer.borderColor = JCBaseColor.CGColor;
        _postBtn.layer.borderWidth = 1;
        _postBtn.layer.cornerRadius = AUTO(22);
        _postBtn.layer.masksToBounds = YES;
        
//        [_postBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, AUTO(10), 0, 0)];
//        [_postBtn setImage:JCIMAGE(@"button-increase") forState:0];
//        [_postBtn setImage:JCIMAGE(@"button-increase") forState:UIControlStateHighlighted];
    }
    return _postBtn;
}

@end
