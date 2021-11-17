//
//  JCWTjInfoBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/6.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWPayInfoBall.h"
#import "JCWVerTjInfoMatchBall.h"
#import "JCGZHMatchsInfoModel.h"
#import "JCShareModel.h"
#import "JCPlaneDetailQRModel.h"
#import "JCPostImageModel.h"
#import "JCColumnInfoModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface JCWTjInfoBall : JCWBaseBall

@property (nonatomic, strong) NSString *other_id;

@property (nonatomic, strong) NSString * user_desc;
@property (nonatomic, strong) NSString * hb;
@property (nonatomic, strong) NSString * matchtime;
@property (nonatomic, strong) NSString * subscribe;
@property (nonatomic, strong) NSString * zyll;
@property (nonatomic, strong) NSString * wl_desc;
@property (nonatomic, strong) NSString * hong;
@property (nonatomic, strong) NSString * lianhong;
@property (nonatomic, strong) NSString * ten_tj_all;
@property (nonatomic, strong) NSString * ten_tj_win;
@property (nonatomic, strong) NSString * type_desc;



@property (nonatomic, strong) NSString *out_info;
//@property (nonatomic, strong) NSString * status;




@property (strong, nonatomic) NSString * name;



@property (strong, nonatomic) NSString * user_zhong;
@property (assign, nonatomic) NSInteger is_hongbao;//  0 不能使用 1 可以使用


@property (assign, nonatomic) NSInteger sf_type;//sf_type 1收费 2免费
#pragma mark - 扩展



@property (strong, nonatomic) NSString *zhong_desc;
@property (strong, nonatomic) NSString *zhong_color;
@property (strong, nonatomic) NSString *caiyun;//

@property (strong, nonatomic) NSString *refund_type;//  退款类型   0未退款   1不中返还退款  2系统退款  3申请退款

@property (strong, nonatomic) NSString *dz;//0是未点赞,1是已点赞
@property (strong, nonatomic) NSString *share_title;
@property (strong, nonatomic) NSString *share_desc;
@property (strong, nonatomic) NSString *share_url;
@property (strong, nonatomic) NSString *friend_url;
@property (strong, nonatomic) NSString *fabu_time;//发布时间
@property (strong, nonatomic) NSString *str_time;//截止时间


@property (strong, nonatomic) NSString *timestamp;

@property (strong, nonatomic) NSString *highest;
@property (strong, nonatomic) NSArray <JCWVerTjInfoMatchBall *>*match;

@property (strong, nonatomic) JCGZHMatchsInfoModel*matchs;

- (JCWPayInfoBall *)parseToPayInfoBall;
- (BOOL)isFree;//是否为免费
- (BOOL)isShowPrice;//是否显示价格
- (BOOL)isWin;//是否中奖
- (BOOL)isLose;//是否未中

#pragma mark //新版本接口

/*
 公众号相关
 **/
@property (nonatomic, strong) NSString *zucai_order_id;//订单id

@property (nonatomic, strong) NSString *zucai_order_unique_id;//公众号方案ID

@property (nonatomic, strong) NSString *zucai_order_scene;//购买场景2购买专家方案zctj_newtuijian 3购买大数据订阅zucai_ai_bigdata 4购买红榜方案zucai_tuijian 5购买ai方案zucai_tuijian

@property (nonatomic, strong) NSString *zucai_order_refund_order_id;//订单编号

@property (nonatomic, strong) NSString *zucai_order_refund_status;//退款状态(0未退款 1申请退款 2退款中 3拒绝退款 4已退款)

@property (nonatomic, strong) NSString *zucai_order_refund_status_text;//退款状态描述

@property (nonatomic, strong) NSString *zucai_order_pay_price;//实际支付金额,单位元

@property (nonatomic, strong) NSString *zctj_newtuijian_title;//标题

@property (nonatomic, strong) NSString *zctj_newtuijian_refund;//不中返还 1是 0 否

@property (nonatomic, strong) NSString *zctj_newtuijian_user_id;//专家id

@property (nonatomic, strong) NSString *zctj_newtuijian_end_time;//购买停止时间

@property (nonatomic, assign) NSInteger zctj_newtuijian_is_bd;//是否补单 1是 0 否

@property (nonatomic, strong) NSString *zctj_newtuijian_zhong;//开奖结果说明（文字说明）

@property (nonatomic, strong) NSString *zctj_user_info_zhong;//专家标签

@property (nonatomic, strong) NSString *zucai_user_user_img;//专家头像

@property (nonatomic, strong) NSString *zucai_user_user_name;//专家名称







@property (nonatomic, strong) NSString * id;

@property (nonatomic, strong) NSString *zctj_newtuijian_id;

@property (strong, nonatomic) NSString *tuijian_id;

@property (strong, nonatomic) NSString *event_id;

@property (strong, nonatomic) NSString *match_num;

@property (strong, nonatomic) NSString *match_id;

@property (assign, nonatomic) NSInteger wl;// 0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消

@property (strong, nonatomic) NSString *status;// 1 正常 8下架

@property (strong, nonatomic) NSString *week_number;//周几 序号 例如 周四4306

@property (strong, nonatomic) NSString *classfly;//  0 1 竞足 2 让球 3进球数

@property (strong, nonatomic) NSString *competition_id;//赛事ID

@property (strong, nonatomic) NSString *home_team_id;

@property (strong, nonatomic) NSString *away_team_id;

@property (strong, nonatomic) NSString *match_time;

@property (strong, nonatomic) NSString *home_scores;

@property (strong, nonatomic) NSString *away_scores;

@property (strong, nonatomic) NSString *competition_name;

@property (strong, nonatomic) NSString *home_team_name;

@property (strong, nonatomic) NSString *away_team_name;

@property (nonatomic, strong) NSString * user_id;

@property (assign, nonatomic) NSInteger is_bd;// 是否补单 1是 0否

@property (nonatomic, strong) NSString * title;

@property (strong, nonatomic) NSString *content;//内容

@property (strong, nonatomic) NSString *analyse;//分析

@property (strong, nonatomic) NSString *style;//栏目id 跟zctj_column关联

@property (strong, nonatomic) NSArray <JCPostImageModel *>*image;

@property (strong, nonatomic) NSString * sf;

@property (strong, nonatomic) NSString *click;//点击数

@property (strong, nonatomic) NSString *fx_number;//分享次数

@property (strong, nonatomic) NSString *dz_number;//点赞次数

@property (strong, nonatomic) NSString * yll;//盈利率

@property (nonatomic, strong) NSString * time;//发布时间

@property (nonatomic, strong) NSString * created_at;//发布时间

@property (strong, nonatomic) NSString * end_time;//截止时间

@property (strong, nonatomic) NSString * now_time;//目前时间

@property (strong, nonatomic) NSString * refund;//0正常 1不中返还 2不中补单

@property (strong, nonatomic) NSString * pre_sale;//(是否是预售 1是  0否)

@property (nonatomic, strong) NSString * subtitle;//副标题

@property (nonatomic, strong) NSString *column_id;//1足球 2篮球 3电竞

@property (nonatomic, strong) NSString *user_name;//专家名称

@property (nonatomic, strong) NSString *user_img;//专家图片

@property (strong, nonatomic) NSString *zhong;//或者公众号专家标签

@property (strong, nonatomic) NSString *result;//开奖结果说明文字说明

@property (assign, nonatomic) NSInteger is_free;//是否免费 1付费方案 0免费方案

@property (strong, nonatomic) NSString *bill_id;// 大于0是补单

@property (strong, nonatomic) NSString *fensi;

@property (strong, nonatomic) NSString *plan_num;

@property (strong, nonatomic) NSString *is_subscribe;

@property (strong, nonatomic) NSString *pay_price;

@property (strong, nonatomic) NSString *order_id;

@property (strong, nonatomic) NSString *order_num;

@property (strong, nonatomic) NSString *refund_status;

@property (strong, nonatomic) NSString *refund_price;

@property (strong, nonatomic) NSString *end_date;

@property (strong, nonatomic) JCShareModel *wechat_share;

@property (strong, nonatomic) NSString *qr_code;


//1单场 2三场 3多场
//在公众号里,1付费方案 0免费方案
@property (assign, nonatomic) NSInteger type;
//用户是否能查看内容 0不能查看 1能查看
@property (strong, nonatomic) NSString *is_look;
//0未购买 1已购买
@property (assign, nonatomic) NSInteger is_pay; 

@property (assign, nonatomic) NSInteger is_use;//是否可使用红包 现在全为1 可以使用1

@property (assign, nonatomic) NSInteger is_good;

@property (assign, nonatomic) NSInteger is_end;//1是已截止 0是未截止

@property (assign, nonatomic) NSInteger is_column;//是否专栏,1是2否

@property (strong, nonatomic) JCPlaneDetailQRModel *qr_code_info;

@property (strong, nonatomic) JCColumnInfoModel *column_info;//关联的专栏

@property (assign, nonatomic) NSInteger is_reward_open;//打赏开启 0不开1开

@property (assign, nonatomic) NSInteger reward_num;//打赏人数

@property (strong, nonatomic) NSString *total_price;


@end
NS_ASSUME_NONNULL_END
