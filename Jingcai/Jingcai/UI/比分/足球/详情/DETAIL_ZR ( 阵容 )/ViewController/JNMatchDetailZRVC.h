//
//  JNMatchDetailZRVC.h
//  Jingcai
//
//  Created by Administrator on 2019/6/13.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCWMatchBall.h"

NS_ASSUME_NONNULL_BEGIN
@interface JNMatchDetailZRVC : JCBaseViewController


@property (nonatomic,strong) JCMatchBall *matchBall;

- (void)loadDataWithMatchBall:(JCMatchBall *)matchBall;
@end
NS_ASSUME_NONNULL_END
