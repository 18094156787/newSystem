//
//  JCColumnDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCPresellColumnModel.h"
#import "JCNewestColumnModel.h"
#import "JCLastColumnModel.h"
#import "JCColumnHitRateModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailModel : JCWBaseBall

@property (nonatomic,copy)NSString *id;//专栏id或者订单id

@property (nonatomic,copy)NSString *title;//专栏名称

@property (nonatomic,copy)NSString *image;//专栏图片

@property (nonatomic,copy)NSString *author_id;

@property (nonatomic,copy)NSString *synopsis;//专栏简介

@property (nonatomic,copy)NSString *period;//期数

@property (nonatomic,copy)NSString *ordering_information;//订购须知

@property (nonatomic,copy)NSString *subscribe;//订阅人数

@property (nonatomic,copy)NSString *user_name;

@property (nonatomic,copy)NSString *user_img;

@property (nonatomic,copy)NSString *time;

@property (nonatomic,copy)NSString *is_subscribe;//用户是否关注,0未关注,1关注

@property (nonatomic,strong) JCPresellColumnModel *presell_period;//预售专栏

@property (nonatomic,strong) JCLastColumnModel *last_period;//上一期专栏

@property (nonatomic,strong) JCNewestColumnModel *newest_period;//最新一期购买专栏

@property (nonatomic,strong) NSArray <JCColumnHitRateModel *>*last_hit_rate;

#pragma mark//订单相关

@property (nonatomic,copy)NSString *unique_id;//周期id

@property (nonatomic,copy)NSString *reality_price;//订单金额

@property (nonatomic,copy)NSString *pay_price;//实付金额

@property (nonatomic,copy)NSString *total_price;//原价

@property (nonatomic,copy)NSString *special_column_id;//专栏id

#pragma mark//社区专栏和更多专栏

@property (nonatomic,copy)NSString *image_url;

@property (nonatomic,copy)NSString *zctj_special_column_id;//专栏id

@property (nonatomic,copy)NSString *zctj_column_period_id;//专栏周期id

@property (nonatomic,assign) NSInteger paid;//支付状态,1正常,2已退款 3.退款中

@end

NS_ASSUME_NONNULL_END
