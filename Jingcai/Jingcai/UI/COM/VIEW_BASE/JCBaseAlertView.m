//
//  JCBaseAlertView.m
//  Jingcai
//
//  Created by Administrator on 2018/12/27.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseAlertView.h"

#define JCAlertViewAnimationDuration 0.2f

@interface JCBaseAlertView ()
@property (nonatomic, strong) UIView * alertBottomView;
@end

@implementation JCBaseAlertView
- (void)setBaseBackView:(UIView *)baseBackView {
    _baseBackView = baseBackView;
    // 点击遮罩
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
    [baseBackView addGestureRecognizer:tap];
}
- (void)setBaseAlertView:(UIView *)baseAlertView {
    _baseAlertView = baseAlertView;
    // shadow
//    baseAlertView.layer.masksToBounds = NO;
//    baseAlertView.layer.shadowColor = [UIColor blackColor].CGColor;
//    baseAlertView.layer.shadowOffset = CGSizeMake(0, 0);
//    baseAlertView.layer.shadowOpacity = 0.3;
//    baseAlertView.layer.shadowRadius = 8;
    // bottom
    if (@available(iOS 11.0, *)) {
        [baseAlertView insertSubview:self.alertBottomView atIndex:0];
        self.alertBottomView.backgroundColor = baseAlertView.backgroundColor;
    };
}
- (UIView *)alertBottomView {
    if (!_alertBottomView) {
        _alertBottomView = [[UIView alloc] init];
    }
    return _alertBottomView;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self layoutIfNeeded];
    if (@available(iOS 11.0, *)) {
        CGFloat alertW = self.baseAlertView.bounds.size.width;
        CGFloat alertH = self.baseAlertView.bounds.size.height;
        CGFloat bottomH = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom;
//        self.alertBottomView.frame = CGRectMake(0, alertH, alertW, bottomH);
    };
}
//- (void)setBaseBottomConstraint:(NSLayoutConstraint *)baseBottomConstraint {
//    _baseBottomConstraint = baseBottomConstraint;
//    if (@available(iOS 11.0, *))
//}
//- (void)setBaseMaskView:(UIView *)baseBackView {
//    _baseBackView = baseBackView;
//    // 添加点击事件
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(baseMaskViewClick)];
//    [baseBackView addGestureRecognizer:tap];
//}
//- (void)baseMaskViewClick {
//    NSLog(@"点击了遮罩");
//    [self hide];
//}
- (void)show {
    // 添加到UIWindow上
    UIWindow * window = [UIApplication sharedApplication].delegate.window;
    for (UIView *view in window.subviews) {
        if ([view isKindOfClass:[self class]]) {
            return ;
        }
    }
    self.frame = [UIScreen mainScreen].bounds;
    [window addSubview:self];
    
    // 添加动画效果
    if (self.animationStyle == JCAlertViewAnimationStyleNone) {
        return ;
    }
    WeakSelf;
    if (self.animationStyle == JCAlertViewAnimationStyleAlert) {
        if (self.baseAlertView) {
            CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
            animation.duration = JCAlertViewAnimationDuration;
            NSMutableArray *values = [NSMutableArray array];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.5, 1.5, 1.0)]];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.25, 1.25, 1.0)]];
            [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
            animation.values = values;
            [weakSelf.baseAlertView.layer addAnimation:animation forKey:nil];
        }
        if (self.baseBackView) {
            self.baseBackView.alpha = 0;
            [UIView animateWithDuration:JCAlertViewAnimationDuration animations:^{
                weakSelf.baseBackView.alpha = 1.f;
            }];
        }
        return ;
    }
    if (self.animationStyle == JCAlertViewAnimationStyleSheet) {
        if (self.baseAlertView) {
            CGFloat alertH = weakSelf.baseAlertView.bounds.size.height;
            weakSelf.baseAlertView.transform = CGAffineTransformMakeTranslation(0, alertH);
            WeakSelf;
            [UIView animateWithDuration:JCAlertViewAnimationDuration animations:^{
                weakSelf.baseAlertView.transform = CGAffineTransformIdentity;
            }];
        }
        if (self.baseBackView) {
            self.baseBackView.alpha = 0;
            WeakSelf;
            [UIView animateWithDuration:JCAlertViewAnimationDuration animations:^{
                weakSelf.baseBackView.alpha = 1.f;
            }];
        }
        return ;
    }
    
}
- (void)hide {
//    if (self.baseAlertView) {
//        CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//        animation.duration = JCAlertViewAnimationDuration;
//        NSMutableArray *values = [NSMutableArray array];
//        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
//        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1.0)]];
//        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.90, 0.90, 1.0)]];
//        [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.50, 0.50, 1.0)]];
//        animation.values = values;
//        [self.baseAlertView.layer addAnimation:animation forKey:nil];
//    }
//    [self removeFromSuperview];
    
    if (self.animationStyle == JCAlertViewAnimationStyleNone) {
        [self removeFromSuperview];
        return ;
    }
    if (self.animationStyle == JCAlertViewAnimationStyleAlert) {
        WeakSelf;
        [UIView animateWithDuration:JCAlertViewAnimationDuration animations:^{
            if (self.baseAlertView) {
                [UIView animateWithDuration:JCAlertViewAnimationDuration animations:^{
                    weakSelf.baseAlertView.alpha = 0;
                }];
//                [weakSelf.baseAlertView.layer removeAllAnimations];
//                //
//                CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//                animation.duration = JCAlertViewAnimationDuration;
//                NSMutableArray *values = [NSMutableArray array];
//                [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
//                [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.75, 0.75, 1.0)]];
//                [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.5, 0.5, 1.0)]];
//                [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.25, 0.25, 1.0)]];
//                //[values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 1.0)]];
//                animation.values = values;
//                [weakSelf.baseAlertView.layer addAnimation:animation forKey:nil];
//                //weakSelf.baseAlertView.alpha = 0;
            }
            if (self.baseBackView) {
                self.baseBackView.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
        }];
        return ;
    }
    if (self.animationStyle == JCAlertViewAnimationStyleSheet) {
        WeakSelf;
        [UIView animateWithDuration:JCAlertViewAnimationDuration animations:^{
            if (weakSelf.baseAlertView) {
                CGFloat alertH = weakSelf.baseAlertView.bounds.size.height;
                weakSelf.baseAlertView.transform = CGAffineTransformMakeTranslation(0, alertH);
            }
            if (weakSelf.baseBackView) {
                weakSelf.baseBackView.alpha = 0;
            }
        } completion:^(BOOL finished) {
            [weakSelf removeFromSuperview];
        }];
        return ;
    }
    
//    // 即将消失的动画
//    CAKeyframeAnimation* animation = [CAKeyframeAnimation animationWithKeyPath:@"transform"];
//    animation.duration = JCAlertViewAnimationDuration;
//    NSMutableArray *values = [NSMutableArray array];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(1.0, 1.0, 1.0)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.95, 0.95, 1.0)]];
//    [values addObject:[NSValue valueWithCATransform3D:CATransform3DMakeScale(0.90, 0.90, 1.0)]];
//    animation.values = values;
//    [self.baseAlertView.layer addAnimation:animation forKey:nil];
}
//- (void)addDismissGestureInView:(UIView *)view {
//    // 添加点击事件
//    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hide)];
//    [view addGestureRecognizer:tap];
//}
@end
