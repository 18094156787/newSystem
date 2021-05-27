//
//  JCRechareHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCRechareHeadView.h"

@implementation JCRechareHeadView

- (void)initViews {

    [self addSubview:self.cycleScrollView];
//    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollView = self.cycleScrollView;
    


}

- (SDCycleScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, SCREEN_WIDTH, AUTO(190)+kNavigationBarHeight) imageNamesGroup:nil];
    //    [cycleScrollView hg_setAllCornerWithCornerRadius:AUTO(5)];
        _cycleScrollView.delegate = self;
        _cycleScrollView.backgroundColor = JCWhiteColor;
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.clipsToBounds = YES;
        _cycleScrollView.pageControlBottomOffset = AUTO(20);
        _cycleScrollView.autoScrollTimeInterval = 3;
    }
    return _cycleScrollView;
}

- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray = bannerArray;
    NSMutableArray *urlArray = [NSMutableArray array];
    for (JCWSlideBall *item in self.bannerArray) {
        [urlArray addObject:item.image];
    }
    self.cycleScrollView.imageURLStringsGroup= urlArray;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    if (cycleScrollView==self.cycleScrollView) {

    }

    
    
}

@end
