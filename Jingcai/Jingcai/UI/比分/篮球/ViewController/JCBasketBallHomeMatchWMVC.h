//
//  JCBasketBallHomeMatchWMVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "WMPageController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallHomeMatchWMVC : WMPageController

- (void)filterItemClick;

@property (nonatomic,copy) void(^JCIndexBlock)(int idex);

@end

NS_ASSUME_NONNULL_END
