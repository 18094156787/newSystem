//
//  JCConfigModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCConfigModel : JCWBaseBall<NSCoding>

@property (strong, nonatomic) NSString  * customer;//客服微信

@property (strong, nonatomic) NSString  * customer_award;//领奖微信

@property (strong, nonatomic) NSString  * get_about;//关于我们

@property (strong, nonatomic) NSString  * get_question;//常见问题

@property (strong, nonatomic) NSString  * get_customer;//联系客服

@property (strong, nonatomic) NSString  * get_privacy;//隐私协议

@property (strong, nonatomic) NSString  * get_purchase;//购买协议

@property (strong, nonatomic) NSString  * get_service;//服务协议

@property (strong, nonatomic) NSString  * get_tz;//鲸猜学院进阶pd

@property (strong, nonatomic) NSString  * get_jctzsc;//鲸猜学院进阶视频

@property (strong, nonatomic) NSString  * get_rule;//红榜规则


+ (void)save:(JCConfigModel *)configModel;

+ (instancetype)currentConfigModel;

+ (void)clear;

@end

NS_ASSUME_NONNULL_END
