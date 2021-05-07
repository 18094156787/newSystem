//
//  JCTeamMatchTimeModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchTimeModel : JCWBaseBall

@property (nonatomic,strong) NSString *stage_id;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSArray *group;

@end

NS_ASSUME_NONNULL_END
