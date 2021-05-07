//
//  JNMatchZS_ZSDetailViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNMatchZS_ZSDetailViewController : JCBaseTableViewController

@property (nonatomic,strong) NSString *match_num;

@property (nonatomic,strong) NSString *company_id;

@property (nonatomic,strong) NSString *type;

@property (nonatomic,strong) NSString *company_name;

@property (nonatomic,assign) NSInteger classStr;//3是欧指4是亚指5是进球数

@end

NS_ASSUME_NONNULL_END
