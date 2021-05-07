//
//  JCHongbangOrderDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangOrderDetailModel : JCWBaseBall

@property (nonatomic,strong) NSString *style_desc;

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *order_id;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *user_count;

@property (nonatomic,strong) NSString *style;//1是单场 2是包月

@property (nonatomic,strong) NSString *match_id;

@property (nonatomic,strong) NSString *distance_day;

@property (nonatomic,strong) NSString *release_time;

@property (nonatomic,strong) NSString *old_total;

@property (nonatomic,strong) NSString *hongbao_total;

@property (nonatomic,strong) NSString *wl;

@property (nonatomic,strong) NSString *all_wl;

@property (nonatomic,strong) NSString *pay_type;//1支付宝支付 2微信支付 3红币支付 4苹果支付 55红包支付(红包或免单券全额抵扣,coupon_id==0为红包,否则为免单)

@property (nonatomic,assign) NSInteger paid;//支付状态,0未支付,1已支付,2已退款;

@property (nonatomic,strong) NSString *refund_reason_time;//退款时间 如果有

@property (nonatomic,strong) NSString *pay_type_str;

@property (nonatomic,strong) NSString *coupon_id;

@property (nonatomic,strong) NSString *order_time;

@property (nonatomic,strong) NSString *out_info;

@property (nonatomic,strong) NSArray <JCDianPingMatchBall *>*match_data;

@property (nonatomic,strong) NSString *get_pay_time;

@property (nonatomic,strong) NSString *pay_price;

@property (nonatomic,strong) NSString *commission;//提成金额

@property (nonatomic,strong) NSString *hongbao_price;

@property (nonatomic,strong) NSString *total_price;

@end

NS_ASSUME_NONNULL_END
