//
//  JCDataBaseEventSeasonModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDataBaseEventSeasonModel : JCWBaseBall

@property (nonatomic,strong) NSString *season;

@property (nonatomic,strong) NSString *season_id;

#pragma mark //新版本接口

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *year;

@end

NS_ASSUME_NONNULL_END
