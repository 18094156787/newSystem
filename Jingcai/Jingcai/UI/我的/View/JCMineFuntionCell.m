//
//  JCMineFuntionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMineFuntionCell.h"

@implementation JCMineFuntionCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.userInteractionEnabled = YES;
//    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(96*2));
        make.bottom.offset(0);
    }];
    
    float width = (SCREEN_WIDTH-AUTO(16))/4.0f;
    [bgView addSubview:self.inviteView];
    [self.inviteView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(bgView);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(96));
    }];
    
    [bgView addSubview:self.buyRecordView];
    [self.buyRecordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.left.equalTo(self.inviteView.mas_right);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(96));
    }];
    
    [bgView addSubview:self.accountView];
    [self.accountView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView);
        make.left.equalTo(self.buyRecordView.mas_right);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(96));
    }];
    
    [bgView addSubview:self.settingView];
    [self.settingView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.equalTo(bgView);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(96));
    }];
    
    [bgView addSubview:self.kefuView];
    [self.kefuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(bgView);
        make.top.equalTo(self.inviteView.mas_bottom);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(96));
    }];
    
    [bgView addSubview:self.questionView];
    [self.questionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.kefuView);
        make.left.equalTo(self.kefuView.mas_right);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(96));
    }];
    
    [bgView addSubview:self.aboutView];
    [self.aboutView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.kefuView);
        make.left.equalTo(self.questionView.mas_right);
        make.width.mas_equalTo(width);
        make.height.mas_equalTo(AUTO(96));
    }];
    
//    [bgView addSubview:self.questionView];
//    [self.questionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.kefuView);
//        make.left.equalTo(self.aboutView.mas_right);
//        make.width.mas_equalTo(width);
//        make.height.mas_equalTo(AUTO(96));
//    }];
    WeakSelf;
    [self.inviteView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(300);
        }
    }];
    
    [self. buyRecordView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(301);
        }
    }];
    
    [self.accountView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(302);
        }
    }];
    
    [self.settingView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(303);
        }
    }];
    
    [self.kefuView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(304);
        }
    }];
    
    [self.aboutView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(305);
        }
    }];
    
    [self.questionView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(306);
        }
    }];
    
}

- (JCMineCellFunctionView *)inviteView {
    if (!_inviteView) {
        _inviteView = [JCMineCellFunctionView new];
        _inviteView.iconImg = JCIMAGE(@"me_ic_invite");
        _inviteView.title = @"邀请好友";
    }
    return _inviteView;
}

- (JCMineCellFunctionView *)buyRecordView {
    if (!_buyRecordView) {
        _buyRecordView = [JCMineCellFunctionView new];
        _buyRecordView.iconImg = JCIMAGE(@"me_ic_buy");
        _buyRecordView.title = @"购买记录";
    }
    return _buyRecordView;
}

- (JCMineCellFunctionView *)accountView {
    if (!_accountView) {
        _accountView = [JCMineCellFunctionView new];
        _accountView.iconImg = JCIMAGE(@"me_ic_account");
        _accountView.title = @"账户设置";
    }
    return _accountView;
}

- (JCMineCellFunctionView *)settingView {
    if (!_settingView) {
        _settingView = [JCMineCellFunctionView new];
        _settingView.iconImg = JCIMAGE(@"me_ic_setting");
        _settingView.title = @"系统设置";
    }
    return _settingView;
}

- (JCMineCellFunctionView *)kefuView {
    if (!_kefuView) {
        _kefuView = [JCMineCellFunctionView new];
        _kefuView.iconImg = JCIMAGE(@"me_ic_customer");
        _kefuView.title = @"联系客服";
    }
    return _kefuView;
}

- (JCMineCellFunctionView *)aboutView {
    if (!_aboutView) {
        _aboutView = [JCMineCellFunctionView new];
        _aboutView.iconImg = JCIMAGE(@"me_ic_about");
        _aboutView.title = @"关于我们";
    }
    return _aboutView;
}

- (JCMineCellFunctionView *)questionView {
    if (!_questionView) {
        _questionView = [JCMineCellFunctionView new];
        _questionView.iconImg = JCIMAGE(@"me_ic_question");
        _questionView.title = @"常见问题";
    }
    return _questionView;
}



@end
