//
//  JCBasketBallMatchTongJiUserModel.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBasketBallMatchTongJiUserModel.h"

@implementation JCBasketBallMatchTongJiUserModel
+ (NSDictionary *)modelCustomPropertyMapper {
   // 将personId映射到key为id的数据字段
    return @{@"play_info":@"new_play_info"};

}

@end
