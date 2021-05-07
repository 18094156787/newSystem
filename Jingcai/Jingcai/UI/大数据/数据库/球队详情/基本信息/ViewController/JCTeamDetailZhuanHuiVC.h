//
//  JCTeamDetailZhuanHuiVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTeamDetailZhuanHuiVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *team_id;

@property (nonatomic,assign) NSInteger type;//1是转入 2是转出

@end

NS_ASSUME_NONNULL_END
