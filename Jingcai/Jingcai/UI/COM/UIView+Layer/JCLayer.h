//
//  JCLayer.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/8.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCLayer : NSObject

+ (void)setupView:(UIView *)view corners:(UIRectCorner)corner cornerRadius:(CGFloat)cornerRadius borderWith:(CGFloat)width borderColor:(UIColor *)color;

@end

NS_ASSUME_NONNULL_END
