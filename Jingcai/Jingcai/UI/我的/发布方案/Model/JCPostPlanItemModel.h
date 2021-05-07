//
//  JCPostPlanItemModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/31.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanItemModel : JCWBaseBall

@property (nonatomic,copy) NSString *price;

@property (nonatomic,copy) NSString *time;//推送时间

@property (nonatomic,assign) BOOL bztk;//是否选中结果

@property (nonatomic,assign) BOOL hongbao;//是否选中结果

@property (nonatomic,assign) BOOL push;//是否推送

@property (nonatomic,copy) NSString *bztk_string;

@property (nonatomic,assign) BOOL is_sf;//收费方式，标识区分

@property (nonatomic,assign) BOOL is_bztk;//不中退款，标识区分

@property (nonatomic,assign) BOOL is_hongbao;//红包抵扣，标识区分

@property (nonatomic,assign) BOOL is_push;//推送,标识区分

@end

NS_ASSUME_NONNULL_END
