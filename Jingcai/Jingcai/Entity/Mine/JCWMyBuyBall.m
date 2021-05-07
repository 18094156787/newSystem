//
//  JCWMyBuyBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/15.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWMyBuyBall.h"

@implementation JCWMyBuyBall
//- (BOOL)isAward {
//    return _wl == 1;
//}
- (BOOL)isOnGoing {
    return self.wl == 0;
}
- (BOOL)isResultHong {
    return self.wl == 1;
}
- (BOOL)isResultHei {
    return self.wl == 2;
}

//@property (strong, nonatomic) NSString * matchtime;
//@property (strong, nonatomic) NSString * status;
//@property (assign, nonatomic) NSInteger wl;
//@property (strong, nonatomic) NSString * id;
//@property (strong, nonatomic) NSString * wl_desc;
//@property (strong, nonatomic) NSString * type_desc;
//@property (strong, nonatomic) NSString * sf;
//@property (strong, nonatomic) NSString * time;
//@property (strong, nonatomic) NSString * user_id;
//@property (strong, nonatomic) NSString * hb;
//@property (strong, nonatomic) NSString * title;

#pragma mark - NSCoding
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.matchtime = [aDecoder decodeObjectForKey:@"matchtime"];
        self.status = [aDecoder decodeObjectForKey:@"status"];
        self.wl = [aDecoder decodeIntegerForKey:@"wl"];
        self.id = [aDecoder decodeObjectForKey:@"id"];
        self.wl_desc = [aDecoder decodeObjectForKey:@"wl_desc"];
        self.type_desc = [aDecoder decodeObjectForKey:@"type_desc"];
        self.sf = [aDecoder decodeObjectForKey:@"sf"];
        self.time = [aDecoder decodeObjectForKey:@"time"];
        self.user_id = [aDecoder decodeObjectForKey:@"user_id"];
        self.hb = [aDecoder decodeObjectForKey:@"hb"];
        self.title = [aDecoder decodeObjectForKey:@"title"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:self.matchtime forKey:@"matchtime"];
    [aCoder encodeObject:self.status forKey:@"status"];
    [aCoder encodeInteger:self.wl forKey:@"wl"];
    [aCoder encodeObject:self.id forKey:@"id"];
    [aCoder encodeObject:self.wl_desc forKey:@"wl_desc"];
    [aCoder encodeObject:self.type_desc forKey:@"type_desc"];
    [aCoder encodeObject:self.sf forKey:@"sf"];
    [aCoder encodeObject:self.time forKey:@"time"];
    [aCoder encodeObject:self.user_id forKey:@"user_id"];
    [aCoder encodeObject:self.hb forKey:@"hb"];
    [aCoder encodeObject:self.title forKey:@"title"];
}

@end
