//
//  JCMyBuyOrderTjDetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongBangOrderDetailVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *order_id;

@property (nonatomic,assign) BOOL is_benefit;//从收益进去的

@property (nonatomic,strong) NSString *all_wl;

@property (nonatomic,strong) NSString *wl;

@end

NS_ASSUME_NONNULL_END
