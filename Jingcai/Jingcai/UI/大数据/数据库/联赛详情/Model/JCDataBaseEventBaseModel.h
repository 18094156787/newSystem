//
//  JCDataBaseEventBaseModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/9.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCDataBaseEventSeasonModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDataBaseEventBaseModel : JCWBaseBall

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *logo;

@property (nonatomic,strong) NSString *cur_season_id;

@property (nonatomic,strong) NSArray <JCDataBaseEventSeasonModel *>*season;

@end

NS_ASSUME_NONNULL_END
