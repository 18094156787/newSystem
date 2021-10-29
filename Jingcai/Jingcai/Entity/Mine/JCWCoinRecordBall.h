//
//  JCWCoinRecordBall.h
//  Jingcai
//
//  Created by Administrator on 2019/4/2.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWCoinRecordBall : JCWBaseBall
@property (nonatomic, strong) NSString * title;
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * time;
@property (nonatomic, strong) NSString * money;
@property (nonatomic, strong) NSString * sendmoney;
@property (nonatomic, strong) NSString * total;
@property (nonatomic, strong) NSString * created_at;
@property (nonatomic, strong) NSString * tuijian_id;
@property (nonatomic, assign) NSInteger status;//0是充值1是支付普通推荐2是支付大咖推荐3是大咖退款4是红榜退款
//5购买全民竞猜推荐   6 全民竞猜退款  7 赠送的红币 8 过期红币
@property (nonatomic, assign) NSInteger type;

#pragma mark//新版本接口
@property (nonatomic, assign) NSInteger  icon_type;//类型:1.购买方案,2.退款,3.充值红币,4.赠送红币,5.过期红币 6.购买专栏

@property (nonatomic, strong) NSString * num;

@property (nonatomic, assign) NSInteger is_income;//收入支出,0支出,1收入
@end
NS_ASSUME_NONNULL_END
