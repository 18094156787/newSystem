//
//  JCWExpertBall.m
//  Jingcai
//
//  Created by Rain on 2018/11/2.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCWExpertBall.h"
#import "JCWInterfaceTool.h"
#import "JCWStringTool.h"

@implementation JCWExpertBall
- (NSString *)checked_user_img {
    if ([JCWStringTool isUrlAddress:_user_img]) {
        return _user_img;
    }
    return [NSString stringWithFormat:@"%@%@", [JCWInterfaceTool imageUrl], _user_img];
}
//@property (strong, readonly, nonatomic) NSString * tag_tjuser;
//@property (strong, readonly, nonatomic) NSString * tag_hong;
//@property (strong, readonly, nonatomic) NSString * tag_zyll;
- (NSString *)tag_badge {
    if (self.new_tuijian <= 0) {
        return nil;
    }
    return [NSString stringWithFormat:@"%ld", self.new_tuijian];
}
- (NSString *)tag_tjuser {
    if (self.ten_tj_win <= 0) {
        return nil;
    }
    return [NSString stringWithFormat:@"%ld中%ld", self.ten_tj_all, self.ten_tj_win];
}
- (NSString *)tag_hong {
    if (self.hong <= 0) {
        return nil;
    }
    return [NSString stringWithFormat:@"%ld中%ld", self.lianhong, self.hong];
}
- (NSString *)tag_zyll {
    if (!self.zyll) {
        return nil;
    }
    return [NSString stringWithFormat:@"%@", self.zyll];
}
- (BOOL)isEmptyItem {
    return self.id.length == 0 || self.id.integerValue == 0;
}
- (NSString *)rank_zyll {
//    return [NSString stringWithFormat:@"%d%%盈利率",(int)(100*self.zyll+0.5)];
    return @"";
}
@end
