//
//  JCInviteConfigGaoChouModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCInviteConfigGaoChouModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *base_pay;//基础工资

@property (nonatomic,strong) NSString *basic_remuneration;//基础稿酬

@property (nonatomic,strong) NSString *basic_remuneration_page;//基础稿酬限制 篇/日

@property (nonatomic,strong) NSString *ios_commission;// //ios收入

@property (nonatomic,strong) NSString *android_commission;//安卓收入

@property (nonatomic,strong) NSString *h_commission;//h5收入

@property (nonatomic,strong) NSString *pc_commission;//PC提成

@property (nonatomic,strong) NSString *full_work_attendance;//满勤奖

@end

NS_ASSUME_NONNULL_END
