//
//  JCYCQianYueShowView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCQianYueShowView.h"
#import "JCPostCheckRuleVC.h"
@implementation JCYCQianYueShowView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    UIImageView *bgView = [UIImageView new];
    bgView.image = JCIMAGE(@"yc_tip_qianyue");
    bgView.userInteractionEnabled = YES;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(30)+kNavigationBarHeight);
        make.left.offset(AUTO(30));
        make.right.offset(AUTO(-30));
        make.height.mas_equalTo(AUTO(440));
    }];

    UIImageView *davImgView = [UIImageView new];
    davImgView.image = JCIMAGE(@"jc_yuce_v");
    [bgView addSubview:davImgView];
    [davImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(bgView);
        make.top.offset(AUTO(113));
        make.size.mas_equalTo(CGSizeMake(AUTO(78), AUTO(66)));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"恭喜您 !" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(davImgView.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(bgView);
    }];
    
    UILabel *label1 = [UILabel initWithTitle:@"获得成为平台签约专家的机会" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    label1.numberOfLines = 0;
    [bgView addSubview:label1];
    [label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"立即签约" FontSize:AUTO(16) BackGroundColor:COLOR_EF2F2F TextColors:JCWhiteColor];
    sureBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    [bgView addSubview:sureBtn];
    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(26)];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(label1.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(250), AUTO(46)));
    }];
    
    NSString *string = @"暂不需要";
    NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:string];
    [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_A9A9A9,NSUnderlineStyleAttributeName : [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle), NSUnderlineColorAttributeName : COLOR_A9A9A9} range:string.rangeOfAll];
    
    UILabel *label2 = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    label2.userInteractionEnabled = YES;
    label2.numberOfLines = 0;
    [bgView addSubview:label2];
    [label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(sureBtn.mas_bottom).offset(AUTO(20));
        make.centerX.equalTo(bgView);
    }];
    label2.attributedText = atext;
    

    
    WeakSelf;
    [label2 bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [sureBtn bk_whenTapped:^{
//        UIPasteboard * pasteBoard = [UIPasteboard generalPasteboard];
//        pasteBoard.string = self.qianyueModel.wechat;
//        [JCWToastTool showHint:@"已复制到黏贴版"];
        [weakSelf removeFromSuperview];
        if (weakSelf.JCAgreeBlock) {
            weakSelf.JCAgreeBlock();
        }

        
    }];
}

@end
