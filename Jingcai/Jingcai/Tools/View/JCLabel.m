//
//  JCLabel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCLabel.h"

@implementation JCLabel

- (instancetype)init {
    if (self = [super init]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        _textInsets = UIEdgeInsetsZero;
    }
    return self;
}

- (void)drawTextInRect:(CGRect)rect {
    [super drawTextInRect:UIEdgeInsetsInsetRect(rect, _textInsets)];
}

+ (JCLabel *)initWithTitle:(NSString *)title
                 andFont:(CGFloat)font
               andWeight:(CGFloat)weight
            andTextColor:(UIColor *)textColor
      andBackgroundColor:(UIColor *)bgColor
        andTextAlignment:(NSTextAlignment)textAlignment {
    
    JCLabel *lab = [JCLabel new];
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

@end
