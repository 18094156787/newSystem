//
//  JCHomeGanHuoVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHomeGanHuoVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *type;//1时表示推荐 100时表示干货 101时表示情报 102时表示14场 必填 默认值为1

@end

NS_ASSUME_NONNULL_END
