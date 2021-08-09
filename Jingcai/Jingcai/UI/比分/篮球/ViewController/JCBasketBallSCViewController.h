//
//  JCBasketBallSCViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallSCViewController : JCBaseTableViewController

@property (nonatomic,strong) NSString *type;//1是赛程 2是进行中 3是已完场

@property (nonatomic,strong) NSString *eventArray;//联赛数组json串

@property (nonatomic,strong) NSString *screening;//2筛选-重要 3筛选-全部 4筛选-竟彩 默认3

@property (nonatomic,strong) NSString *time;

@property (nonatomic,assign) int index;//跟筛选的index对应

- (void)filterData;

- (void)filtertAll;

@end

NS_ASSUME_NONNULL_END
