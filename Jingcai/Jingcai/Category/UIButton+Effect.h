//
//  UIButton+Effect.h
//  CoinWay
//
//  Created by Rain on 2018/8/3.
//  Copyright © 2018年 rain. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JCJingCaiBtn.h"
#import "JCPostButton.h"
@interface UIButton (Effect)

+ (UIButton *)initWithText:(NSString *)text FontSize:(int)fontSize BackGroundColor:(UIColor *)backColor TextColors:(UIColor *)titleColor;
+ (UIButton *)initWithText:(NSString *)text FontSize:(int)fontSize Weight:(CGFloat)weight BackGroundColor:(UIColor *)backColor TextColors:(UIColor *)titleColor;
+ (JCJingCaiBtn *)initWithText:(NSString *)text FontSize:(int)fontSize BackGroundColor:(UIColor *)backColor TextColor:(UIColor *)titleColor;
+ (JCPostButton *)initWithTexts:(NSString *)text FontSize:(int)fontSize BackGroundColor:(UIColor *)backColor TextColor:(UIColor *)titleColor;

@property (strong, nonatomic) IBInspectable UIColor *highlightBackgroundColor; //按下背景色
@property (strong, nonatomic) IBInspectable UIColor *selectionBackgroundColor; //select状态背景色
@property (strong, nonatomic) IBInspectable UIColor *disabledBackgroundColor; //disabled状态背景色
@property (strong, nonatomic) IBInspectable UIColor *borderColor; //边框颜色
@property (assign, nonatomic) IBInspectable CGFloat borderWidth; //边框大小
//@property (assign, nonatomic) IBInspectable BOOL imageFit;//图片是否适应大小
@end
