//
//  JNMatchDrawCell.m
//  Jingcai
//
//  Created by Administrator on 2019/7/5.
//  Copyright © 2019 jingcai. All rights reserved.
//

#import "JNMatchDrawCell.h"
#import "JNMatchDrawItemView.h"
#import "JNMatchDetailZRPlayerItemView.h"
@interface JNMatchDrawCell ()
@property (nonatomic, strong) NSMutableArray * homeItemArr;
@property (nonatomic, strong) NSMutableArray * awayItemArr;
@end

@implementation JNMatchDrawCell
- (void)awakeFromNib {
    [super awakeFromNib];
    self.backgroundColor = COLOR_F0F0F0;
}
- (NSMutableArray *)homeItemArr {
    if (!_homeItemArr) {
        _homeItemArr = [NSMutableArray array];
    }
    return _homeItemArr;
}
- (NSMutableArray *)awayItemArr {
    if (!_awayItemArr) {
        _awayItemArr = [NSMutableArray array];
    }
    return _awayItemArr;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat selfW = self.bounds.size.width-30;
    CGFloat selfH = self.bounds.size.height-30;
    for (JNMatchDetailZRPlayerItemView * itemView in self.homeItemArr) {
        JNMatchLineupBall * lineupBall = itemView.lineupBall;
        CGFloat x = lineupBall.x * 0.01 * selfW;
        CGFloat y =  lineupBall.y * 0.01 * selfH * 0.5;
        itemView.center = CGPointMake(x+15, y+15);
    }
    for (JNMatchDetailZRPlayerItemView * itemView in self.awayItemArr) {
        JNMatchLineupBall * lineupBall = itemView.lineupBall;
        CGFloat x = selfW-lineupBall.x * 0.01 * selfW;
        CGFloat y = selfH- lineupBall.y * 0.01 * selfH*0.5;
        itemView.center = CGPointMake(x+15, y+15);
    }
}
- (void)setHomeArr:(NSArray *)homeArr {
    _homeArr = homeArr;
    [self.homeItemArr removeAllObjects];
    for (JNMatchLineupBall * lineupBall in homeArr) {
        if (lineupBall.x <= 0 && lineupBall.y <= 0) {
            continue ;
        }
        JNMatchDetailZRPlayerItemView * itemView = [JNMatchDetailZRPlayerItemView new];
        itemView.frame = CGRectMake(0, 0, AUTO(100), AUTO(60));
         itemView.isHomeTeam = YES;
        itemView.lineupBall = lineupBall;
       
        [self addSubview:itemView];
        [self.homeItemArr addObject:itemView];
    }
    [self setNeedsLayout];
}
- (void)setAwayArr:(NSArray *)awayArr {
    _awayArr = awayArr;
    [self.awayItemArr removeAllObjects];
    for (JNMatchLineupBall * lineupBall in self.awayArr) {
        if (lineupBall.x <= 0 && lineupBall.y <= 0) {
            continue ;
        }
        JNMatchDetailZRPlayerItemView * itemView = [JNMatchDetailZRPlayerItemView new];
        itemView.frame = CGRectMake(0, 0, AUTO(100), AUTO(60));
         itemView.isHomeTeam = NO;
        itemView.lineupBall = lineupBall;
        [self addSubview:itemView];
        [self.awayItemArr addObject:itemView];
    }
    [self setNeedsLayout];
}
- (CGFloat)contentH {
    UIImage *bgImage = [UIImage imageNamed:@"match_zr_bg"];
    CGFloat imgW = bgImage.size.width;
    CGFloat imgH = bgImage.size.height;
    CGFloat selfW = self.bounds.size.width;
    return selfW * imgH / imgW;
}
@end
