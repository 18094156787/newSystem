//
//  JCMyBuyOrderDataModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/28.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCDianPingMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyBuyOrderDataModel : JCWBaseBall

@property (nonatomic,strong) NSString *style_desc;

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *total_price;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *order_id;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *user_count;

@property (nonatomic,strong) NSString *style;//1是单场 2是包月

@property (nonatomic,strong) NSString *distance_day;

@property (nonatomic,strong) NSArray <JCDianPingMatchBall *>*match_data;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *is_monthly;//1是包月 2是单场

@property (nonatomic,strong) NSString *pay_price;

@property (nonatomic,strong) NSString *home_team_name;

@property (nonatomic,strong) NSString *away_team_name;

@property (nonatomic,strong) NSString *home_team_logo;

@property (nonatomic,strong) NSString *away_team_logo;

@property (nonatomic,strong) NSString *round_num;

//0:比赛异常1:未开赛2:上半场3:中场4:下半场5:加时赛6:加时赛(弃用)7:点球决战8:完场9:推迟10:中断11:腰斩12:取消13:待定

@property (nonatomic,strong) NSString *status_id;

@property (nonatomic,strong) NSString *match_id;

@property (nonatomic,strong) NSString *competition_name;

@property (nonatomic,strong) NSString *match_time;

@property (nonatomic,strong) NSString *home_scores;

@property (nonatomic,strong) NSString *away_scores;

@property (nonatomic,strong) NSString *status_cn;

@property (nonatomic,strong) NSString *zucai_order_id;//订单id

@property (nonatomic,strong) NSString *zucai_order_order_id;//订单号

@property (nonatomic,assign) NSInteger zucai_order_order_refund_status;//退款状态0未退款 1申请中 2已退款 3拒绝退款 4是已退款

@property (nonatomic,strong) NSString *zucai_order_refund_status_text;

@property (nonatomic,strong) NSString *wl;
@end

NS_ASSUME_NONNULL_END
