//
//  JCEventStageModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCEventStageModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *name_zh;

@property (nonatomic,strong) NSString *season_id;//赛季ID

@property (nonatomic,strong) NSString *group_count;//总组数

@property (nonatomic,strong) NSString *round_count;//总轮数

@property (nonatomic,strong) NSString *stage_id;//

@property (nonatomic,assign) NSInteger mode;//比赛模式，1-积分赛、2-淘汰赛、3-资格赛

@end

NS_ASSUME_NONNULL_END
