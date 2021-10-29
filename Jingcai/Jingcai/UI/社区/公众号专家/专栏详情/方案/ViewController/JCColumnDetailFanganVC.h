//
//  JCColumnDetailFanganVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnDetailFanganVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *column_id;

//该专栏已购买
- (void)columnIsBuy;

@end

NS_ASSUME_NONNULL_END
