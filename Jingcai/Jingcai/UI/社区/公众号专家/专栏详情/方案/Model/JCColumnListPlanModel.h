//
//  JCColumnListPlanModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCWTjInfoBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCColumnListPlanModel : JCWBaseBall

@property (nonatomic,copy)NSString *id;

@property (nonatomic,copy)NSString *period;

@property (nonatomic,copy)NSString *status;//状态,0未购买,1预售即将开始,2预售中(已购买),3更新中,4周期结束，5预售中未购买

@property (nonatomic,strong)NSArray <JCWTjInfoBall *>*plans;

@end

NS_ASSUME_NONNULL_END
