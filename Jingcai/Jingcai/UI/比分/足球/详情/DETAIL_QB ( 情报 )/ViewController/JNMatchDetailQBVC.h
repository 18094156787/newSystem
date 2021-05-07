//
//  JNMatchDetailQBVC.h
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseViewController.h"
#import "LMJTab.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN
@interface JNMatchDetailQBVC : JCBaseViewController<LMJTabDelegate>

@property (nonatomic,strong) LMJTab * tabSegment;

@property (nonatomic,strong) JCMatchBall *matchBall;

- (void)loadDataWithMatchBall:(JCWMatchBall *)matchBal;

@end
NS_ASSUME_NONNULL_END
