//
//  JCActivityGuessMore_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/10.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessMore_HeadView.h"

@implementation JCActivityGuessMore_HeadView

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
//    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(8, 0, 0, 0));
    }];
    
    self.timeBgView = [UIImageView new];
    self.timeBgView.image = JCIMAGE(@"jc_activity_titleBg");
    [bgView addSubview:self.timeBgView];
    [self.timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(180, 16));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"我提交的选项" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.timeBgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
}

@end
