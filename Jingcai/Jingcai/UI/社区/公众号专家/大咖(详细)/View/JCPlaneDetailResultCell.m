//
//  JCPlaneDetailResultCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailResultCell.h"

@implementation JCPlaneDetailResultCell

- (void)initViews {
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.height.mas_equalTo(0.5);
    }];
    
    [self.contentView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.lineView.mas_bottom).offset(AUTO(15));
//        make.height.mas_equalTo(0.5);
    }];
    
    [self.contentView addSubview:self.columnView];
    [self.columnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.resultLab.mas_bottom);
        make.height.mas_equalTo(0);
    }];

    
    [self.contentView addSubview:self.dsView];
    [self.dsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.columnView.mas_bottom);
        make.height.mas_equalTo(0);
    }];
    
    
    UILabel *infoLab = [UILabel initWithTitle:@"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines= 0;
    [self.contentView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.dsView.mas_bottom).offset(AUTO(15));
        make.bottom.offset(AUTO(-15));
    }];
    
    WeakSelf;
    [self.columnView bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
        }
    }];
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    self.dsView.ID = planDetailModel.id;
    self.dsView.dsShowView.user_name = planDetailModel.user_name;
    self.dsView.dsShowView.user_img = planDetailModel.user_img;
    if (planDetailModel.is_end==1) {
        if (planDetailModel.result.length>0) {
            self.resultLab.textColor = JCBaseColor;
            self.resultLab.text = planDetailModel.result;
        }else{
            self.resultLab.text = @"待定";
            self.resultLab.textColor = COLOR_30B27A;
        }
    }else{
        self.lineView.hidden = YES;
        [self.resultLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.lineView.mas_bottom).offset(0);
        }];
    }
    
    self.columnView.hidden = self.planDetailModel.column_info?NO:YES;
    self.columnView.model = self.planDetailModel.column_info;
    [self.columnView mas_updateConstraints:^(MASConstraintMaker *make) {
        if (self.planDetailModel.column_info) {
            make.height.mas_equalTo(AUTO(150));
        }else{
            make.height.mas_equalTo(0);
        }
        
    }];
    if (self.planDetailModel.is_reward_open==1) {
        self.dsView.hidden = NO;
        self.dsView.reward_num = self.planDetailModel.reward_num;
        [self.dsView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(140));
        }];
    }else{
        self.dsView.hidden = YES;
        [self.dsView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }
    
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

- (JCDakaColumnAssociatedView *)columnView {
    if (!_columnView) {
        _columnView = [JCDakaColumnAssociatedView new];
        _columnView.haveBottomDistance = YES;
    }
    return _columnView;
}

- (JCDaShangView *)dsView {
    if (!_dsView) {
        _dsView = [JCDaShangView new];
        _dsView.scene = @"8";
        _dsView.hidden = YES;
    }
    return _dsView;
}




@end
