//
//  UIView+CurrentVC.h
//  CoinWay
//
//  Created by Rain on 2018/8/28.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CurrentVC)
// 获取当前屏幕显示的vc
- (UIViewController *)getCurrentVC;
// 获取所在的父vc(有bug)
- (UIViewController *)getParentVC;
@end
