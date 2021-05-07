//
//  JCPostCheckArticleFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckArticleFootView.h"

@implementation JCPostCheckArticleFootView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    UILabel *titleLab = [UILabel initWithTitle:@"审核须知" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(15));
    }];
    
    UILabel *contentLab = [UILabel initWithTitle:@"请上方填写您的真实的个人信息，信息出错或者不一致，会导致您审核失败。上述信息仅用于开通作者权限，平台尊重并保护用户的隐私信息" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    contentLab.numberOfLines = 0;
    [self addSubview:contentLab];
    [contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(titleLab.mas_bottom);
    }];
}

@end
