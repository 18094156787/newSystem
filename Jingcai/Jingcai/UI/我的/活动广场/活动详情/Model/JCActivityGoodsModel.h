//
//  JCActivityGoodsModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityGoodsModel : JCWBaseBall

@property (nonatomic,strong) NSString *grade;//档次 默认0 充值属于金额元

@property (nonatomic,strong) NSString *count;//物品数量

@property (nonatomic,strong) NSString *id;//物品活动关联I

@property (nonatomic,strong) NSString *goods_id;//物品ID

@property (nonatomic,strong) NSString *goods_name;//物品名称

@property (nonatomic,strong) NSString *type;//物品类型 1红币 2积分 3免单券 4优惠券 5固定红包 6随机红包

@property (nonatomic,strong) NSString *total_min;//金额数值

@property (nonatomic,strong) NSString *total_max;//金额数值大

@property (nonatomic,strong) NSString *use_conditions;//使用金额

@property (nonatomic,strong) NSString *use_time_limit;//使用期限 无限期 7天 15天 30天 一年

@property (nonatomic,strong) NSString *introduce;//物品介绍

@property (nonatomic,strong) NSString *remarks;//物品备注

@property (nonatomic,strong) NSString *use_range;//使用范围

@property (nonatomic,strong) NSString *status;//状态 1 正常 2禁用

@end

NS_ASSUME_NONNULL_END
