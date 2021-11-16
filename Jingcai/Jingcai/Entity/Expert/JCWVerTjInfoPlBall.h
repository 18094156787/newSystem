//
//  JCWVerTjInfoPlBall.h
//  Jingcai
//
//  Created by Administrator on 2019/3/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCWVerTjInfoPlBall : JCWBaseBall
@property (nonatomic, strong) NSString * id;
@property (nonatomic, strong) NSString * match_num;
@property (nonatomic, strong) NSString * company_id;
@property (nonatomic, strong) NSString * company_name;
@property (nonatomic, strong) NSString * win;
@property (nonatomic, strong) NSString * lose;
@property (nonatomic, strong) NSString * equal;
@property (nonatomic, strong) NSString * rq;
@property (nonatomic, strong) NSString * rq_num;
@property (nonatomic, strong) NSString * lrq;
@property (nonatomic, strong) NSString * status;
@property (nonatomic, strong) NSDate * created_at;
@property (nonatomic, strong) NSDate * updated_at;

#pragma mark -
@property (nonatomic, readonly, strong) NSString * title_win;
@property (nonatomic, readonly, strong) NSString * title_equal;
@property (nonatomic, readonly, strong) NSString * title_lose;
@end
NS_ASSUME_NONNULL_END
