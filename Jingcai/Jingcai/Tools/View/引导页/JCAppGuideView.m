//
//  JCAppGuideView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAppGuideView.h"

@implementation JCAppGuideView

- (void)initViews {
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, SCREEN_WIDTH, SCREEN_HEIGHT) imageNamesGroup:nil];
    cycleScrollView.delegate = self;
    cycleScrollView.backgroundColor = JCWhiteColor;
//    cycleScrollView.currentPageDotColor = JCBaseColor;
    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.clipsToBounds = YES;
    cycleScrollView.autoScroll = NO;
    cycleScrollView.localizationImageNamesGroup = @[JCIMAGE(@"guid01"),JCIMAGE(@"guid02"),JCIMAGE(@"guid03"),JCIMAGE(@"guid04")];
    [self addSubview:cycleScrollView];
    self.cycleScrollView = cycleScrollView;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (index==3) {
        [self removeFromSuperview];
    }else{
        [self.cycleScrollView makeScrollViewScrollToIndex:index+1];
    }
}
//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
//    [self.cycleScrollView makeScrollViewScrollToIndex:index];
//}
@end
