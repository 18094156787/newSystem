//
//  UIView+HGCorner.m
//  HGCorner
//
//  Created by zhh on 16/9/8.
//  Copyright © 2016年 zhh. All rights reserved.
//

#import "UIView+HGCorner.h"
#import <objc/runtime.h>

static NSString * const HGCornerPositionKey = @"HGCornerPositionKey";
static NSString * const HGCornerRadiusKey = @"HGCornerRadiusKey";

@implementation UIView (HGCorner)

@dynamic hg_cornerPosition;
- (HGCornerPosition)hg_cornerPosition
{
    return [objc_getAssociatedObject(self, &HGCornerPositionKey) integerValue];
}

- (void)setHg_cornerPosition:(HGCornerPosition)hg_cornerPosition
{
    objc_setAssociatedObject(self, &HGCornerPositionKey, @(hg_cornerPosition), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@dynamic hg_cornerRadius;
- (CGFloat)hg_cornerRadius
{
    return [objc_getAssociatedObject(self, &HGCornerRadiusKey) floatValue];
}

- (void)setHg_cornerRadius:(CGFloat)hg_cornerRadius
{
    objc_setAssociatedObject(self, &HGCornerRadiusKey, @(hg_cornerRadius), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+ (void)load
{
    SEL ori = @selector(layoutSublayersOfLayer:);
    SEL new = NSSelectorFromString([@"hh_" stringByAppendingString:NSStringFromSelector(ori)]);
    hh_swizzle(self, ori, new);
}

void hh_swizzle(Class c, SEL orig, SEL new)
{
    Method origMethod = class_getInstanceMethod(c, orig);
    Method newMethod = class_getInstanceMethod(c, new);
    
    method_exchangeImplementations(origMethod, newMethod);
}

- (void)hh_layoutSublayersOfLayer:(CALayer *)layer
{
    [self hh_layoutSublayersOfLayer:layer];
    
    if (self.hg_cornerRadius > 0) {
        
        UIBezierPath *maskPath;
        switch (self.hg_cornerPosition) {
            case HGCornerPositionTop:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerTopRight)
                                                       cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
                case HGCornerPositionTopLeft:
                    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     byRoundingCorners:UIRectCornerTopLeft
                                                           cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                    break;
                
            case HGCornerPositionLeft:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopLeft | UIRectCornerBottomLeft)
                                                       cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
            case HGCornerPositionBottom:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerBottomLeft | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
            case HGCornerPositionRight:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:(UIRectCornerTopRight | UIRectCornerBottomRight)
                                                       cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
            case HGCornerPositionAll:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:UIRectCornerAllCorners
                                                       cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
            case HGCornerPositionLeftBottom:
                maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                 byRoundingCorners:UIRectCornerBottomLeft
                                                       cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
                case HGCornerPositionTopAndBottomRight:
                    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     byRoundingCorners:UIRectCornerTopLeft|UIRectCornerTopRight|UIRectCornerBottomRight
                                                           cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                    break;
                case HGCornerPositionBottomAndTopRight:
                    maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                     byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerTopRight|UIRectCornerBottomRight
                                                           cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
                case HGCornerPositionLeftBottomAndTopRight:
                       maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                        byRoundingCorners:UIRectCornerBottomLeft|UIRectCornerTopRight
                                                              cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
                case HGCornerPositionLeftTopAndBottomRight:
                       maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                        byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight
                                                              cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                break;
                case HGCornerPositionNoTopRight:
                        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                         byRoundingCorners:UIRectCornerTopLeft|UIRectCornerBottomRight|UIRectCornerBottomLeft
                                                               cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];
                
                
                    break;
                case HGCornerPositionNoTopLeft:
                        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                         byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight|UIRectCornerBottomLeft
                                                               cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];

                
                
                    break;
                case HGCornerPositionNoBottomLeft:
                        maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                         byRoundingCorners:UIRectCornerTopRight|UIRectCornerBottomRight|UIRectCornerTopLeft
                                                               cornerRadii:CGSizeMake(self.hg_cornerRadius, self.hg_cornerRadius)];

                
                
                    break;
                
                
                
        }
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame = self.bounds;
        maskLayer.path = maskPath.CGPath;
        self.layer.mask = maskLayer;
        
    }
}

- (void)hg_setCornerOnTopWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionTop;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnTopLeftWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionTopLeft;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnLeftWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionLeft;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnBottomWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionBottom;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnRightWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionRight;
    self.hg_cornerRadius = radius;
}

- (void)hg_setAllCornerWithCornerRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionAll;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnLeftBottomWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionLeftBottom;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnTopAndBottomRightWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionTopAndBottomRight;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnBottomAndTopRightWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionBottomAndTopRight;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerOnLeftBottomAndTopRightWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionLeftBottomAndTopRight;
    self.hg_cornerRadius = radius;
}
- (void)hg_setCornerOnLeftTopAndBottomRightWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionLeftTopAndBottomRight;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerNoTopRightWithRadius:(CGFloat)radius
{
    self.hg_cornerPosition = HGCornerPositionNoTopRight;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerNoTopLeftWithRadius:(CGFloat)radius {
    self.hg_cornerPosition = HGCornerPositionNoTopLeft;
    self.hg_cornerRadius = radius;
}

- (void)hg_setCornerNoBottomLeftWithRadius:(CGFloat)radius {
    self.hg_cornerPosition = HGCornerPositionNoBottomLeft;
    self.hg_cornerRadius = radius;
}

- (void)hg_setNoneCorner
{
    self.layer.mask = nil;
}

@end
