//
//  JCDataBaseEventTabModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDataBaseEventTabModel : JCWBaseBall


@property (nonatomic,assign) NSInteger type;//1是基本信息 2是积分榜 3是比赛 4是球员榜 5是球队榜

@property (nonatomic,strong) NSString *name;

@end

NS_ASSUME_NONNULL_END
