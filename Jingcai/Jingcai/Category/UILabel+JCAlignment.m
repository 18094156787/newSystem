//
//  UILabel+JCAlignment.m
//  Jingcai
//
//  Created by Administrator on 2019/2/17.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "UILabel+JCAlignment.h"
#import <CoreText/CoreText.h>

@implementation UILabel (JCAlignment)

+ (UILabel *) labelTitle:(NSString *)title
                 andFont:(CGFloat)font
               andWeight:(CGFloat)weight
            andTextColor:(UIColor *)textColor
      andBackgroundColor:(UIColor *)bgColor
        andTextAlignment:(NSTextAlignment)textAlignment{
    
    UILabel *lab = [UILabel new];
    lab.text = title;
    
    if (weight != 0) {
        [UIFont systemFontOfSize:font weight:weight];
    }else {
        [UIFont systemFontOfSize:font];
    }
    
    lab.font = [UIFont systemFontOfSize:font];
    lab.textColor = textColor;
    lab.backgroundColor = bgColor;
    lab.textAlignment = textAlignment;
    
    return lab;
}

//[UIFont fontWithName:@"PingFangSC-Regular" size:14];
+ (UILabel *)initWithTitle:(NSString *)title
                 andFont:(CGFloat)font
               andWeight:(CGFloat)weight
            andTextColor:(UIColor *)textColor
      andBackgroundColor:(UIColor *)bgColor
        andTextAlignment:(NSTextAlignment)textAlignment{
    
    UILabel *lab = [UILabel new];
    lab.text = title;
    
    if (weight == 0) {
         lab.font = [UIFont systemFontOfSize:font];

    }else {
        if (weight==1) {
            lab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:font];
        }
        if (weight==2) {
            lab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:font];
        }
        if (weight==3) {
            lab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:font];
        }
       
    }
    
    
    lab.textColor = textColor;
    lab.backgroundColor = bgColor;
    lab.textAlignment = textAlignment;
    
    return lab;
}

- (void)changeAlignmentLeftAndRight {
    CGRect textSize = [self.text boundingRectWithSize:CGSizeMake(self.frame.size.width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingTruncatesLastVisibleLine |NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName : self.font} context:nil];
    CGFloat margin = (self.frame.size.width - textSize.size.width) / (self.text.length - 1);// 每个字符之间，平均的宽度（点坐标）
    NSNumber * number = [NSNumber numberWithFloat:margin];
    NSMutableAttributedString * attributeString = [[NSMutableAttributedString alloc]initWithString:self.text];
    [attributeString addAttribute:(id)kCTKernAttributeName value:number range:NSMakeRange(0, self.text.length - 1)];
    self.attributedText = attributeString;
}
@end
