//
//  JCWExpertBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWExpertBall : JCWBaseBall

@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * user_id;
@property (nonatomic, strong) NSString * user_img;
@property (nonatomic, strong) NSString * user_name;
@property (nonatomic, strong) NSString * zhong;
@property (nonatomic, strong) NSString * mz;
@property (nonatomic, strong) NSString *desc;
@property (nonatomic, strong) NSString *history_hong;//历史连红
@property (nonatomic, assign) NSInteger new_tuijian;
@property (nonatomic, assign) NSInteger tuijian_new;
@property (nonatomic, assign) NSInteger tuijian;
@property (nonatomic, assign) NSInteger count;
@property (nonatomic, copy) NSString *qr_code;
@property (nonatomic, assign) NSInteger qy;//1是签约
//推荐专家
@property (nonatomic, assign) NSInteger ten_tj_all;
@property (nonatomic, assign) NSInteger ten_tj_win;
//连红榜
@property (nonatomic, assign) NSInteger lianhong;
@property (nonatomic, assign) NSInteger hong;

//周盈利榜
@property (nonatomic, copy) NSString *zyll;
//命中榜
@property (nonatomic, strong) NSString *near;

#pragma mark - 扩展
@property (strong, readonly, nonatomic) NSString * checked_user_img;
@property (strong, readonly, nonatomic) NSString * tag_badge;
@property (strong, readonly, nonatomic) NSString * tag_tjuser;
@property (strong, readonly, nonatomic) NSString * tag_hong;
@property (strong, readonly, nonatomic) NSString * tag_zyll;
//cjw
@property (strong, nonatomic) UIImage *localImage;//本地图片
@property (strong, nonatomic) NSString * daihong;
@property (strong, nonatomic) NSString *subscribe;

@property (strong, nonatomic) NSString *fensi;//粉丝数
@property (strong, nonatomic) NSString *str_time;//截止时间
@property (strong, nonatomic) NSString *fx_number;//分享数
@property (strong, nonatomic) NSString *dz_number;//点赞数
@property (strong, nonatomic) NSString *sign;//专家标签,1~26,显示对应本地图标

@property (strong, nonatomic) NSString *rank_info;//标签

@property (strong, nonatomic) NSString *return_rate;//回报率

@property (strong, nonatomic) NSString *trend;//近10场命中

@property (strong, nonatomic) NSString *value;

//@property (strong, nonatomic) NSString *return_rate_color;


- (BOOL)isEmptyItem;//是否为空项目(用于显示更多)
@property (strong, readonly, nonatomic) NSString * rank_zyll;

@property (strong, nonatomic) NSString *information;

@property (strong, nonatomic) NSString *position;

#pragma mark //新版本接口

@property (strong, nonatomic) NSString *plan_num;//专家发布的方案数

@property (strong, nonatomic) NSString *is_subscribe;//是否关注

@property (strong, nonatomic) NSString *type;//类型 1红榜达人 2公众号专家

@property (strong, nonatomic) NSString *mingzhong_rate;

@property (nonatomic, assign) NSInteger late_hong;//近期连红

@property (nonatomic, strong) NSString *late_mingzhong_rate;// 近10场命中率

@property (nonatomic, strong) NSString *on_sale_count;//在售方案数量

@end
NS_ASSUME_NONNULL_END
