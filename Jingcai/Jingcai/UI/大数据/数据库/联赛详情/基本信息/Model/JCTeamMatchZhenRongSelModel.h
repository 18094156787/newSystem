//
//  JCTeamMatchZhenRongSelModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchZhenRongSelModel : JCWBaseBall

@property (nonatomic,strong) NSString *best_lineup_id;

@property (nonatomic,strong) NSString *name;

#pragma mark//新版本接口

@property (nonatomic,strong) NSString *name_zh;

@property (nonatomic,strong) NSString *update_time;

@end

NS_ASSUME_NONNULL_END
