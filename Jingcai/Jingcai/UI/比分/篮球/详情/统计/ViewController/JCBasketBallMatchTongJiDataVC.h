//
//  JCBasketBallMatchTongJiDataVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchTongJiDataVC : JCBaseTableViewController

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) JCBasketBallMatchBall *matchBall;

@end

NS_ASSUME_NONNULL_END
