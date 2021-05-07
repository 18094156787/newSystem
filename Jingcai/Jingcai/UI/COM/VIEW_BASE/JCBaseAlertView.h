//
//  JCBaseAlertView.h
//  Jingcai
//
//  Created by Administrator on 2018/12/27.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseView.h"

typedef NS_ENUM(NSInteger, JCAlertViewAnimationStyle) {
    JCAlertViewAnimationStyleNone,
    JCAlertViewAnimationStyleAlert,
    JCAlertViewAnimationStyleSheet
};

NS_ASSUME_NONNULL_BEGIN
@interface JCBaseAlertView : JCBaseView
@property (strong, nonatomic) UIView * baseBackView;
@property (strong, nonatomic) UIView * baseAlertView;
@property (assign, nonatomic) JCAlertViewAnimationStyle animationStyle;
- (void)show;
- (void)hide;
@end
NS_ASSUME_NONNULL_END
