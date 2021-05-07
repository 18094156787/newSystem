//
//  JCWithDrawRecordDetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/31.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCWithDrawRecordDetailVC : JCBaseTableViewController

@property (nonatomic,copy) void(^JCRefreshBlock)(void);

@end

NS_ASSUME_NONNULL_END
