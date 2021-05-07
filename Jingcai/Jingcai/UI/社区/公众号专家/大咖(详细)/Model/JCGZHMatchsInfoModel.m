//
//  JCGZHMatchsInfoModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCGZHMatchsInfoModel.h"

@implementation JCGZHMatchsInfoModel

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"tuijian" : [JCGZHTuiJianModel class]};
}
- (NSInteger)index {
    if (!_index) {
        JCGZHTuiJianModel *lastModel;
        for (int i=0; i<self.tuijian.count; i++) {
            JCGZHTuiJianModel *model = self.tuijian[i];
            
            if (lastModel&&lastModel.match.count>0&&model.match==0) {
                _index = i;
                break;
            }
            lastModel = model;
        }
    }
    return _index;
}

@end
