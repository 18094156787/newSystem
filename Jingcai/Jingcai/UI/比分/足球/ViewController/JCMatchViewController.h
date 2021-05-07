//
//  JCMatchViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/6/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchViewController : JCBaseTableViewController

@property (nonatomic,strong) NSString *type;

@property (nonatomic,strong) NSString *eventArray;//联赛数组json串

@property (nonatomic,strong) NSString *screening;//筛选类别 1首页重要 等于 重要+筛选+北单 并集 2筛选-重要 3筛选-全部 4筛选-竟足 5筛选-北单 默认3

@property (nonatomic,strong) NSString *time;

- (void)filterData;

- (void)filtertAll;

@end

NS_ASSUME_NONNULL_END
