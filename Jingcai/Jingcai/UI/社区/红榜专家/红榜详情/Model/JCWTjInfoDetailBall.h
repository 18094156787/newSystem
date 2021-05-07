//
//  JCWTjInfoDetailBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCPostImageModel.h"
#import "JCWExpertBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCWTjInfoDetailBall : JCWBaseBall

@property (strong, nonatomic) NSString * yll;
@property (strong, nonatomic) NSString * top;

@property (strong, nonatomic) NSString * deal_total;//实际支付金额
@property (strong, nonatomic) NSString * refund_desc;//退款文字描述


@property (strong, nonatomic) NSString * time;
@property (assign, nonatomic) NSInteger type;
@property (nonatomic, strong) NSString * subtitle;//副标题

@property (assign, nonatomic) NSInteger order;
@property (assign, nonatomic) NSInteger plus;
@property (assign, nonatomic) NSInteger hb;//0是不能使用红包 1是可以使用红包
@property (assign, nonatomic) NSInteger wl;// 0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消

@property (strong, nonatomic) NSString * out_info;





@property (assign, readonly, nonatomic) BOOL isResultWin;//红

@property (assign, readonly, nonatomic) BOOL isResultLose;//黑

@property (assign, readonly, nonatomic) BOOL isResultWater;//走水

@property (assign, readonly, nonatomic) BOOL isYanqi;//延期

@property (assign, readonly, nonatomic) BOOL isQuXiao;//取消


@property (strong, nonatomic) NSArray <JCWExpertBall *>*user;

@property (strong, nonatomic) NSString *dz;//0是未点赞,1是已点赞

#pragma mark 扩展

@property (strong, nonatomic) NSString *str_time;

@property (strong, nonatomic) NSString *timestamp;//剩余截止时间

#pragma mark 新版本接口

@property (strong, nonatomic) NSString * id;

@property (strong, nonatomic) NSString *user_id;

@property (strong, nonatomic) NSString * title;

@property (strong, nonatomic) NSString *citation;//引文

@property (strong, nonatomic) NSString * content;

@property (strong, nonatomic) NSString *click;

@property (strong, nonatomic) NSString * sf;//现价

@property (strong, nonatomic) NSString * old_sf;//原价

@property (strong, nonatomic) NSString *is_use;//是否允许抵扣 红包抵扣 1是 0否

@property (strong, nonatomic) NSString *refund;

@property (strong, nonatomic) NSString *fx_number;//分享次数

@property (strong, nonatomic) NSString *dz_number;//点赞次数

@property (strong, nonatomic) NSString *all_wl;

@property (strong, nonatomic) NSString * created_at;

@property (assign, nonatomic) NSInteger classfly;// 0,1是竞彩 2是让球 3是进球数

@property (strong, nonatomic) NSArray <JCPostImageModel *>*image;

@property (assign, nonatomic) NSInteger status;

@property (strong, nonatomic) NSString *user_img;

@property (strong, nonatomic) NSString *user_name;

@property (strong, nonatomic) NSString *fensi;

@property (strong, nonatomic) NSString *classfly_desc;//标签类型

@property (strong, nonatomic) NSString *is_subscribe;

@property (strong, nonatomic) NSString *is_look;//查看 0不能查看 1能查看

@property (strong, nonatomic) NSString *is_free;//0免费 1付费

@property (strong, nonatomic) NSString *is_pay;//0未购买 1已购买

@property (strong, nonatomic) NSString *is_end;//0未截止购买 1截止购买

@property (strong, nonatomic) NSString *is_login;//0未登录 1已登录

@property (strong, nonatomic) NSString *is_good;//0未点赞 1 已点赞

@property (strong, nonatomic) NSString *order_id;

@property (strong, nonatomic) NSString *pay_price;

@property (strong, nonatomic) NSString *refund_status;

@property (strong, nonatomic) NSString *refund_price;

@property (strong, nonatomic) NSString *order_num;

@property (assign, nonatomic) BOOL is_ai;//AI

@property (nonatomic, assign) double now_time;

@property (nonatomic, assign) double end_time;

@property (strong, nonatomic) NSString *plan_num;//购买人数

@property (strong, nonatomic) NSString *refund_type;//  退款类型   0未退款   1不中返还退款  2系统退款  3申请退款

@property (strong, nonatomic) NSString *is_self;//是否是自己发布的,如果是自己发布的,不显示实付


@end

NS_ASSUME_NONNULL_END
