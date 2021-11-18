//
//  JCTransactionDataModelVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/12.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *type;//0全部 1胜平负、2让球、3进球数

//@property (nonatomic,strong) NSString *order_by;//1正序（历史异动赛事），2倒叙（最新推荐）

@end

NS_ASSUME_NONNULL_END
