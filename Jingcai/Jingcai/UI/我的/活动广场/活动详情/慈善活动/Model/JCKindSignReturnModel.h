//
//  JCKindSignReturnModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCActivityGoodsModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCKindSignReturnModel : JCWBaseBall

@property (nonatomic,strong) NSString *my_score;//我的积分

@property (nonatomic,strong) NSString *is_sign;//今日是否签到 1已签到 0未签到

@property (nonatomic,strong) NSString *is_share;//今日是否分享 1已分享 0未分享

@property (nonatomic,strong) NSString *is_finish;//是否完成活动 1已完成 0未完成

@property (nonatomic,strong) NSString *is_stage;//阶段活动是否弹窗 0未弹出 1弹出

@property (strong, nonatomic)  NSArray <JCActivityGoodsModel *> *stage_grade;//阶段奖励

@property (nonatomic,strong) NSString *is_popup;//海报是否弹出 1不弹 2弹出

@property (nonatomic,strong) NSString *popup_image;//活动海报图

@end

NS_ASSUME_NONNULL_END
