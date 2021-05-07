//
//  JCPayWayBall.h
//  Jingcai
//
//  Created by Administrator on 2019/1/21.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

//充值方式
typedef NS_ENUM(NSInteger, JCPayWayEnum) {
    JCPayWayEnumUnknown, //未选择支付
    JCPayWayEnumHongbao, //红包抵扣
    JCPayWayEnumCaiyun, //红币(红币)
};

NS_ASSUME_NONNULL_BEGIN
@interface JCPayWayBall : JCWBaseBall
@property (nonatomic, assign) JCPayWayEnum payWay; //设定充值方式
@property (nonatomic, assign) BOOL state_issel; //是否选中
@property (nonatomic, strong) NSString * caiyun; //红币余额
@property (nonatomic, strong) NSString * title; //红币余额
@property (nonatomic, assign) BOOL is_dikou;
@property (nonatomic, assign) BOOL is_showHigh;//显示最大
@end
NS_ASSUME_NONNULL_END
