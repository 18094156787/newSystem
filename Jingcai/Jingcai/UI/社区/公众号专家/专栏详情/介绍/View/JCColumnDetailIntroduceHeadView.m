//
//  JCColumnDetailIntroduceHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailIntroduceHeadView.h"
#import "JCColumnDetailIntroduceCollectionCell.h"
@implementation JCColumnDetailIntroduceHeadView

- (void)initViews {
    self.noticeCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 32) imageNamesGroup:nil];
    self.noticeCycleScrollView.delegate = self;
//    self.noticeCycleScrollView.clipsToBounds = YES;
    self.noticeCycleScrollView.showPageControl = NO;
    self.noticeCycleScrollView.autoScrollTimeInterval = 3;
    self.noticeCycleScrollView.backgroundColor = JCClearColor;
    self.noticeCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self addSubview:self.noticeCycleScrollView];
}

- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCColumnDetailIntroduceCollectionCell class];
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCColumnDetailIntroduceCollectionCell *myCell = (JCColumnDetailIntroduceCollectionCell *)cell;
//    myCell.model = self.titleArray[index];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
//    JCJingCaiAINoticeModel *model = self.titleArray[index];
//    JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
//    if (model.match_id) {
//        vc.matchNum = model.match_id;
//        [[self getViewController].navigationController pushViewController:vc animated:YES];
//    }

    
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    NSMutableArray *array = [NSMutableArray array];
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:@""];
    }];
    self.noticeCycleScrollView.imageURLStringsGroup = array;

    
    
}

@end
