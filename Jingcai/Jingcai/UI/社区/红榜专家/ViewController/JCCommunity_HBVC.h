//
//  JCCommunity_HBVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCCommunity_HBVC : JCBaseTableViewController

@property (nonatomic,copy) void(^JCRefreshBlock)(void);


@end

NS_ASSUME_NONNULL_END
