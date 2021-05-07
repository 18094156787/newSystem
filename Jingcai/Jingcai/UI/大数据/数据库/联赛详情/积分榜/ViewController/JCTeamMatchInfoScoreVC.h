//
//  JCTeamMatchInfoScoreVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamMatchInfoScoreVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *event_id;

@property (nonatomic, strong) NSString *season_id;

@property (nonatomic,strong) NSString *stage_id;//阶段id
@end

NS_ASSUME_NONNULL_END
