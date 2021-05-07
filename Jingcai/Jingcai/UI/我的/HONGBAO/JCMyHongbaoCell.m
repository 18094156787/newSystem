//
//  JCMyHongbaoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCMyHongbaoCell.h"
#import "JCMainTabBarController.h"
@implementation JCMyHongbaoCell

- (void)initViews {
    self.backgroundColor = COLOR_F6F6F6;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
//    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 1, 0));
    }];

    
    [bgView addSubview:self.priceLab];
     [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.offset(0);
         make.centerY.equalTo(bgView);
         make.height.mas_equalTo(AUTO(50));
         make.width.mas_equalTo(AUTO(115));
     }];
    
    [bgView addSubview:self.titleLab];
     [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.offset(AUTO(10));
         make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
         make.right.offset(AUTO(-15));
     }];
    
    [bgView addSubview:self.limitLab];
     [self.limitLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
         make.left.equalTo(self.titleLab);
         make.right.offset(AUTO(-80));
     }];
    
    
    [bgView addSubview:self.infoLab];
     [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.limitLab.mas_bottom).offset(AUTO(2));
         make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
         make.right.offset(AUTO(-80));
         
     }];
    
    [bgView addSubview:self.dateLab];
     [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(2));
         make.left.equalTo(self.priceLab.mas_right).offset(AUTO(10));
         make.bottom.offset(AUTO(-10));
//         make.right.offset(AUTO(-80));
     }];
    
    [bgView addSubview:self.userBtn];
    [self.userBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(25)));
    }];
    WeakSelf;
    [self.userBtn bk_whenTapped:^{
        JCMainTabBarController *tabVC = (JCMainTabBarController *)[weakSelf getViewController].tabBarController;
        tabVC.tabSelIndex = 2;
        [[weakSelf getViewController].navigationController popViewControllerAnimated:YES];
    }];
    
//    [self data];
}

- (void)setModel:(JCActivityRedPacketModel *)model {
    _model = model;
//     float price = [model.total floatValue];
    NSString *priceString = [NSString stringWithFormat:@"¥ %@",model.total];
     NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:priceString];
     NSRange range = [priceString rangeOfString:@"¥"];
     [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:AUTO(15)] range:range];
     self.priceLab.attributedText = attrString;
    self.priceLab.attributedText = attrString;
    
    self.titleLab.text = model.name;
    self.infoLab.text = @"不可提现或转赠，到期作废";
    self.dateLab.text = model.time;
    self.limitLab.text = model.scope;
}




- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel labelTitle:@"" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_F72D27   andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _priceLab.font = [UIFont boldSystemFontOfSize:AUTO(24)];
    }
    return _priceLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_333333   andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font = [UIFont boldSystemFontOfSize:AUTO(14)];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)limitLab {
    if (!_limitLab) {
        _limitLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_999999  andBackgroundColor:JCClearColor andTextAlignment:0];
        _limitLab.numberOfLines = 0;
    }
    return _limitLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_999999  andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel labelTitle:@"" andFont:AUTO(10) andWeight:0 andTextColor:COLOR_999999  andBackgroundColor:JCClearColor andTextAlignment:0];
        _dateLab.numberOfLines = 0;
    }
    return _dateLab;
}

- (UIButton *)userBtn {
    if (!_userBtn) {
        _userBtn = [UIButton initWithText:@"去使用" FontSize:AUTO(12) BackGroundColor:JCBtnColor TextColors:JCWhiteColor];
        [_userBtn hg_setAllCornerWithCornerRadius:AUTO(3)];
        
    }
    return _userBtn;
}

@end
