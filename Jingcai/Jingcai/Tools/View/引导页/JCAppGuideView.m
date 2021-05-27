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
    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleToFill;
    cycleScrollView.clipsToBounds = YES;
    cycleScrollView.autoScroll = NO;
    cycleScrollView.showPageControl = NO;
    
    [self addSubview:cycleScrollView];
    self.cycleScrollView = cycleScrollView;
    [cycleScrollView disableScrollGesture];
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    self.cycleScrollView.localizationImageNamesGroup = dataArray;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (self.dataArray.count>0) {
        if (index==self.dataArray.count-1) {
            [self removeFromSuperview];
            if (self.JCBlock) {
                self.JCBlock();
            }
        }else{
            [self.cycleScrollView makeScrollViewScrollToIndex:index+1];
        }
    }

}
- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index {
//    [self.cycleScrollView makeScrollViewScrollToIndex:index];
}
@end
