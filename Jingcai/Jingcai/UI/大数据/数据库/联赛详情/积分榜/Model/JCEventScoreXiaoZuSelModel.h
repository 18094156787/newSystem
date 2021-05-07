//
//  JCEventScoreXiaoZuSelModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCEventScoreXiaoZuInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCEventScoreXiaoZuSelModel : JCWBaseBall

@property (nonatomic,strong) NSString *sel;

@property (nonatomic,strong) NSArray <JCEventScoreXiaoZuInfoModel *>*team;

@end

NS_ASSUME_NONNULL_END
