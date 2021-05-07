//
//  JCMyBuyOrderDataBuyCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderDataBuyCell.h"

@implementation JCMyBuyOrderDataBuyCell

- (void)initViews {

    [self.contentView addSubview:self.buyBtn];
    [self.buyBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(5));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(50));
    }];
    
    WeakSelf;
    [self.buyBtn bk_whenTapped:^{
        if (weakSelf.JCBuyBlock) {
            weakSelf.JCBuyBlock();
        }
    }];
}

- (UIButton *)buyBtn {
    if (!_buyBtn) {
        _buyBtn = [UIButton initWithText:@"再次购买" FontSize:AUTO(14) Weight:1 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_buyBtn setBackgroundImage:JCIMAGE(@"button_bg") forState:0];
        [_buyBtn setBackgroundImage:JCIMAGE(@"button_bg") forState:UIControlStateHighlighted];
        [_buyBtn hg_setAllCornerWithCornerRadius:4];
    }
    return _buyBtn;
}
@end
