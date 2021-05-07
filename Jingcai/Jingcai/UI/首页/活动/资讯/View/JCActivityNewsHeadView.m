//
//  JCActivityNewsHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/4.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityNewsHeadView.h"
#import "JCActivityMatchCollectionCell.h"
#import "JCWMatchBall.h"
@implementation JCActivityNewsHeadView


- (void)initViews {
    
    UIView *bgView = [UIView new];
//    bgView.backgroundColor = UIColorFromRGB(0xFBBB46);
//    [bgView hg_setAllCornerWithCornerRadius:8];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"euro_img_banner");
    imgView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 136);
    [self addSubview:imgView];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(16,136+8, SCREEN_WIDTH-32, AUTO(140)) imageNamesGroup:nil];
    [cycleScrollView hg_setAllCornerWithCornerRadius:4];
//    cycleScrollView.backgroundColor= JCWhiteColor;
    cycleScrollView.delegate = self;
    cycleScrollView.backgroundColor = UIColorFromRGB(0xFBBB46);;
//    cycleScrollView.currentPageDotColor = [COLOR_000000 colorWithAlphaComponent:0.5];
    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.clipsToBounds = YES;
    [cycleScrollView hg_setAllCornerWithCornerRadius:8];

//        cycleScrollView.pageControlStyle = SDCycleScrollViewPageContolStyleAnimated;
//        cycleScrollView.pageControlDotSize = CGSizeMake(2, 2);
//    cycleScrollView.currentPageDotColor = JCBaseColor;
    cycleScrollView.autoScroll = NO;
//        cycleScrollView.autoScrollTimeInterval = 50;
    cycleScrollView.hidesForSinglePage = NO;
    cycleScrollView.showPageControl = YES;
    [bgView addSubview:cycleScrollView];

//        cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollView = cycleScrollView;
}

- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCActivityMatchCollectionCell class];
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCActivityMatchCollectionCell *myCell = (JCActivityMatchCollectionCell *)cell;
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

    JCWMatchBall *model = self.bannerArray[index];
    JCMatchDetailWMStickVC * detailVC = [JCMatchDetailWMStickVC new];
    detailVC.matchNum = model.match_id;
    [[self getViewController].navigationController pushViewController:detailVC animated:YES];
    
}

@end
