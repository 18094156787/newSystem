//
//  JCPlaneDetailNewContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailNewContentCell.h"

@implementation JCPlaneDetailNewContentCell

- (void)initViews {
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"方案详情" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.contentView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(lineView);
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.left.equalTo(self.contentView).offset(AUTO(15));
        make.right.equalTo(self.contentView).offset(AUTO(-15));
        make.bottom.offset(AUTO(-15));
        
    }];
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineSpacing = 6; // 设置行间距
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:self.planDetailModel.content attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
    self.contentLab.attributedText = attributedStr;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel labelTitle:@"" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}
@end
