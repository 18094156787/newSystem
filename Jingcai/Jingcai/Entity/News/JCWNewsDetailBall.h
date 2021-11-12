//
//  JCWNewsDetailBall.h
//  Jingcai
//
//  Created by Rain on 2018/12/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWNewsDetailBall : JCWBaseBall

@property (strong, nonatomic) NSString *zucai_information_id;//文章id
@property (strong, nonatomic) NSString * id;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * name;
@property (strong, nonatomic) NSString * pageviews;
@property (strong, nonatomic) NSString * content;
@property (strong, nonatomic) NSString * created_at;

@property (strong, nonatomic) NSString *information;
@property (strong, nonatomic) NSString *desc;
@property (strong, nonatomic) NSString *url;
@property (strong, nonatomic) NSString *friend_url;
@property (assign, nonatomic) BOOL dz;//点赞
@property (assign, nonatomic) NSInteger original_type;//类型 1原创 2转载 3公众号
@property (strong, nonatomic) NSString *source;//转载来源或者公众号名称
@property (strong, nonatomic) NSString *dz_number;//点赞数
@property (assign, nonatomic) NSInteger is_top;//置顶
@property (strong, nonatomic) JCWExpertBall *gzv;
@property (assign, nonatomic) NSInteger is_good;//0未点赞 1 已点赞

@property (strong, nonatomic) JCShareModel *wechat_share;

#pragma mark//新版本接口

@property (strong, nonatomic) NSString *is_subscribe;

@property (strong, nonatomic) NSString *user_id;

@property (strong, nonatomic) NSString *user_img;

@property (strong, nonatomic) NSString *user_name;

@property (assign, nonatomic) NSInteger status;//8 是已下架

@property (assign, nonatomic) NSInteger is_reward_open;//打赏开启 0不开1开

@property (assign, nonatomic) NSInteger reward_num;//打赏人数

@end
NS_ASSUME_NONNULL_END
