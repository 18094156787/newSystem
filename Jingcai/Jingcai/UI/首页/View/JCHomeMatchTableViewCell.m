//
//  JCHomeMatchTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeMatchTableViewCell.h"
#import "JCHomeMatchCollectionCell.h"
#import "JCWMatchBall.h"
@implementation JCHomeMatchTableViewCell

- (void)initViews {
    
        SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, SCREEN_WIDTH, AUTO(110)) imageNamesGroup:nil];
    cycleScrollView.backgroundColor= JCWhiteColor;
        cycleScrollView.delegate = self;
        cycleScrollView.backgroundColor = JCWhiteColor;
        cycleScrollView.currentPageDotColor = [COLOR_000000 colorWithAlphaComponent:0.5];
        cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        cycleScrollView.clipsToBounds = YES;

//        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
//        cycleScrollView.pageControlDotSize = CGSizeMake(2, 2);
//    cycleScrollView.currentPageDotColor = JCBaseColor;
        cycleScrollView.autoScroll = NO;
//        cycleScrollView.autoScrollTimeInterval = 50;
        cycleScrollView.hidesForSinglePage = NO;
        cycleScrollView.showPageControl = YES;
        [self.contentView addSubview:cycleScrollView];

//        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
        self.cycleScrollView = cycleScrollView;
}

- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCHomeMatchCollectionCell class];
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCHomeMatchCollectionCell *myCell = (JCHomeMatchCollectionCell *)cell;
    myCell.model = self.bannerArray[index];
}

- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray = bannerArray;
    NSMutableArray *array = [NSMutableArray array];
    [bannerArray enumerateObjectsUsingBlock:^(JCWMatchBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:@"1"];
    }];
    self.cycleScrollView.imageURLStringsGroup = array;
    

}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    NSMutableArray *array = [NSMutableArray array];
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:@"1"];
    }];
    self.cycleScrollView.imageURLStringsGroup = array;
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    if (self.clickEnable==2) {
        return;
    }
    JCWMatchBall *model = self.bannerArray[index];
    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
    detailVC.matchNum = model.match_id;
    [[self getViewController].navigationController pushViewController:detailVC animated:YES];
    
}




#pragma mark --懒加载
//- (NSMutableArray *)imageArray {
//    if (_imageArray == nil) {
//        _imageArray = [NSMutableArray array];
//    }
//    return _imageArray;
//}

@end
