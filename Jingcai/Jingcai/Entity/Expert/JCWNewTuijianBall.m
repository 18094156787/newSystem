//
//  JCWNewTuijianBall.m
//  Jingcai
//
//  Created by Administrator on 2019/2/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCWNewTuijianBall.h"

@implementation JCWNewTuijianBall
- (BOOL)isShow_win {
    return self.ten_tj_win >= 7;
}
- (BOOL)isShow_zyll {
    return self.zyll >= 3;
}
- (BOOL)isShow_lianhong {
    return self.lianhong >= 2;
}
- (NSString *)info_hong {
    return [NSString stringWithFormat:@"%@连红",NonNil(self.hong)];
}
- (NSString *)info_win {
    return [NSString stringWithFormat:@"%ld中%ld", self.ten_tj_all, self.ten_tj_win];
}
- (NSString *)info_zyll {
    return [NSString stringWithFormat:@"%d%%", (int)(100*self.zyll+0.5)];
}
- (NSString *)info_lianhong {
    return [NSString stringWithFormat:@"%ld连红", self.lianhong];
}
- (BOOL)isSubscribe {
    return [self.subscribe isEqualToString:@"关注"];
}
- (JCWPayInfoBall *)parseToPayInfoBall {
    JCWPayInfoBall * infoBall = [[JCWPayInfoBall alloc] init];
    infoBall.id = self.id;
    infoBall.user_id = self.user_id;
    infoBall.sf = self.sf;
    infoBall.wl_desc = self.wl_desc;
    infoBall.hb = self.hb;
    return infoBall;
}
@end
