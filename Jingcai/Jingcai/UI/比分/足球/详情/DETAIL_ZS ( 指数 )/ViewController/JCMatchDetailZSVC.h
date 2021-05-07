//
//  JCMatchDetailZSVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/26.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCMatchBall.h"
#import "LMJTab.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMatchDetailZSVC : JCBaseViewController<LMJTabDelegate>

@property (nonatomic,strong) LMJTab * tabSegment;

@property (nonatomic,strong) JCMatchBall *matchBall;

@property (nonatomic,assign) BOOL isJingCai;

@property (nonatomic,assign) BOOL isBeiDan;

- (void)loadDataWithMatchNum:(JCMatchBall *)matchBall type:(NSInteger)type;

@end

NS_ASSUME_NONNULL_END
