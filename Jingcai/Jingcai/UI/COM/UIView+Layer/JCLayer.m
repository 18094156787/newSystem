//
//  JCLayer.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCLayer.h"

@implementation JCLayer

+ (void)setupView:(UIView *)view corners:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius borderWith:(CGFloat)width borderColor:(UIColor *)color {
    [view.layer removeAllSublayers];
    CAShapeLayer *maskLayer = [CAShapeLayer layer];
    maskLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    //边框
    CAShapeLayer *borderLayer = [CAShapeLayer layer];
    borderLayer.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
    borderLayer.lineWidth = width;
    borderLayer.strokeColor  = color.CGColor;
    borderLayer.fillColor = [UIColor clearColor].CGColor;
    UIBezierPath *bezierPath = [UIBezierPath bezierPathWithRoundedRect:view.bounds byRoundingCorners:corner cornerRadii:CGSizeMake(cornerRadius, cornerRadius)];
    maskLayer.path = bezierPath.CGPath;
    borderLayer.path = bezierPath.CGPath;
    [view.layer insertSublayer:borderLayer atIndex:0];
    [view.layer setMask:maskLayer];
}

@end
