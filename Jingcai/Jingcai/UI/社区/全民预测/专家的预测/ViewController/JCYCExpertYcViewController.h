//
//  JCYCExpertYcViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCExpertYcViewController : JCBaseTableViewController

@property (nonatomic,strong) NSString *expertID;

@property (nonatomic,strong) NSString *type;//type=2是上周的预测历史

@end

NS_ASSUME_NONNULL_END
