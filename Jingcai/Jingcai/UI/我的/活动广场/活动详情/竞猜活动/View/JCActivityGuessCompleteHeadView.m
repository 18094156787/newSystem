//
//  JCActivityGuessCompleteHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessCompleteHeadView.h"

@implementation JCActivityGuessCompleteHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UIImageView *iconImgView = [UIImageView new];
    iconImgView.image = JCIMAGE(@"ic_success");
    [self addSubview:iconImgView];
    [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(32));
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(AUTO(72));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"选项提交成功" andFont:AUTO(18) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(iconImgView.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(25));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"中奖后奖励将自动发放到您的账户中" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(5));
        make.centerX.equalTo(self);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UILabel *sureLab = [UILabel initWithTitle:@"返回活动页面" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor andTextAlignment:NSTextAlignmentCenter];
    [sureLab hg_setAllCornerWithCornerRadius:AUTO(22)];
    [self addSubview:sureLab];
    sureLab.userInteractionEnabled = YES;
    [sureLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(AUTO(-32));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
    }];
    WeakSelf;
    [sureLab bk_whenTapped:^{
        [[weakSelf getViewController].navigationController popViewControllerAnimated:YES];
    }];
}
@end
