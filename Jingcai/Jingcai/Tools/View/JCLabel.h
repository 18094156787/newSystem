//
//  JCLabel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/25.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCLabel : UILabel

@property (nonatomic, assign) UIEdgeInsets textInsets; // 控制字体与控件边界的间隙

+ (JCLabel *)initWithTitle:(NSString *)title
                 andFont:(CGFloat)font
               andWeight:(CGFloat)weight
            andTextColor:(UIColor *)textColor
      andBackgroundColor:(UIColor *)bgColor
          andTextAlignment:(NSTextAlignment)textAlignment;

@end

NS_ASSUME_NONNULL_END
