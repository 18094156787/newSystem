//
//  UIButton+Effect.m
//  CoinWay
//
//  Created by Rain on 2018/8/3.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "UIButton+Effect.h"

@implementation UIButton (Effect)
@dynamic highlightBackgroundColor;
@dynamic selectionBackgroundColor;
@dynamic disabledBackgroundColor;
@dynamic borderColor;
@dynamic borderWidth;


+ (UIButton *)initWithText:(NSString *)text FontSize:(int)fontSize BackGroundColor:(UIColor *)backColor TextColors:(UIColor *)titleColor {
    UIButton *button = [UIButton new];
    
    if (!titleColor) {
        [button setTitleColor:[UIColor blackColor] forState:0];
    }else{
        [button setTitleColor:titleColor forState:0];
    }
    if (!backColor) {
        button.backgroundColor = [UIColor clearColor];
    }else{
        button.backgroundColor = backColor;
    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:text forState:0];
    return button;
}

+ (UIButton *)initWithText:(NSString *)text FontSize:(int)fontSize Weight:(CGFloat)weight BackGroundColor:(UIColor *)backColor TextColors:(UIColor *)titleColor {
    UIButton *button = [UIButton new];
    
    if (!titleColor) {
        [button setTitleColor:[UIColor blackColor] forState:0];
    }else{
        [button setTitleColor:titleColor forState:0];
    }
    if (!backColor) {
        button.backgroundColor = [UIColor clearColor];
    }else{
        button.backgroundColor = backColor;
    }
    if (weight == 0) {
          button.titleLabel.font = [UIFont systemFontOfSize:fontSize];

    }else {
        if (weight==1) {
            button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:fontSize];
        }
        if (weight==2) {
            button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
        }
        if (weight==3) {
            button.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:fontSize];
        }
       
    }
    
   
    [button setTitle:text forState:0];
    return button;
}

+ (JCJingCaiBtn *)initWithText:(NSString *)text FontSize:(int)fontSize BackGroundColor:(UIColor *)backColor TextColor:(UIColor *)titleColor {
    JCJingCaiBtn *button = [JCJingCaiBtn new];
    
    if (!titleColor) {
        [button setTitleColor:[UIColor blackColor] forState:0];
    }else{
        [button setTitleColor:titleColor forState:0];
    }
    if (!backColor) {
        button.backgroundColor = [UIColor clearColor];
    }else{
        button.backgroundColor = backColor;
    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:text forState:0];
    return button;
}

+ (JCPostButton *)initWithTexts:(NSString *)text FontSize:(int)fontSize BackGroundColor:(UIColor *)backColor TextColor:(UIColor *)titleColor {
    JCPostButton *button = [JCPostButton new];
    
    if (!titleColor) {
        [button setTitleColor:[UIColor blackColor] forState:0];
    }else{
        [button setTitleColor:titleColor forState:0];
    }
    if (!backColor) {
        button.backgroundColor = [UIColor clearColor];
    }else{
        button.backgroundColor = backColor;
    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:text forState:0];
    return button;
}

- (void)setHighlightBackgroundColor:(UIColor *)highlightBackgroundColor {
    [self setBackgroundImage:[self imageWithColor:highlightBackgroundColor] forState:UIControlStateHighlighted];
}

- (void)setSelectionBackgroundColor:(UIColor *)selectionBackgroundColor {
    [self setBackgroundImage:[self imageWithColor:selectionBackgroundColor] forState:UIControlStateSelected];
}

- (void)setDisabledBackgroundColor:(UIColor *)disabledBackgroundColor {
    [self setBackgroundImage:[self imageWithColor:disabledBackgroundColor] forState:UIControlStateDisabled];
}

- (UIImage *)imageWithColor:(UIColor *)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return image;
}

- (void)setBorderColor:(UIColor *)borderColor {
    self.layer.borderColor = borderColor.CGColor;
}

- (void)setBorderWidth:(CGFloat)borderWidth {
    self.layer.borderWidth = borderWidth;
}
//- (void)setImageFit:(BOOL)imageFit {
//    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
//}

@end
