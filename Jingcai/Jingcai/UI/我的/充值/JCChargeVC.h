//
//  JCChargeVC.h
//  Jingcai
//
//  Created by Administrator on 2019/1/10.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"

typedef void(^JCChargePayClickBlock)(NSInteger prize);
//支付回调(支付金额)

NS_ASSUME_NONNULL_BEGIN
@interface JCChargeVC : JCBaseViewController
@property (nonatomic, copy) JCChargePayClickBlock payClickBlock;
- (void)getChargeList;
@end
NS_ASSUME_NONNULL_END
