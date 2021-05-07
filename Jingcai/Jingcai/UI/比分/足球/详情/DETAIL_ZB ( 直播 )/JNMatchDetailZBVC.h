//
//  JNMatchDetailZBVC.h
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN
@interface JNMatchDetailZBVC : JCBaseViewController

@property (nonatomic,strong) JCMatchBall *matchBall;

- (void)loadDataWithMatchNum:(NSString *)matchNum;

- (void)destoryTimer;//销毁定时器
@end
NS_ASSUME_NONNULL_END
