//
//  JCBasketBallMatchZhiShuVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
#import "LMJTab.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchZhiShuVC : JCBaseViewController

@property (nonatomic,strong) LMJTab * tabSegment;

@property (nonatomic,strong) JCBasketBallMatchBall *matchBall;

- (void)loadDataWithMatchBall:(JCWMatchBall *)matchBal;

@end

NS_ASSUME_NONNULL_END
