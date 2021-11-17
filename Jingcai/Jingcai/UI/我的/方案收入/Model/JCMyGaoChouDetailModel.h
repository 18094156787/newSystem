//
//  JCMyGaoChouDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

    @interface JCMyGaoChouDetailModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *tuijian_count;//收费推荐数

@property (nonatomic,strong) NSString *sf_count;//收费成功数

@property (nonatomic,strong) NSString *ds_count;//打赏数量


@property (nonatomic,strong) NSString *base_pay;//基础工资

@property (nonatomic,strong) NSString *basic_remuneration;//基础稿酬

@property (nonatomic,strong) NSString *ios;// //ios收入

@property (nonatomic,strong) NSString *android;//安卓收入

@property (nonatomic,strong) NSString *h5;//h5收入

@property (nonatomic,strong) NSString *pc;//pc

@property (nonatomic,strong) NSString *ds_money;//打赏金额

@property (nonatomic,strong) NSString *full_work_attendance;

@property (nonatomic,strong) NSString *remuneration_total;//  稿酬总计

@property (nonatomic,strong) NSString *tax_revenue;//税收

@property (nonatomic,strong) NSString *total;//可提现金额

@end

NS_ASSUME_NONNULL_END
