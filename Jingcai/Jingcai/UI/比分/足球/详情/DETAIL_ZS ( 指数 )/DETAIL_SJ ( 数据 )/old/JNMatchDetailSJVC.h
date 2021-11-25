//
//  JNMatchDetailSJVC.h
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCWMatchBall.h"
#import "LMJTab.h"
NS_ASSUME_NONNULL_BEGIN
@interface JNMatchDetailSJVC : JCBaseViewController<LMJTabDelegate>

@property (nonatomic,strong) LMJTab * tabSegment;

@property (nonatomic,strong) JCMatchBall *matchBall;

- (void)loadDataWithMatchBall:(JCMatchBall *)matchBall;


@end
NS_ASSUME_NONNULL_END
