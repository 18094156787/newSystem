//
//  JCDakaBuyPlanHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaBuyPlanHeadView.h"

@implementation JCDakaBuyPlanHeadView

- (void)initViews {
    self.backgroundColor= COLOR_F4F6F9;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(10), 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
    }];
    
    [bgView addSubview:self.infoLab];
     [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.offset(AUTO(15));
         make.right.offset(AUTO(-15));
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
     }];
}

- (void)setPayInfoModel:(JCWTjInfoBall *)payInfoModel {
    _payInfoModel = payInfoModel;
    self.titleLab.text = payInfoModel.title;
    self.infoLab.text = [NSString stringWithFormat:@"%@发布· %@人浏览",payInfoModel.time,payInfoModel.click];
    if ([payInfoModel.click integerValue]==0) {
        self.infoLab.text = [NSString stringWithFormat:@"%@发布",payInfoModel.time];
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

@end
