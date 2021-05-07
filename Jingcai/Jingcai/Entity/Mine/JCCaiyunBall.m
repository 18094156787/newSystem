//
//  JCCaiyunBall.m
//  Jingcai
//
//  Created by Administrator on 2019/1/21.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCCaiyunBall.h"

@implementation JCCaiyunBall
- (BOOL)state_isshowsend {
    return [self.present intValue] > 0;
}
- (NSString *)tag_prize {
    return [NSString stringWithFormat:@"%ld元", self.prize];
}
- (NSString *)tag_send {
    return [NSString stringWithFormat:@"送%ld", self.send];
}
- (NSString *)tag_total {
    return [NSString stringWithFormat:@"%ld红币", self.prize+self.send];
}
@end
