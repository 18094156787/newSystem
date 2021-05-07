//
//  JCCaiyunBall.h
//  Jingcai
//
//  Created by Administrator on 2019/1/21.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCCaiyunBall : JCWBaseBall
@property (nonatomic, strong) NSString *id;
@property (nonatomic, assign) NSInteger prize;
@property (nonatomic, assign) NSInteger send;
@property (nonatomic, strong) NSString *goods_id;
@property (nonatomic, assign) BOOL hot;

#pragma mark - Extend
@property (nonatomic, assign) BOOL state_issel;
@property (nonatomic, readonly, assign) BOOL state_isshowsend;
@property (nonatomic, readonly, strong) NSString * tag_prize;
@property (nonatomic, readonly, strong) NSString * tag_send;
@property (nonatomic, readonly, strong) NSString * tag_total;



#pragma mark//新版本接口


@property (nonatomic,strong) NSString *price;

@property (nonatomic,strong) NSString *hongbi;

@property (nonatomic,strong) NSString *present;

@property (nonatomic,strong) NSString *apple_price_id;


@end
NS_ASSUME_NONNULL_END
