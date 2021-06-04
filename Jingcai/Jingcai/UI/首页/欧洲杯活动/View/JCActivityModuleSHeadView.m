//
//  JCActivityModuleSHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityModuleSHeadView.h"

@implementation JCActivityModuleSHeadView

- (void)initViews {
    self.backgroundColor = COLOR_006DAB;
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"euro_img_banner");
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(kNavigationBarHeight, 0, 0, 0));
    }];
    self.imgView = imgView;
}

@end
