//
//  UILabel+JCAlignment.h
//  Jingcai
//
//  Created by Administrator on 2019/2/17.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface UILabel (JCAlignment)

+ (UILabel *) labelTitle:(NSString *)title
                 andFont:(CGFloat)font
               andWeight:(CGFloat)weight
            andTextColor:(UIColor *)textColor
      andBackgroundColor:(UIColor *)bgColor
        andTextAlignment:(NSTextAlignment)textAlignment;
+ (UILabel *)initWithTitle:(NSString *)title
           andFont:(CGFloat)font
         andWeight:(CGFloat)weight
      andTextColor:(UIColor *)textColor
andBackgroundColor:(UIColor *)bgColor
          andTextAlignment:(NSTextAlignment)textAlignment;

- (void)changeAlignmentLeftAndRight;
@end
NS_ASSUME_NONNULL_END
