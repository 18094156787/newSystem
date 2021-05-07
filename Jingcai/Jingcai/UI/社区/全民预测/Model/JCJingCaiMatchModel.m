//
//  JCJingCaiMatchModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCJingCaiMatchModel.h"
@class JCJingCaiMatchInfoModel;
@implementation JCJingCaiMatchModel

+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"noRq" : [JCJingCaiMatchInfoModel class],@"Rq" : [JCJingCaiMatchInfoModel class]};
}

- (JCJingCaiMatchRequstInfoModel *)requestModel {
    if (!_requestModel) {
        _requestModel = [JCJingCaiMatchRequstInfoModel new];
    }
    return _requestModel;
}

@end


@implementation JCJingCaiMatchInfoModel

@end


@implementation JCJingCaiMatchDanguanInfoModel

@end

@implementation JCJingCaiMatchRequstInfoModel

@end


