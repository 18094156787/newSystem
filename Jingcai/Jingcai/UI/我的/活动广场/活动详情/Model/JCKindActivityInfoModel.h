//
//  JCKindActivityInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKindActivityInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *my_score;//我的积分

@property (nonatomic,strong) NSString *is_sign;//今日是否签到 1已签到 0未签到

@property (nonatomic,strong) NSString *is_share;//今日是否分享 1已分享 0未分享

@property (nonatomic,strong) NSString *is_finish;//是否完成活动 1已完成 0未完成



@end

NS_ASSUME_NONNULL_END
