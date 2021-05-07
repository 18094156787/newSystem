//
//  JCPlaneDetailSM_View.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPlaneDetailSM_View.h"

@implementation JCPlaneDetailSM_View

- (void)initViews {
    UILabel *infoLab = [UILabel initWithTitle:@"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines= 0;
    [self addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(10));
    }];
}
@end
