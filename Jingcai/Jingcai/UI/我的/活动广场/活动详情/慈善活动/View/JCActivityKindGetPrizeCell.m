//
//  JCActivityKindGetPrizeCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/31.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindGetPrizeCell.h"

@implementation JCActivityKindGetPrizeCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    self.contentView.backgroundColor = JCClearColor;
    [self addSubview:self.tipBgView];
    [self.tipBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.right.offset(-16);
        make.top.offset(0);
        make.height.mas_equalTo(32);
    }];
    
    
//    self.backgroundColor = UIColorFromRGB(0xFFFAF0);
    UIImageView *imageView = [UIImageView new];
    imageView.image = JCIMAGE(@"ic_kind_vioce");
    [self.tipBgView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.centerY.equalTo(self);
        make.width.mas_equalTo(16);
        make.height.mas_equalTo(14);
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = [COLOR_FB5835 colorWithAlphaComponent:0.4];
    [self.tipBgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(38);
        make.centerY.equalTo(self.tipBgView);
        make.size.mas_equalTo(CGSizeMake(1, 14));
    }];
    
    [self.tipBgView addSubview:self.tipCycleScrollView];



}


- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCRechargeBannerTextCell class];
    
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCRechargeBannerTextCell *myCell = (JCRechargeBannerTextCell *)cell;
    myCell.titleLab.textColor = COLOR_FB5835;
    myCell.titleLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    JCSignBannerModel *slide = self.tipArray[index];
    myCell.content = [NSString stringWithFormat:@"恭喜 %@ 达成活动目标！",slide.user_name];

}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
//    JCWSlideBall *slide = self.tipArray[index];
//    [self pushWithSlide:slide];

    
    
}

//- (void)pushWithSlide:(JCWSlideBall *)slide {
//    if ([slide.type integerValue]==1) {
//
//        if (![JCWStringTool isEmptyStr:slide.app_url]) {
//            [JCPageRedirectManager redirectWithRoute:slide.app_url vc:[self getViewController]];
//            return ;
//        }
//        //网址无效不跳转
//        if (![JCWStringTool isUrlAddress:slide.url]) {
//            return ;
//        }
//        WebViewController *webVC = [WebViewController new];
//        webVC.urlStr = slide.url;
//        [[self getViewController].navigationController pushViewController:webVC animated:YES];
//    }
//
//    if ([slide.type integerValue]==2||[slide.type integerValue]==3) {
////            [[self getViewController].navigationController pushViewController:[JcActivitySquareVC new] animated:NO];
//        JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
//        vc.actID = slide.activity_id;
//        [[self getViewController].navigationController pushViewController:vc animated:YES];
//    }
//    if ([slide.type integerValue]==4) {
//        JCActivityGuessVC *vc = [JCActivityGuessVC new];
//        vc.actID = slide.activity_id;
//        [[self getViewController].navigationController pushViewController:vc animated:YES];
//    }
//}


- (void)setTipArray:(NSArray *)tipArray {
    _tipArray = tipArray;
    NSMutableArray *array = [NSMutableArray array];
    [tipArray enumerateObjectsUsingBlock:^(JCSignBannerModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:obj.user_name];
    }];
    self.tipCycleScrollView.imageURLStringsGroup = array;
}

- (UIView *)tipBgView {
    if (!_tipBgView) {
        _tipBgView = [UIView new];
        [_tipBgView hg_setAllCornerWithCornerRadius:20];
        _tipBgView.backgroundColor = UIColorFromRGB(0xFFFAF0);
    }
    return _tipBgView;
}

- (SDCycleScrollView *)tipCycleScrollView {
    if (!_tipCycleScrollView) {
        _tipCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(54,0, SCREEN_WIDTH-85, 32) imageNamesGroup:nil];
    //    [cycleScrollView hg_setAllCornerWithCornerRadius:AUTO(5)];
        _tipCycleScrollView.delegate = self;
        _tipCycleScrollView.backgroundColor = JCClearColor;
        _tipCycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
//        _tipCycleScrollView.clipsToBounds = YES;
        _tipCycleScrollView.autoScrollTimeInterval = 3;
        _tipCycleScrollView.showPageControl = NO;
        _tipCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    }
    return _tipCycleScrollView;
}

@end
