//
//  JCYuCeWeekResultModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCYCUserInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYuCeWeekResultModel : JCWBaseBall

#pragma mark//新版本接口

@property (nonatomic,copy) NSString *is_win;// 1 入榜 2不入

@property (nonatomic,copy) NSString *lianhong;//连红

@property (nonatomic,copy) NSString *mingzhong;//命中

@property (nonatomic,copy) NSString *wechat;// 微信

@property (nonatomic,copy) NSString *total;//钱！结果除100

@property (nonatomic,copy) NSString *top;//是否签约 1签约

@property (nonatomic,copy) NSString *code;//验证码

@property (nonatomic,strong) JCYCUserInfoModel *user_info;

@end

NS_ASSUME_NONNULL_END
