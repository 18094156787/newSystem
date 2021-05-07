//
//  JCWMyShowBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/13.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWMyShowBall.h"

@implementation JCWMyShowBall
#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.content = [aDecoder decodeObjectForKey:@"content"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.image = [aDecoder decodeObjectForKey:@"image"];
        self.plus = [aDecoder decodeIntegerForKey:@"plus"];
        self.click = [aDecoder decodeIntegerForKey:@"click"];
        self.commment = [aDecoder decodeIntegerForKey:@"commment"];
    }
    return self;
}
- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.content forKey:@"content"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.image forKey:@"image"];
    [aCoder encodeInteger:self.plus forKey:@"plus"];
    [aCoder encodeInteger:self.click forKey:@"click"];
    [aCoder encodeInteger:self.commment forKey:@"commment"];
}

@end
