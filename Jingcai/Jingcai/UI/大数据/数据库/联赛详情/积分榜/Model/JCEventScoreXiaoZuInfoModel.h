//
//  JCEventScoreXiaoZuInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCEventScoreXiaoZuModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCEventScoreXiaoZuInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *group;

@property (nonatomic,strong) NSArray <JCEventScoreXiaoZuModel *>*team;

@end

NS_ASSUME_NONNULL_END
