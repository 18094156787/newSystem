//
//  JCAnimationLoadingView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAnimationLoadingView.h"

@implementation JCAnimationLoadingView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.7];
    UIImageView *loadImgView = [UIImageView new];
    loadImgView.image = JCIMAGE(@"animation_loading");
    [self addSubview:loadImgView];
    [loadImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(124), AUTO(124)));
    }];
}

@end
