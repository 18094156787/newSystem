//
//  JCRedPacketActivityVIEW.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCRedPacketActivityView.h"
#import "JCMainTabBarController.h"
@implementation JCRedPacketActivityView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIImageView *imgView = [UIImageView new];
    imgView.userInteractionEnabled = YES;
    [self addSubview:imgView];
    self.bgImgView= imgView;
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(23));
        make.right.offset(AUTO(-23));
        make.top.offset(AUTO(100));
        make.height.mas_equalTo(AUTO(468));
    }];
    
    [imgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(188));
        make.centerX.equalTo(imgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(230), AUTO(120)));
    }];
    
    [imgView addSubview:self.saveBtn];
    [self.saveBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(319));
        make.centerX.equalTo(imgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(108), AUTO(32)));
    }];
    

    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"xx_close") forState:0];
     [closeBtn setImage:JCIMAGE(@"xx_close") forState:UIControlStateHighlighted];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(imgView.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(imgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(23), AUTO(23)));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    

    [imgView bk_whenTapped:^{
        if (![JCWUserBall currentUser]) {
            [weakSelf removeFromSuperview];
                JCMainTabBarController *tabBar = (JCMainTabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            UINavigationController *nav = (UINavigationController *)tabBar.viewControllers.firstObject;
            [nav pushViewController:[JCLoginWMStickVC new] animated:YES];


            return ;
        }
//        [self getRedPacket];
    }];
    
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(37) andWeight:UIFontWeightHeavy andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _titleLab.font = [UIFont boldSystemFontOfSize:AUTO(37)];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UIButton *)saveBtn {
    if (!_saveBtn) {
        _saveBtn = [UIButton initWithText:@"点击领取" FontSize:AUTO(14) BackGroundColor:COLOR_FDD552 TextColors:JCWhiteColor];
        [_saveBtn hg_setAllCornerWithCornerRadius:AUTO(16)];
        _saveBtn.userInteractionEnabled = NO;
    }
    return _saveBtn;
}

- (JCActivityRedPacketListView *)packetView {
    if (!_packetView) {
        _packetView = [JCActivityRedPacketListView new];
    }
    return _packetView;
}

@end
