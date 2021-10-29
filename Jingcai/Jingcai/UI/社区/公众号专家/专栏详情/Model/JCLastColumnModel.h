//
//  JCLastColumnModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
@class JCLastColumnCombatModel;
NS_ASSUME_NONNULL_BEGIN

@interface JCLastColumnModel : JCWBaseBall

@property (nonatomic,copy)NSString *type;//周期状态,1周期更新中,2周期结束,3专家过往战绩

@property (nonatomic,copy)NSString *period;//期数 期数，type为1,2时才有

@property (nonatomic,copy)NSString *period_foreshow;//周期预告 type为1,2时才有

@property (nonatomic,strong) JCLastColumnCombatModel *combat;//战绩

@end

@interface JCLastColumnCombatModel : JCWBaseBall

@property (nonatomic,copy)NSString *match_red;//命中的场次数

@property (nonatomic,copy)NSString *match_num;//推荐的场次数

@property (nonatomic,copy)NSString *rate;//命中率

@property (nonatomic,strong)NSArray *wl_list;//命中结果列表，1红 2黑 5走水

@property (nonatomic,copy)NSString *event_name;//专家过往推荐的赛事名称

@property (nonatomic,copy)NSString *classfly;//专家过往推荐玩法类型名称

@end

NS_ASSUME_NONNULL_END
