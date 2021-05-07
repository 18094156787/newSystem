//
//  JCWMyHongbaoBall.h
//  Jingcai
//
//  Created by Rain on 2018/11/20.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWMyHongbaoBall : JCWBaseBall

@property (assign, nonatomic) NSInteger prize;

//免单券字段
//
@property (strong, nonatomic) NSString *expiry_time;//过期时间

@property (strong, nonatomic) NSString *is_mf;//默认0,1是有免单券

@property (strong, nonatomic) NSString *is_ff;//已付费

#pragma mark 新版本接口

@property (strong, nonatomic) NSString * id;

@property (strong, nonatomic) NSString *time;//领取时间

@property (assign, nonatomic) NSInteger total;

@property (strong, nonatomic) NSString *type;

@property (strong, nonatomic) NSString *start_time;

@property (strong, nonatomic) NSString *end_time;

@property (strong, nonatomic) NSString *scope;

@property (strong, nonatomic) NSString *name;



@end

NS_ASSUME_NONNULL_END
