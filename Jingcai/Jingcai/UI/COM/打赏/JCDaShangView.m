//
//  JCDaShangView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDaShangView.h"
#import "JCChargeVC.h"
@implementation JCDaShangView

- (void)initViews {

    
    [self addSubview:self.dsBtn];
    [self.dsBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(40));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(188), AUTO(32)));
    }];
    
    [self addSubview:self.dsCountLab];
    [self.dsCountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.dsBtn.mas_bottom).offset(AUTO(8));
    }];
    
    WeakSelf;
    self.dsShowView.JCBlock = ^{
        WebViewController *vc = [WebViewController new];
        vc.showBackItem = YES;
            vc.titleStr = @"鲸猜足球用户购买协议";
            NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_purchase];
            vc.urlStr = NonNil(urlStr);
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [[weakSelf getViewController] presentViewController:nav animated:YES completion:nil];
    };
    self.dsShowView.JCRechargeBlock = ^{
        [weakSelf.dsShowView hide];
        [[weakSelf getViewController].navigationController pushViewController:[JCChargeVC new] animated:YES];
    };
}

- (void)data {
    NSString *count = @"0";
    NSString *countString = [NSString stringWithFormat:@"已有%@人打赏",count];
    if ([count integerValue]>0) {
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:countString];
        NSRange range = [countString rangeOfString:count];
        [attr addAttributes:@{NSForegroundColorAttributeName:COLOR_EF2F2F} range:range];
        self.dsCountLab.attributedText = attr;
    }else{
        self.dsCountLab.text = @"快来支持一下，为专家打call";
    }

}

- (void)dsBtnClick {

    JCBaseViewController *vc = (JCBaseViewController *)self.getViewController;
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    self.dsShowView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);

    
    [vc.jcWindow addSubview:self.dsShowView];
    [self.dsShowView show];
}

- (UIButton *)dsBtn {
    if (!_dsBtn) {
        _dsBtn = [UIButton initWithText:@"打赏" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_dsBtn setBackgroundImage:JCIMAGE(@"button_bg") forState:0];
        [_dsBtn setBackgroundImage:JCIMAGE(@"button_bg") forState:UIControlStateHighlighted];
        [_dsBtn addTarget:self action:@selector(dsBtnClick) forControlEvents:UIControlEventTouchUpInside];
        [_dsBtn hg_setAllCornerWithCornerRadius:4];
    }
    return _dsBtn;
}

- (UILabel *)dsCountLab {
    if (!_dsCountLab) {
        _dsCountLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _dsCountLab;
}

- (JCDaShangShowView *)dsShowView {
    if (!_dsShowView) {
        _dsShowView = [JCDaShangShowView new];
    }
    return _dsShowView;
}

@end
