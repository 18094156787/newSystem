//
//  JCCalculateBall.m
//  Jingcai
//
//  Created by Administrator on 2019/2/15.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCCalculateBall.h"

@implementation JCCalculateBall
//计算概率的方法：（保留一位小数）
//返奖率= 1/(1/胜赔率+1/平赔率+1/负赔率)
//胜概率=返奖/胜赔率=1/((1/胜赔率+1/平赔率+1/负赔率)*胜赔率)
//平概率=返奖/平赔率=1/((1/胜赔率+1/平赔率+1/负赔率)*平赔率)
//负概率=返奖/负赔率=1/((1/胜赔率+1/平赔率+1/负赔率)*负赔率)
- (NSString *)showTitle {
    return [NSString stringWithFormat:@"%@ %@ : %@ vs %@", self.leagueName, self.matchName, self.homeName, self.awayName];
}
- (NSString *)rewardRate {
    CGFloat win = [self.win floatValue];
    CGFloat equal = [self.equal floatValue];
    CGFloat lose = [self.lose floatValue];
    CGFloat rate = 1/(1/win+1/equal+1/lose);
    return [NSString stringWithFormat:@"%.1f%%", rate*100];
}
- (NSString *)winRate {
    CGFloat win = [self.win floatValue];
    CGFloat equal = [self.equal floatValue];
    CGFloat lose = [self.lose floatValue];
    CGFloat rate = 1/((1/win+1/equal+1/lose)*win);
    return [NSString stringWithFormat:@"%.1f%%", rate*100];
}
- (NSString *)equalRate {
    CGFloat win = [self.win floatValue];
    CGFloat equal = [self.equal floatValue];
    CGFloat lose = [self.lose floatValue];
    CGFloat rate = 1/((1/win+1/equal+1/lose)*equal);
    return [NSString stringWithFormat:@"%.1f%%", rate*100];
}
- (NSString *)loseRate {
    CGFloat win = [self.win floatValue];
    CGFloat equal = [self.equal floatValue];
    CGFloat lose = [self.lose floatValue];
    CGFloat rate = 1/((1/win+1/equal+1/lose)*lose);
    return [NSString stringWithFormat:@"%.1f%%", rate*100];
}
@end
