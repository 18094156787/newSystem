//
//  JCYCHongbaoChaiView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHongbaoChaiView.h"

@implementation JCYCHongbaoChaiView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIImageView *bgView = [UIImageView new];
    bgView.image = JCIMAGE(@"jc_yc_chai_bgView");
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.offset(kNavigationBarHeight+40);
        make.size.mas_equalTo(CGSizeMake(315, 487));
    }];
    
    UIImageView *titleImgView = [UIImageView new];
    titleImgView.image = JCIMAGE(@"jc_yc_chai_title");
    [bgView addSubview:titleImgView];
    [titleImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(155);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(247, 37));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(270);
        make.left.offset(30);
        make.right.offset(-30);
        make.height.mas_equalTo(100);
    }];
    
    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(30);
        make.right.offset(-30);
        make.bottom.offset(-30);
        make.height.mas_equalTo(46);
    }];
    
    UIButton *closeBtn = [UIButton new];
    [closeBtn setImage:JCIMAGE(@"yc_tip_close") forState:0];
    [self addSubview:closeBtn];
    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(bgView.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(50)));
    }];
    WeakSelf;
    [closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];

    
    NSString *infoString = @"邀请好友 **** 0911 加入全民鲸猜\n送你一个大红包";
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    [paragraphStyle setAlignment:NSTextAlignmentCenter];
    paragraphStyle.lineSpacing = 5; // 设置行间距
    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:infoString];
    [atext addAttributes:@{NSParagraphStyleAttributeName: paragraphStyle} range:infoString.rangeOfAll];
    self.titleLab.attributedText = atext;
    

    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCChaiBlock) {
            weakSelf.JCChaiBlock();
        }
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:14 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即拆开" FontSize:16 Weight:2 BackGroundColor:JCWhiteColor TextColors:COLOR_EF2F2F];
        [_sureBtn hg_setAllCornerWithCornerRadius:26];
    }
    return _sureBtn;;
}

@end
