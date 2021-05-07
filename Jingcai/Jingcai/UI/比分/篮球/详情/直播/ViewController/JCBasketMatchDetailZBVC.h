//
//  JCBasketMatchDetailZBVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketMatchDetailZBVC : JCBaseTableViewController

@property (nonatomic,strong) JCBasketBallMatchBall *matchBall;

@property (nonatomic,strong) NSString *matchNum;

@property (nonatomic,strong) void(^JCRefreshBlock)(JCBasketBallMatchBall *matchBall);

- (void)loadDataWithMatchNum:(NSString *)matchNum;

@end

NS_ASSUME_NONNULL_END
