//
//  JCGZHTuiJianModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCGZHTuiJianModel.h"

@implementation JCGZHTuiJianModel
// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"match" : [JCWVerTjInfoMatchBall class],@"match_info" : [JCWVerTjInfoMatchBall class]};
}

- (NSInteger)height {
    if (!_height) {
        _height = AUTO(155)*self.match_info.count;
        for (JCWVerTjInfoMatchBall *matchModel in self.match_info) {
            if (matchModel.no_rq_odds.win.length==0||matchModel.rq_odds.win.length==0) {
//                if (matchModel.classfly!=4) {
//                    //欧指和竞足都是要两行,其他的是单行
//                    _height = _height-AUTO(35);
//                }
                _height = _height-AUTO(35);
                
            }
        }
       

    }
    return _height;
}
@end
