//
//  JCLoginWMHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCLoginWMHeadView.h"

@implementation JCLoginWMHeadView

- (void)initViews {
    self.backgroundColor = COLOR_A32020;
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"signin_logo");
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

@end
