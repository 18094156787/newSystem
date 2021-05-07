//
//  JCWMyHuodongBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/13.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWMyHuodongBall.h"

@implementation JCWMyHuodongBall
#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.result = [aDecoder decodeObjectForKey:@"result"];
        self.number = [aDecoder decodeObjectForKey:@"number"];
        self.wresult = [aDecoder decodeObjectForKey:@"wresult"];
        self.prize = [aDecoder decodeObjectForKey:@"prize"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.result forKey:@"result"];
    [aCoder encodeObject:self.number forKey:@"number"];
    [aCoder encodeObject:self.wresult forKey:@"wresult"];
    [aCoder encodeObject:self.prize forKey:@"prize"];
}
@end
