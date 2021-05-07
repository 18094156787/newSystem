//
//  JCYuCeHongBaoSmallPriceWithDrawVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCJingCaiHongbaoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYuCeHongBaoSmallPriceWithDrawVC : JCBaseViewController

@property (nonatomic,strong) JCJingCaiHongbaoInfoModel *model;

@property (nonatomic,assign) BOOL tx_all;//全部提现

@property (nonatomic,copy) void(^JCBlock)(void);


@end

NS_ASSUME_NONNULL_END
