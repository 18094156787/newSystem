//
//  JCMainTabBarController.h
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseTabBarController.h"

NS_ASSUME_NONNULL_BEGIN
@interface JCMainTabBarController : JCBaseTabBarController
@property (assign, nonatomic) NSInteger tabSelIndex;
@property (assign, nonatomic) BOOL isLogout;//记录token过期,防止重复push登陆页

- (void)showYCVC;//展示全民鲸猜
- (void)showGZHVC;//展示公众号
- (void)showHBVC;//展示红榜
//- (void)showJingCaiVC;//展鲸猜
- (void)showMessageVC;
- (void)showMyRedPacketListVC;//我的红包卡券
@end
NS_ASSUME_NONNULL_END
