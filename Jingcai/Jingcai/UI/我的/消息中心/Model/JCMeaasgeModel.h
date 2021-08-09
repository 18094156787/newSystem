//
//  JCMeaasgeModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMeaasgeModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *user_id;// 用户id

@property (nonatomic,strong) NSString *other_id;// 关联id

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *content;

@property (nonatomic,strong) NSString *error;//错误信息

@property (nonatomic,strong) NSString *type;//类型 1审核资质 2红榜 3提现 5 我的红包页面 10达人资料修改审核 12活动通知--福利 13活动通知--充值 14活动通知--竞猜 15活动通知--慈善 16(小额)红包提现  17现金红包提现失败 18活动通知--竞猜胜平负

@property (nonatomic,strong) NSString *type_class;//0 审核通知 1升级通知 2禁用通知 3 恢复通知 4 稿酬提现确认通知 5 核算通知 6 核算拒绝通知 7 稿酬提现通知 8 稿酬提现失败通知 9邀请成功通知 10达人资料修改审核通知 12活动通知--福利 13活动通知--充值 14活动通知--竞猜 15活动通知--慈善 16(小额)红包提现成功 17(小额)红包提现失败

@property (nonatomic,strong) NSString *status;//状态 1.2不管 3不能跳转

@property (nonatomic,strong) NSString *classfly;//1是竞彩 2是让球 3进球数

@property (nonatomic,strong) NSString *created_at;

@property (nonatomic,strong) NSString *updated_at;

@end

NS_ASSUME_NONNULL_END
