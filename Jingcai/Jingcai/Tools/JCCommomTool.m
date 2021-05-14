//
//  JCCommomTool.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommomTool.h"

@implementation JCCommomTool
//获取个位数
+ (NSInteger)getUnits:(NSInteger)targetInt {
    NSString *strNum = [NSString stringWithFormat:@"%ld", targetInt];
    NSString *resultStr = [strNum substringWithRange:NSMakeRange(strNum.length - 1, 1)];
    return [resultStr integerValue];
}
//获取十位数
+ (NSInteger)getTens:(NSInteger)targetInt {
    if (targetInt < 10 && targetInt > -10) {
        return 0;
    }
    NSString *strNum = [NSString stringWithFormat:@"%ld", targetInt];
    NSString *resultStr = [strNum substringWithRange:NSMakeRange(strNum.length - 2, 1)];
    return [resultStr integerValue];
}
 //获取百位数
+ (NSInteger)getHundreds:(NSInteger)targetInt {
    if (targetInt < 100 && targetInt > -100) {
        return 0;
    }
    NSString *strNum = [NSString stringWithFormat:@"%ld", targetInt];
    NSString *resultStr = [strNum substringWithRange:NSMakeRange(strNum.length - 3, 1)];
    return [resultStr integerValue];
}

+ (NSAttributedString *)textEdgeWithText:(NSString *)text {
    NSMutableParagraphStyle *style =  [NSMutableParagraphStyle new];
    style.alignment = NSTextAlignmentCenter;
//        style.firstLineHeadIndent = 3;
    style.headIndent = 10.0f;
    style.tailIndent = 10.0f;
    NSAttributedString *attrText = [[NSAttributedString alloc] initWithString:text attributes:@{ NSParagraphStyleAttributeName : style}];
    return attrText;
}
+(NSString *)formatePointZero1:(NSString *)text
{
    //这边的%.2f,是知道最多有2位小数,去除多余的0. ps:如果不知道有多少位小数,可能默认取个10位,%.10f
    NSString *numstr = [NSString stringWithFormat:@"%.2f",[text floatValue]/100.0f];
    NSArray *array = [numstr componentsSeparatedByString:@"."];
    if (array.count == 1) return array[0];

    if (array.count > 1) {
    while(numstr.length > 0){
    NSInteger index = numstr.length - 1;
    NSString *temp = [numstr substringWithRange:NSMakeRange(index, 1)];
    if ([temp isEqualToString:@"0"]){
    numstr = [numstr substringWithRange:NSMakeRange(0, index)];
    continue;
    }
    break;
        
    }
    array = [numstr componentsSeparatedByString:@"."];
     if (array.count > 1 && [array[1] isEqualToString:@""]){
         numstr = array[0];
     }
}
return numstr;
}
@end
