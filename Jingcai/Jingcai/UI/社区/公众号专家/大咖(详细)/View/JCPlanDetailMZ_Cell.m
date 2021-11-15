//
//  JCPlanDetailMZ_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPlanDetailMZ_Cell.h"

@implementation JCPlanDetailMZ_Cell

- (void)initViews {
    [self.contentView addSubview:self.dsView];
    [self.dsView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.contentView);
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(140));
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
}

- (void)setPlanDetailModel:(JCWTjInfoBall *)planDetailModel {
    _planDetailModel = planDetailModel;
    self.dsView.ID = planDetailModel.id;
    self.dsView.dsShowView.user_name = planDetailModel.user_name;
    self.dsView.dsShowView.user_img = planDetailModel.user_img;
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

- (JCDaShangView *)dsView {
    if (!_dsView) {
        _dsView = [JCDaShangView new];
        _dsView.scene = @"8";
    }
    return _dsView;
}

@end
