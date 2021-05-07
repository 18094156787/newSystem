//
//  JCPlaneDetailNewSubTitleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailNewSubTitleCell.h"

@implementation JCPlaneDetailNewSubTitleCell

- (void)initViews {
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentView).offset(AUTO(15));
        make.left.equalTo(self.contentView).offset(AUTO(16));
        make.right.equalTo(self.contentView).offset(AUTO(-16));
        make.bottom.equalTo(self.contentView).offset(AUTO(-15));
    }];
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    
    self.titleLab.text = planDetailModel.subtitle;
    
}

@end
