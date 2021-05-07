//
//  JCMyIncomeDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMyIncomeDetailModel : JCWBaseBall

@property (nonatomic,strong) NSString *type;//type 类型 1 大额现金 2小额现金 4优惠券 5 免单券

@property (nonatomic,strong) NSString *month_profit;//本月收益

@property (nonatomic,strong) NSString *yestoday_profit;//昨日收益

@property (nonatomic,strong) NSString *surplus_profit;//收益余额

@property (nonatomic,strong) NSString *cumulative_income;//累计收益

@property (nonatomic,strong) NSString *is_time;//是否提现日（每月5-10号）1是 2否

@property (nonatomic,strong) NSString *is_tx;//是否已经提现 1是 2否

@property (nonatomic,strong) NSString *is_bankcard;//是否已经绑卡 1是 2否

@end

NS_ASSUME_NONNULL_END
