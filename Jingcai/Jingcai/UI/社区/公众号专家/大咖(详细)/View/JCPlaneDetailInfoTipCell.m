//
//  JCPlaneDetailInfoTipCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailInfoTipCell.h"

@implementation JCPlaneDetailInfoTipCell

- (void)initViews {
    

    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(10));
        make.height.mas_equalTo(0.5);
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(10));
//        make.height.mas_equalTo(0.5);
    }];
    
    [self.contentView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {

        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.lineView.mas_bottom).offset(AUTO(10));
//        make.bottom.offset(AUTO(-15));
    }];

    

    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(10));
        make.bottom.offset(AUTO(-15));
    }];
    
}

- (void)setInfoModel:(JCWTjInfoBall *)infoModel {
    _infoModel = infoModel;
    if (!infoModel) {
        return;
    }
    if (infoModel.is_end==1) {
        if (infoModel.zhong.length>0) {
            self.resultLab.textColor = JCBaseColor;
            self.resultLab.text = infoModel.zhong;
        }else{
            self.resultLab.text = @"待定";
            self.resultLab.textColor = COLOR_30B27A;
        }
    }else{
        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(-10));
        }];
        self.lineView.hidden = YES;

    }
    
    
    self.infoLab.text = @"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！";
}

- (void)setFreeDetailModel:(JCWTjInfoBall *)freeDetailModel {
    _freeDetailModel = freeDetailModel;
    [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.resultLab.mas_bottom).offset(AUTO(-10));
    }];
    self.lineView.hidden = YES;
    self.infoLab.text = @"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！";
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DBDBDB;
    }
    return _lineView;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _resultLab.numberOfLines = 0;
    }
    return _resultLab;
}

@end
