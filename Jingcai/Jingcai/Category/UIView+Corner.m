//
//  UIView+Corner.m
//  CoinWay
//
//  Created by Rain on 2018/8/3.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "UIView+Corner.h"
#import "UIView+HGCorner.h"

@implementation UIView (Corner)
@dynamic cornerRadius;

- (void)setCornerRadius:(CGFloat)cornerRadius {
    //[self hg_setAllCornerWithCornerRadius:cornerRadius];
    self.layer.cornerRadius = cornerRadius;
}

@end
