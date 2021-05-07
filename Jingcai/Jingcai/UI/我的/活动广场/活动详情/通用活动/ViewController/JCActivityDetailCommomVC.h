//
//  JCActivityDetailCommomVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/23.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCActivityDetailCommomVC : JCBaseTableViewController

@property (nonatomic,copy) void(^JCCancelBlock)(void);

@property (nonatomic,strong) NSString *actID;

@end

NS_ASSUME_NONNULL_END
