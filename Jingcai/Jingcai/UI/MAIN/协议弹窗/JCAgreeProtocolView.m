//
//  JCAgreeProtocolView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAgreeProtocolView.h"
#import "JCMainTabBarController.h"
#import "JCPrivacy_ShowVC.h"
#import "JCService_ShowVC.h"
@implementation JCAgreeProtocolView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    self.titleLab.text = @"服务协议和隐私政策";
    self.titleLab.textColor = COLOR_2F2F2F;
    self.contentLab.textColor = COLOR_2F2F2F;
    [self.sureBtn setTitle:@"同意" forState:0];
    self.sureBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    
    
     [self addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(self);
//            make.top.offset(kNavigationBarHeight+AUTO(120));
//            make.top.offset(kNavigationBarHeight+AUTO(120));
            make.left.offset(AUTO(35));
            make.right.offset(AUTO(-35));
    
        }];
    
        [self.bgView addSubview:self.titleLab];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(25));
            make.left.offset(AUTO(30));
            make.right.offset(AUTO(-30));
        }];
    
    [self.bgView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.height.mas_equalTo(0.5);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
    }];

        
        [self.bgView addSubview:self.contentLab];
        [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
//            if (title.length>0) {
//                make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(25));
//            }else{
//                make.top.offset(AUTO(35));
//            }
            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(25));
            make.left.offset(AUTO(15));
            make.right.offset(AUTO(-15));
            make.height.mas_equalTo(AUTO(235));
        }];
    

    
        [self.bgView addSubview:self.sureBtn];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bgView);
            make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
            make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(25));
            make.bottom.equalTo(self.bgView).offset(AUTO(-15));
        }];
    
//      if(confirmActionHandler){
//          [self.sureBtn bk_whenTapped:^{
//              confirmActionHandler();
//          }];
//      }
    WeakSelf;
    [self.sureBtn bk_whenTapped:^{
//        confirmActionHandler();
        [weakSelf removeFromSuperview];
    }];
    
    
    NSString *content = @"请你务必审慎阅读、充分理解“服务协议”和“隐私政策”各条款，包括但不限于：为了向你提供即时通讯、内容分享等服务，我们需要或者通过第三方SDK(极光推送、友盟)收集你的设备信息、操作日志、地理位置等个人信息并管理你的授权。\n\n你可阅读《服务协议》和《隐私政策》了解详细信息。如你同意，请点击“同意”开始接受我们的服务。";
    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:content attributes:@{NSForegroundColorAttributeName:COLOR_2F2F2F,NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(15)]}];
    NSRange fwRange = [content rangeOfString:@"《服务协议》"];
    NSRange yinsiRange = [content rangeOfString:@"《隐私政策》"];

    [atext addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:fwRange];
    [atext addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:yinsiRange];
    YYTextHighlight *hi = [YYTextHighlight new];
    [atext setTextHighlight:hi range:fwRange];
    
    YYTextHighlight *yinsi = [YYTextHighlight new];
    [atext setTextHighlight:yinsi range:yinsiRange];
    
    
//    WeakSelf;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        UINavigationController *nav = tabBarController.viewControllers[tabBarController.tabSelIndex];
        JCService_ShowVC *vc = [JCService_ShowVC new];
        vc.titleStr = @"服务协议";
        UINavigationController *presentNav = [[UINavigationController alloc] initWithRootViewController:vc];
        UIViewController *rootVC = [UIApplication sharedApplication].windows.lastObject.rootViewController;
        [rootVC presentViewController:presentNav animated:YES completion:^{
            
            
        }];
    };
    
    yinsi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        UINavigationController *nav = tabBarController.viewControllers[tabBarController.tabSelIndex];
        JCPrivacy_ShowVC *vc = [JCPrivacy_ShowVC new];
        vc.titleStr = @" ";
        UINavigationController *presentNav = [[UINavigationController alloc] initWithRootViewController:vc];
        UIViewController *rootVC = [UIApplication sharedApplication].windows.lastObject.rootViewController;
        [rootVC presentViewController:presentNav animated:YES completion:^{
            
            
        }];
//        [nav pushViewController:[JCPrivacyVC new] animated:YES];
    };

    self.contentLab.attributedText = atext;
}



- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _bgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(17) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (YYLabel *)contentLab {
    if (!_contentLab) {
//        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
//        _contentLab.numberOfLines = 0;
        _contentLab = [YYLabel new];
        _contentLab.textColor = COLOR_2F2F2F;
        _contentLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(15)];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}
//- (YYLabel *)protocolLab {
//    if (!_protocolLab) {
//        _protocolLab = [YYLabel new];
//        _protocolLab.textColor = COLOR_999999;
//        _protocolLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
//
//    }
//    return _protocolLab;
//}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor =COLOR_DDDDDD;
    }
    return _lineView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        
    }
    return _sureBtn;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCBaseColor];
//        [_cancelBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        _cancelBtn.layer.cornerRadius = AUTO(22);
        _cancelBtn.layer.masksToBounds = YES;
        _cancelBtn.layer.borderColor = JCBaseColor.CGColor;
        _cancelBtn.layer.borderWidth = 1;
        
    }
    return _cancelBtn;
}
@end
