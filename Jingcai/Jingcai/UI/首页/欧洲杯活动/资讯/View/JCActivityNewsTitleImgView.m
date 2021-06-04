//
//  JCActivityNewsTitleImgView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityNewsTitleImgView.h"

@implementation JCActivityNewsTitleImgView

- (void)initViews {
    UIImageView *imgView= [UIImageView new];
    imgView.image = JCIMAGE(@"euro_ic_title");
    [self addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(202, 16));
    }];
}

@end
