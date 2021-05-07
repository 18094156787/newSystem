//
//  JCBindingBankCard.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCApplyBindingBankCardVC : JCBaseTableViewController

@property (nonatomic,copy) void(^JCRefreshBlock)(void);

@end

NS_ASSUME_NONNULL_END
