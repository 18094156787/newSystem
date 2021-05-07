//
//  JCMyZhanJiModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMyZhanJiModel : JCWBaseBall

@property (nonatomic,strong) NSString *start_time;

@property (nonatomic,strong) NSString *end_time;

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *lianhong;

@property (nonatomic,strong) NSString *rank_id;

@property (nonatomic,strong) NSString *mingzhong;

@property (nonatomic,strong) NSString *use_type;//已领取" 是否领取

@property (nonatomic,strong) NSString *code;//验证码

@property (nonatomic,strong) NSString *wx;//验证码

@property (nonatomic,strong) NSString *use;//0未领取1是已领取

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *rand_id;


@end

NS_ASSUME_NONNULL_END
