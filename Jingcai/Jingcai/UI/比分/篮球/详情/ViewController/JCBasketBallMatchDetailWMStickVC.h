//
//  JCBasketBallMatchDetailWMStickVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "WMStickyPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchDetailWMStickVC : WMStickyPageController

@property (nonatomic, assign) CGFloat viewTop;

@property (nonatomic, strong) NSString * matchNum;

@property (nonatomic, assign) NSInteger type;

@property (nonatomic, assign) BOOL is_bigData;//跳转到 数据-鲸猜大数据

@end

NS_ASSUME_NONNULL_END
