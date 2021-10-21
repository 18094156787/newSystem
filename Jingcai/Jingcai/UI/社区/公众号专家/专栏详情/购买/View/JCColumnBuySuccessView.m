//
//  JCColumnBuySuccessView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnBuySuccessView.h"

@implementation JCColumnBuySuccessView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(315), AUTO(225)));
    }];
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"ic_ column_right");
    [bgView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(32));
        make.centerX.equalTo(bgView);
        make.width.height.mas_equalTo(AUTO(88));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"恭喜你，购买专栏服务成功！" andFont:AUTO(18) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(24));
    }];
    
}

@end
