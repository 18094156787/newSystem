//
//  JCWithdrawalModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWithdrawalModel : JCWBaseBall

@property (nonatomic,strong) NSString *total;

@property (nonatomic,strong) NSString *time;

@property (nonatomic,strong) NSString *status;//状态值//1 审核中 2 已核算(已确认)3 已提现  4提现失败 5 拒绝提现 6 提现失效

@property (nonatomic,strong) NSString *title;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *created_at;

@property (nonatomic,strong) NSString *audit_status;//提现情况 前端直接展示这个字段 审核中、已确认、已提现、提现失败、拒绝提现

@property (nonatomic,strong) NSString *audit_status_id;// 1.审核中、2.已确认、3.已提现、4.提现失败、5.拒绝提现

@end

NS_ASSUME_NONNULL_END
