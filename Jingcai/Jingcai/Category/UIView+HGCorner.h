//
//  UIView+HGCorner.h
//  HGCorner
//
//  Created by zhh on 16/9/8.
//  Copyright © 2016年 zhh. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, HGCornerPosition) {
    HGCornerPositionTop,
    HGCornerPositionTopLeft,
    HGCornerPositionLeft,
    HGCornerPositionBottom,
    HGCornerPositionLeftBottom,
    HGCornerPositionRight,
    HGCornerPositionLeftBottomAndTopRight,
    HGCornerPositionLeftTopAndBottomRight,
    HGCornerPositionTopAndBottomRight,
    HGCornerPositionBottomAndTopRight,
    HGCornerPositionNoTopRight,
    HGCornerPositionNoTopLeft,
    HGCornerPositionNoBottomLeft,
    
    HGCornerPositionAll
};

@interface UIView (HGCorner)

@property (nonatomic, assign) HGCornerPosition hg_cornerPosition;
@property (nonatomic, assign) CGFloat hg_cornerRadius;

- (void)hg_setCornerOnTopWithRadius:(CGFloat)radius;
- (void)hg_setCornerOnTopLeftWithRadius:(CGFloat)radius;
- (void)hg_setCornerOnLeftWithRadius:(CGFloat)radius;
- (void)hg_setCornerOnBottomWithRadius:(CGFloat)radius;
- (void)hg_setCornerOnRightWithRadius:(CGFloat)radius;
- (void)hg_setAllCornerWithCornerRadius:(CGFloat)radius;
- (void)hg_setNoneCorner;
- (void)hg_setCornerOnLeftBottomWithRadius:(CGFloat)radius;
- (void)hg_setCornerOnLeftTopAndBottomRightWithRadius:(CGFloat)radius;//左上和右下
- (void)hg_setCornerOnLeftBottomAndTopRightWithRadius:(CGFloat)radius;//左下和右上
- (void)hg_setCornerOnTopAndBottomRightWithRadius:(CGFloat)radius;//全上和下右
- (void)hg_setCornerOnBottomAndTopRightWithRadius:(CGFloat)radius;//全下和右上
- (void)hg_setCornerNoTopRightWithRadius:(CGFloat)radius;//右上不要，其余圆角
- (void)hg_setCornerNoTopLeftWithRadius:(CGFloat)radius;//左上不要，其余圆角
- (void)hg_setCornerNoBottomLeftWithRadius:(CGFloat)radius;//左下不要，其余圆角
@end
