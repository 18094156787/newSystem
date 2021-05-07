//
//  JNMatchZS_PLInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_PLInfoModel : JCWBaseBall

@property (strong, nonatomic) NSString * win;

@property (strong, nonatomic) NSString * lose;

@property (strong, nonatomic) NSString * equal;

@property (strong, nonatomic) NSString * start_equal;

@property (strong, nonatomic) NSString * start_win;

@property (strong, nonatomic) NSString * start_lose;

@property (strong, nonatomic) NSString * win_color;

@property (strong, nonatomic) NSString * lose_color;

@property (strong, nonatomic) NSString * equal_color;

@property (strong, nonatomic) NSString * time;

#pragma mark //新接口

@property (strong, nonatomic) NSString *id;//赔率ID

@property (strong, nonatomic) NSString *home_winner;//主胜/大球 赔率

@property (strong, nonatomic) NSString *draw;//和局/盘口 赔率

@property (strong, nonatomic) NSString *away_winner;//客胜/小球 赔率

@property (strong, nonatomic) NSString *is_begin_odds;//是否初始盘：1是，0否

@property (strong, nonatomic) NSString *company_id;//公司ID

@property (strong, nonatomic) NSString *status;//是否封盘1-封盘,0-未封盘

@property (strong, nonatomic) NSString *match_time;//是否封盘1-封盘,0-未封盘

@property (strong, nonatomic) NSString *update_time;

@property (strong, nonatomic) NSString *company_name;//公司名称



@end

NS_ASSUME_NONNULL_END
