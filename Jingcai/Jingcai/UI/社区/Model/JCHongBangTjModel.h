//
//  JCHongBangTjModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/25.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangTjModel : JCWBaseBall

@property (strong, nonatomic) NSString * id;//方案ID

@property (strong, nonatomic) NSString *tuijian_id;

@property (strong, nonatomic) NSString * user_id;//专家ID

@property (strong, nonatomic) NSString * classfly;//0，1 竞足 2 让球 3进球数

@property (strong, nonatomic) NSString * title;

@property (strong, nonatomic) NSString * sf;//收费方式 0 代表免费 金额 （红币 单位：分

@property (strong, nonatomic) NSString * refund;//不中返还 1是 0否

@property (strong, nonatomic) NSString * hb;//是否允许抵扣 红包抵扣 1是 0否

@property (strong, nonatomic) NSString * citation;//是否允许抵扣 红包抵扣 1是 0否

@property (assign, nonatomic) NSInteger  wl;//1红2 黑 5 走水 6 取消 7延迟

@property (strong, nonatomic) NSString * time;//比赛开始时间

@property (strong, nonatomic) NSString * click;

@property (strong, nonatomic) NSString * fx_number;

@property (strong, nonatomic) NSString * dz_number;

@property (strong, nonatomic) NSString * yll;//盈利率

@property (strong, nonatomic) NSString * column_id;

@property (strong, nonatomic) NSString * classfly_desc;//类型名称

@property (strong, nonatomic) NSString * match_id;//比赛ID

@property (strong, nonatomic) NSString * match_tuijian_id;//方案ID

@property (strong, nonatomic) NSString * match_event_id;//比赛赛事ID

@property (strong, nonatomic) NSString * match_week_number;//周几 序号 例如 周四4306

@property (strong, nonatomic) NSString * user_name;//专家名称

@property (strong, nonatomic) NSString * user_img;

@property (strong, nonatomic) NSString * mingzhong_rate;//近10场的命中率

@property (strong, nonatomic) NSString * hong;//连红

@property (assign, nonatomic) NSInteger is_ai;//是否有鲸猜大数据 >0是有

@property (assign, nonatomic) NSInteger isbuy;//是否购买了 1是 2否

@property (assign, nonatomic) NSInteger is_free;//是否免费 1付费方案 0免费方案

@property (assign, nonatomic) NSInteger is_pay;//是否需要购买 1已购买 0未购买

@property (strong, nonatomic) NSString *home_team_name;

@property (strong, nonatomic) NSString *away_team_name;

@property (strong, nonatomic) NSString *created_at;

@property (strong, nonatomic) NSString * zucai_order_id;

@property (assign, nonatomic) NSInteger zucai_order_refund_status;//退款状态(0未退款 1申请退款 2退款中 3拒绝退款 4已退款)

@property (strong, nonatomic) NSString *zucai_order_refund_status_text;

@property (strong, nonatomic) NSString *zucai_order_pay_price;//实际支付金额,单位元

@property (strong, nonatomic) NSArray *image;

//@property (strong, nonatomic) NSString *match_long_time;
//
//@property (strong, nonatomic) NSString *match_future_time;
//
//@property (strong, nonatomic) NSString *match_time;

#pragma mark //需要改,假字段

@property (strong, nonatomic) NSArray <JCWTjInfoBall *>*zucai_tuijian_match;

@property (strong, nonatomic) NSString *zhong;//购买状态

@property (strong, nonatomic) NSString *percent_desc;

@property (assign, nonatomic) NSInteger status;//1 已审核-上架 2 待审核 3 已拒绝 4 已退回 7 已过期 6 已审核-下架

@property (strong, nonatomic) NSString *status_type;

@property (strong, nonatomic) NSString *error;

@property (assign, nonatomic) NSInteger error_count;


@property (assign, nonatomic) NSInteger update_count;

@property (strong, nonatomic) NSString *talent_rate;//盈利率



@end

NS_ASSUME_NONNULL_END
