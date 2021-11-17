//
//  JCBigDataOrderDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataOrderDetailModel : JCWBaseBall

@property (nonatomic,strong) NSString *style_desc;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *desc;

@property (nonatomic,strong) NSString *start_time;

@property (nonatomic,strong) NSString *end_time;

@property (nonatomic,strong) NSString *release_time;

@property (nonatomic,strong) NSString *old_total;

@property (nonatomic,strong) NSString *hongbao_total;

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *style;//1是单场

//@property (nonatomic,strong) NSString *pay_type;

@property (nonatomic,strong) NSString *order_time;

//@property (nonatomic,strong) NSString *order_id;

@property (nonatomic,strong) NSString *match_id;
//比赛信息相关

@property (nonatomic,strong) NSString *type_desc;

@property (nonatomic,strong) NSString *league_name;

@property (nonatomic,strong) NSString *home_name;

@property (nonatomic,strong) NSString *away_name;

@property (nonatomic,strong) NSString *homo_logo;

@property (nonatomic,strong) NSString *away_logo;

@property (nonatomic,strong) NSString *full_home;

@property (nonatomic,strong) NSString *full_away;

@property (nonatomic,strong) NSString *match_name;

@property (nonatomic,strong) NSString *match_time;

@property (nonatomic,strong) NSString *matchStatus;

#pragma mark//新版本接口

@property (nonatomic,strong) NSArray <JCDianPingMatchBall *>*match_data;

@property (nonatomic,strong) NSString *order_id;

@property (nonatomic,assign) NSInteger paid;//支付状态,0未支付,1已支付,2已退款;

@property (nonatomic,strong) NSString *refund_reason_time;//退款时间 如果有

@property (nonatomic,strong) NSString *pay_price;

@property (nonatomic,strong) NSString *hongbao_price;

@property (nonatomic,strong) NSString *total_price;

@property (nonatomic,strong) NSString *pay_type;//支付方式 1支付宝支付 2微信支付 3红币支付 4苹果支付;

@property (nonatomic,strong) NSString *pay_type_str;

@property (nonatomic,strong) NSString *pay_time;//付款时间

@property (nonatomic,strong) NSString *zucai_ai_set_id;//模型id 1.鲸猜大数据 2指数异动 3历史同赔 4泊松分布 5凯利指数 6.离散指数

@end

NS_ASSUME_NONNULL_END
