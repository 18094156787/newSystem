//
//  JNMatchDetailZSVC.h
//  Jingcai
//
//  Created by Administrator on 2019/6/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCWMatchBall.h"
NS_ASSUME_NONNULL_BEGIN
@interface JNMatchDetailZSVC : JCBaseViewController

@property (nonatomic,strong) JCWMatchBall *matchBall;

@property (nonatomic,assign) BOOL isJingCai;

@property (nonatomic,assign) BOOL isBeiDan;

//- (void)loadDataWithMatchNum:(JCWMatchBall *)matchBall type:(NSInteger)type;
@end
NS_ASSUME_NONNULL_END
