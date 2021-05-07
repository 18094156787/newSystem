//
//  JCWMySubscribeBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/13.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWMySubscribeBall.h"

@implementation JCWMySubscribeBall
- (NSString *)badge_tuijian_new {
    return _tuijian_new > 0 ? [NSString stringWithFormat:@"%ld", _tuijian_new] : nil;
}

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.user_img = [aDecoder decodeObjectForKey:@"user_img"];
        self.ten_tj_all = [aDecoder decodeObjectForKey:@"ten_tj_all"];
        self.ten_tj_win = [aDecoder decodeObjectForKey:@"ten_tj_win"];
        self.user_id = [aDecoder decodeObjectForKey:@"user_id"];
        self.tuijian_new = [aDecoder decodeIntegerForKey:@"tuijian_new"];
        self.user_name = [aDecoder decodeObjectForKey:@"user_name"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.user_img forKey:@"user_img"];
    [aCoder encodeObject:self.ten_tj_all forKey:@"ten_tj_all"];
    [aCoder encodeObject:self.ten_tj_win forKey:@"ten_tj_win"];
    [aCoder encodeObject:self.user_id forKey:@"user_id"];
    [aCoder encodeInteger:self.tuijian_new forKey:@"tuijian_new"];
    [aCoder encodeObject:self.user_name forKey:@"user_name"];
}

@end
