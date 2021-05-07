//
//  JCCommunityRankModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommunityRankModel : JCWBaseBall

@property (strong,nonatomic) NSString *user_id;

@property (strong,nonatomic) NSString *user_name;

@property (strong,nonatomic) NSString *user_img;

@property (strong,nonatomic) NSString *rank_info;

@property (strong,nonatomic) NSString *return_rate;

@property (strong,nonatomic) NSString *subscribe_type;



#pragma mark//新版本接口

@property (strong,nonatomic) NSString *is_subscribe;

@property (strong,nonatomic) NSString *mingzhong_rate;//命中率

@property (strong,nonatomic) NSString *history_hong;//历史最高连红

@property (strong,nonatomic) NSString *hong;//连红

@property (strong,nonatomic) NSString *on_sale_count;//在售方案数

//盈利率相关

@property (strong,nonatomic) NSString *talent_id;

@property (strong,nonatomic) NSString *talent_name;

@property (strong,nonatomic) NSString *talent_img;

@property (strong,nonatomic) NSString *allrate;




@end

NS_ASSUME_NONNULL_END
