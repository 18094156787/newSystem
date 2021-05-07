//
//  JNTabBar.h
//  Jingcai
//
//  Created by Administrator on 2019/6/4.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^JNTabBarBtnClickBlock) (NSInteger index);

NS_ASSUME_NONNULL_BEGIN
@interface JNTabBar : UITabBar
@property (nonatomic, assign) NSUInteger selectedIndex;
@property (nonatomic, assign) BOOL isShake;
@property (nonatomic, copy) JNTabBarBtnClickBlock btnClickBlock;
- (void)setMineBadge;//设置个人中心角标
- (void)clearMineBadge;//取消个人中心角标
@end
NS_ASSUME_NONNULL_END
