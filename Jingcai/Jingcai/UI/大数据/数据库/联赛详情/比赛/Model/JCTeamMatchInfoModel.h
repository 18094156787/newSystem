//
//  JCTeamMatchInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCTeamMatchModel.h"
#import "JCEventInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *title;

@property (nonatomic,strong) NSString *event_id;

@property (nonatomic,strong) NSString *event_logo;

@property (nonatomic,strong) JCEventInfoModel *competition_info;

@property (nonatomic,strong) NSMutableArray <JCTeamMatchModel *>*match_list;

@property (nonatomic,strong) NSMutableArray <JCTeamMatchModel *>*match;


@end

NS_ASSUME_NONNULL_END
