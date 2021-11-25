//
//  JCWSlideBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCShareModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCWSlideBall : JCWBaseBall
@property (strong, nonatomic) NSString * status;
@property (strong, nonatomic) NSString * sort;
@property (strong, nonatomic) NSString * id;//在活动广场这边,是活动ID
@property (strong, nonatomic) NSString * app_url;
@property (strong, nonatomic) NSString *app_weburl;
@property (strong, nonatomic) NSString * title;
@property (strong, nonatomic) NSString * image;
@property (strong, nonatomic) NSDate * created_at;
@property (strong, nonatomic) NSString * app_show;
@property (strong, nonatomic) NSDate * updated_at;
@property (strong, nonatomic) NSString * url;
@property (strong, nonatomic) NSString *start_color;
@property (strong, nonatomic) NSString *end_color;
#pragma mark//活动广场

@property (strong, nonatomic) NSString *activity_id;//活动ID

@property (strong, nonatomic) NSString *square_image;//活动广场图ID

@property (strong, nonatomic) NSString *type;//活动类型 1跳转已有的活动 2福利活动 3充值活动 4竞猜活动 5.慈善活动 6.竞猜活动_胜平负 7.竞猜活动_胜平负多场

@property (strong, nonatomic) NSString *img_url;//图片地址

@property (strong, nonatomic) NSString *start_time;

@property (strong, nonatomic) NSString *end_time;

@property (strong, nonatomic) NSString *receive_cycle;//奖励领取周期 1每天 2每周 3每月 4整个活动周期

@property (strong, nonatomic) NSString *is_participate;//是否参加了 1是 2否

@property (strong, nonatomic) NSString *active_state;//活动状态 1未开始 2进行中 3已结束

@property (strong, nonatomic) NSString *desc;

@property (strong, nonatomic) JCShareModel *wechat_share;
@end

NS_ASSUME_NONNULL_END
