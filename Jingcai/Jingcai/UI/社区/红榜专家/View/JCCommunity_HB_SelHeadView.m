//
//  JCCommunity_HB_SelHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunity_HB_SelHeadView.h"

@implementation JCCommunity_HB_SelHeadView

- (void)initViews {
    
    UIView *topView = [UIView new];
    topView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:topView];
    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.offset(0);
        make.height.mas_equalTo(AUTO(8));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"达人方案" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(topView.mas_bottom);
        make.bottom.offset(0);
    }];
    
    [self addSubview:self.selectBtn];
    [self.selectBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(titleLab);
        make.size.mas_equalTo(CGSizeMake(80, 24));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
}

- (UIButton *)selectBtn {
    if (!_selectBtn) {
        _selectBtn = [UIButton initWithText:@"全部" FontSize:12 BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _selectBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:12];
        [_selectBtn setImage:JCIMAGE(@"jc_select_down") forState:0];
        [_selectBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, 0, 20)];
        [_selectBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 60, 0, 0)];
        _selectBtn.layer.borderWidth = 0.5;
        _selectBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _selectBtn.layer.masksToBounds = YES;
        _selectBtn.layer.cornerRadius = 14;
    }
    return _selectBtn;
}

@end
