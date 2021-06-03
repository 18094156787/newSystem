//
//  JCActivityPrizeTitleView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityPrizeTitleView.h"

@implementation JCActivityPrizeTitleView

- (void)initViews {
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.height.mas_equalTo(30);
    }];
    
    [self addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(46, 18));
    }];

}

- (void)setTitleModel:(JCActivityGoodsTitleModel *)titleModel {
    _titleModel = titleModel;
    if ([titleModel.grade integerValue]>0&&[self.detailModel.type integerValue]==3&&[self.detailModel.pay_type integerValue]==2&&self.showHeader) {
        self.titleLab.text = [NSString stringWithFormat:@"累计充值%@元",NonNil(titleModel.grade)];
        self.statusLab.hidden = [titleModel.is_own integerValue]==1?NO:YES;
    }else if([titleModel.grade integerValue]>0&&self.showHeader){
        self.titleLab.text = [NSString stringWithFormat:@"累计积分:%@",NonNil(titleModel.grade)];
        self.statusLab.hidden = [titleModel.is_own integerValue]==1?NO:YES;
    }else{
        self.titleLab.text = @"";
        self.statusLab.hidden = YES;
    }
   
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];

    }
    return _titleLab;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"已领取" andFont:AUTO(10) andWeight:1 andTextColor:UIColorFromRGB(0x278A66) andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _statusLab.layer.borderWidth = 0.5;
        _statusLab.layer.borderColor = UIColorFromRGB(0x278A66).CGColor;
        _statusLab.layer.cornerRadius = 3;
        _statusLab.layer.masksToBounds = YES;
    }
    return _statusLab;
}


@end
