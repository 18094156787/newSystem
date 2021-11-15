//
//  JCBigDataMonthProduceModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBigDataMonthProduceModel : JCWBaseBall

@property (nonatomic,strong) NSString *total;//现在价格

@property (nonatomic,strong) NSString *old_total;//原来价格

@property (nonatomic,strong) NSString *day;//天数

@property (nonatomic,strong) NSString *user_count;//购买用户数

@property (nonatomic,strong) NSString *is_buy;//2未购买 1已购买

@property (nonatomic,strong) NSString *end_date;//如果已购买 结束时间

@property (nonatomic,strong) NSString *distance_day;//如果已购买 还差几天结束

@property (nonatomic,strong) NSArray *user_img;

@property (nonatomic,strong) NSString *release_time;//发布时间

@property (nonatomic,strong) NSString *click;//浏览人数

#pragma makr 扩展
@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *month_total;

@property (nonatomic,strong) NSString *match_total;

@property (assign, nonatomic) NSInteger hb;//0是不能使用红包 1是可以使用红包

//

@property (nonatomic,strong) NSString *home_name;

@property (nonatomic,strong) NSString *away_name;

@property (nonatomic,strong) NSString *homo_logo;

@property (nonatomic,strong) NSString *away_logo;

@property (nonatomic,strong) NSString *match_time;

@property (nonatomic,strong) NSString *home_score;

@property (nonatomic,strong) NSString *away_score;

@property (nonatomic,strong) NSString *ai_op_win;

@property (nonatomic,strong) NSString *ai_op_draw;

@property (nonatomic,strong) NSString *ai_op_lose;

@property (nonatomic,strong) NSString *ai_dx_win;

@property (nonatomic,strong) NSString *ai_dx_lose;

@property (nonatomic,strong) NSString *ai_yp_win;

@property (nonatomic,strong) NSString *ai_yp_lose;

@property (nonatomic,strong) NSString *jqs;

@property (nonatomic,strong) NSString *rq;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *one_total;

@property (nonatomic,strong) NSString *home_team_name;

@property (nonatomic,strong) NSString *away_team_name;

@property (nonatomic,strong) NSString *created_at;

@property (nonatomic,strong) NSString *home_team_logo;

@property (nonatomic,strong) NSString *away_team_logo;


@end

NS_ASSUME_NONNULL_END
