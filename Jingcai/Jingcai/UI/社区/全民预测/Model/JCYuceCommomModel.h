//
//  JCYuceCommomModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYuceCommomModel : JCWBaseBall

@property (nonatomic,copy) NSString *top;//是否签约 0未 1签约

@property (nonatomic,copy) NSString *rank_count;//上榜次数

@property (nonatomic,copy) NSString *user_img;

@property (nonatomic,copy) NSString *user_name;//用户名

@property (nonatomic,copy) NSString *user_id;//用户id

@property (nonatomic,copy) NSString *week_rank;//是否上榜

@property (nonatomic,copy) NSString *number;//剩余竞猜次数

#pragma mark//新版本接口

@property (nonatomic,copy) NSString *future_num;//剩余竞猜次数

@property (nonatomic,copy) NSString *yc_desc;//本周再中多少次

@property (nonatomic,copy) NSString *lianhong;

@property (nonatomic,copy) NSString *mingzhong;


@end

NS_ASSUME_NONNULL_END
