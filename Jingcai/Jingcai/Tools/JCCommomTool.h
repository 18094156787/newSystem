//
//  JCCommomTool.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JCCommomTool : NSObject
//获取个位数
+ (NSInteger)getUnits:(NSInteger)targetInt;
//获取十位数
+ (NSInteger)getTens:(NSInteger)targetInt;
 //获取百位数
+ (NSInteger)getHundreds:(NSInteger)targetInt;
//文本间距
+ (NSAttributedString *)textEdgeWithText:(NSString *)text;

//去除价格小数点
+(NSString *)formatePointZero1:(NSString *)text;
@end

NS_ASSUME_NONNULL_END
