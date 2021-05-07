//
//  JCParticipateJingCaiTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCParticipateJingCaiTipView.h"

@implementation JCParticipateJingCaiTipView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
        [self setupUI];
       
    }
    return self;
}
- (void)setupUI {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        if (IPHONE_X) {
             make.top.offset(AUTO(180)+kNavigationBarHeight);
        }else{
            make.top.offset(AUTO(130)+kNavigationBarHeight);
        }
        
        make.left.offset(AUTO(35));
        make.right.offset(AUTO(-35));
        make.height.mas_equalTo(AUTO(220));
    }];

    
    [bgView addSubview:self.sorryLab];
    [self.sorryLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(30));
        make.centerX.equalTo(bgView);
        make.height.mas_equalTo(AUTO(20));
    }];
    

    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.sorryLab.mas_bottom).offset(AUTO(30));
        make.centerX.equalTo(bgView);
    }];
    
    UIButton *sureBtn = [UIButton initWithText:@"我知道了" FontSize:AUTO(16 ) BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [bgView addSubview:sureBtn];
    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(23)];
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(AUTO(-25));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(280), AUTO(46)));
    }];
    WeakSelf;
    [sureBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
//    UIView *lineView = [UIView new];
//    lineView.backgroundColor = JCWhiteColor;
//    [self addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.equalTo(bgView);
//        make.top.equalTo(bgView.mas_bottom);
//        make.size.mas_equalTo(CGSizeMake(1, AUTO(20)));
//    }];
    
//    UIButton *closeBtn = [UIButton new];
//    [closeBtn setImage:JCIMAGE(@"xx_close") forState:0];
//     [closeBtn setImage:JCIMAGE(@"xx_close") forState:UIControlStateHighlighted];
//    [self addSubview:closeBtn];
//    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(lineView.mas_bottom).offset(0);
//        make.centerX.equalTo(bgView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(23), AUTO(23)));
//    }];
//    [closeBtn bk_whenTapped:^{
//        [self removeFromSuperview];
//    }];
//
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:@"抱歉！\n当场需要1.5以上赔率"];
    NSRange range = [@"抱歉！\n当场需要1.5以上赔率" rangeOfString:@"抱歉！"];
    [attrString addAttribute:NSFontAttributeName value:[UIFont boldSystemFontOfSize:AUTO(16)] range:range];
//    [attrString addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
    self.infoLab.attributedText = attrString;
    
    
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _infoLab.numberOfLines = 2;
    }
    return _infoLab;
}

- (UILabel *)sorryLab {
    if (!_sorryLab) {
        _sorryLab = [UILabel labelTitle:@"抱歉" andFont:AUTO(16) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _sorryLab.numberOfLines = 2;
    }
    return _sorryLab;
}


@end
