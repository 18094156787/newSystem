//
//  JCLiveDistributionModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN
@class JCLiveDistributionInfoModel;
@interface JCLiveDistributionModel : JCWBaseBall

@property (nonatomic,strong) JCLiveDistributionInfoModel *home;

@property (nonatomic,strong) JCLiveDistributionInfoModel *away;


@end

@interface JCLiveDistributionInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *attack;//进攻

@property (nonatomic,strong) NSString *danger_attack;//危险进攻

@property (nonatomic,strong) NSString *possession;//控球率

@property (nonatomic,strong) NSString *shoot_center;//射正

@property (nonatomic,strong) NSString *shoot_way;//射偏

@property (nonatomic,strong) NSString *red;//红牌

@property (nonatomic,strong) NSString *yellow;//黄牌

@property (nonatomic,strong) NSString *corner;//角球

@end


NS_ASSUME_NONNULL_END
