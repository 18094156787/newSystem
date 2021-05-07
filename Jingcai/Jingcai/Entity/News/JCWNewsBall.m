//
//  JCWNewsBall.m
//  Jingcai
//
//  Created by Rain on 2018/12/7.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWNewsBall.h"

@implementation JCWNewsBall

// 声明自定义类参数类型
+ (NSDictionary *)modelContainerPropertyGenericClass {
    // value使用[YYEatModel class]或YYEatModel.class或@"YYEatModel"没有区别
    return @{@"image" : [JCImageModel class]};
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super init];
    if (self) {
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
        self.name = [aDecoder decodeObjectForKey:@"name"];
        self.image = [aDecoder decodeObjectForKey:@"image"];
        self.pageviews = [aDecoder decodeObjectForKey:@"pageviews"];
        self.desc = [aDecoder decodeObjectForKey:@"desc"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.title forKey:@"title"];
    [aCoder encodeObject:self.name forKey:@"name"];
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeObject:self.pageviews forKey:@"pageviews"];
    [aCoder encodeObject:self.desc forKey:@"desc"];
    
}
@end
