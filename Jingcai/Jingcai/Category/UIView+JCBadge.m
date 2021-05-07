//
//  UIView+JCBadge.m
//  Jingcai
//
//  Created by Administrator on 2019/4/4.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "UIView+JCBadge.h"

#define JCBadgeTAG 23333

@implementation UIView (JCBadge)
@dynamic badgeStr;

- (void)setBadgeStr:(NSString *)badgeStr {
    [self removeBadgeLabel];
    if (badgeStr) {
        if ([badgeStr integerValue]) {
            [self addBadgeLabelWithBadge:badgeStr];
        }
        
        return ;
    }
}

- (void)addBadgeLabelWithBadge:(NSString *)badge {
    CGFloat len = 16;
    
    UILabel * badgeLabel = [[UILabel alloc] init];
//    badgeLabel.layer.cornerRadius = len/2;
//    badgeLabel.layer.masksToBounds = YES;
    badgeLabel.backgroundColor = [UIColor redColor];
    badgeLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:10];
    badgeLabel.textAlignment = NSTextAlignmentCenter;
    badgeLabel.textColor = [UIColor whiteColor];
    badgeLabel.tag = JCBadgeTAG;
    badgeLabel.text = badge;
    [self addSubview:badgeLabel];
    
    [self setNeedsLayout];
    CGFloat selfW = self.bounds.size.width;
    //CGFloat selfH = self.bounds.size.height;
    [badgeLabel hg_setAllCornerWithCornerRadius:6];
    badgeLabel.frame = CGRectMake(selfW/2.0f+4, 0, 17, 12);
}
- (void)removeBadgeLabel {
    UILabel * badgeLabel = [self viewWithTag:JCBadgeTAG];
    if (!badgeLabel) {
        return ;
    }
    [badgeLabel removeFromSuperview];
}
@end
