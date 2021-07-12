//
//  JCPostPlanMatchModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/31.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanMatchModel : JCWBaseBall



@property (nonatomic,copy) NSString *matchNum; //联赛id

@property (nonatomic,copy) NSString *matchInfo;

@property (nonatomic,copy) NSString *matchTime;

#pragma mark//新版本接口

@property (nonatomic,copy) NSString *match_id; //联赛id

@property (nonatomic,copy) NSString *matchName;//比赛名称:如周几001

@property (nonatomic,copy) NSString *homeName; //主队

@property (nonatomic,copy) NSString *awayName; //客队

@property (nonatomic,copy) NSString *homeLogo;

@property (nonatomic,copy) NSString *awayLogo;

@property (nonatomic,copy) NSString *leagueName;//联赛名称

@property (nonatomic,assign) NSInteger is_reverse;//字段，表示比赛是否主客相反，0否，1是;

@end

NS_ASSUME_NONNULL_END
