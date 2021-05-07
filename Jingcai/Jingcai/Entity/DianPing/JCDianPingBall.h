//
//  JCDianPingBall.h
//  Jingcai
//
//  Created by Administrator on 2019/2/19.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCDianPingMatchBall.h"
#import "JCWPayInfoBall.h"
#import "JCPostImageModel.h"
NS_ASSUME_NONNULL_BEGIN
@interface JCDianPingBall : JCWBaseBall
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * tuijian_id;
@property (strong, nonatomic) NSString * user_id;
@property (strong, nonatomic) NSString * user_name;
@property (strong, nonatomic) NSString * user_img;
@property (strong, nonatomic) NSString * user_desc;
@property (strong, nonatomic) NSString * matchtime;
@property (strong, nonatomic) NSString * wl_desc;
@property (strong, nonatomic) NSString * deal_price;
@property (strong, nonatomic) NSString * type_desc;
@property (strong, nonatomic) NSString * time;
@property (strong, nonatomic) NSString * created_at;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * history_hong;
@property (strong, nonatomic) NSString * lianhong;
@property (strong, nonatomic) NSString * near;
@property (strong, nonatomic) NSString * percent;
@property (strong, nonatomic) NSString * percent_desc;
@property (strong, nonatomic) NSString *out_info;
@property (strong, nonatomic) NSArray * match_data;
@property (strong, nonatomic) NSString * hb;
@property (strong, nonatomic) NSString * click;
@property (assign, nonatomic) NSInteger error_count;//已退回次数
@property (assign, nonatomic) NSInteger wl;// 0未开始 1红 2黑 3赢半 4输半 5走水 6延迟 7取消
//@property (assign, nonatomic) NSInteger sf;

@property (assign, nonatomic) NSInteger sf;

@property (strong, nonatomic) NSArray *image;

@property (strong, nonatomic) NSString *sign;//标签
@property (assign, nonatomic) BOOL isbuy;//是否已购买
@property (strong, nonatomic) NSString *fx_number;//分享数
@property (strong, nonatomic) NSString *dz_number;//点赞数
@property (strong, nonatomic) NSString *classfly_desc;


@property (strong, nonatomic) NSString *classfly;//1是精彩 2是让球 3是进球数

#pragma mark 审核状相关
//0=>"待审核",1=>"已审核",2=>"待审核",3=>'已拒绝',4=>'审核失败',7=>'已过期',6=>'已审核'
@property (assign, nonatomic) NSInteger status;

@property (strong, nonatomic) NSString *error;



#pragma mark - 扩展
@property (assign, readonly, nonatomic) BOOL has_near;
@property (assign, readonly, nonatomic) BOOL has_lianhong;
@property (assign, readonly, nonatomic) BOOL has_percent;
@property (assign, readonly, nonatomic) BOOL has_historyhong;
@property (strong, nonatomic) NSString *fensi;
@property (strong, nonatomic) NSString *hong;
@property (strong, nonatomic) NSString *zhong;
@property (strong, nonatomic) NSString *zhong_color;
@property (strong, nonatomic) NSString *yll;
@property (strong, nonatomic) NSString *type;// 类型 1红榜 2大咖
@property (strong, nonatomic) NSString *status_type;//
- (BOOL)isShowPrice;
- (BOOL)isShowHong;
- (BOOL)isShowHei;
- (BOOL)isShowZou;
- (BOOL)isMatchEnd;
- (BOOL)isFree;
- (JCWPayInfoBall *)parseToPayInfoBall;
@end
NS_ASSUME_NONNULL_END
