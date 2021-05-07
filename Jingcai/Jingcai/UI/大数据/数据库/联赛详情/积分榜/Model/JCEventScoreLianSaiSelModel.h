//
//  JCTeamMatchInfoScoreSelModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCEventScoreLianSaiInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCEventScoreLianSaiSelModel : JCWBaseBall

@property (nonatomic,strong) NSString *sel;

@property (nonatomic,strong) NSArray <JCEventScoreLianSaiInfoModel *>*team;

@end

NS_ASSUME_NONNULL_END
