//
//  JCRechargeTextBannerView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCRechargeTextBannerView.h"
#import "JCRechargeBannerTextCell.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "JCActivityKindVC.h"
#import "JCActivityGuess_SPF_VC.h"
#import "JCActivityGuess_SPF_More_VC.h"
@implementation JCRechargeTextBannerView

- (void)initViews {
    self.backgroundColor = [UIColorFromRGB(0xEF802F) colorWithAlphaComponent:0.15];
    UIImageView *imageView = [UIImageView new];
    imageView.image = JCIMAGE(@"icon_notic_st1_24_sel");
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(16);
        make.centerY.equalTo(self);
        make.width.height.mas_equalTo(16);
    }];
    [self addSubview:self.tipCycleScrollView];



}


- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCRechargeBannerTextCell class];
    
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCRechargeBannerTextCell *myCell = (JCRechargeBannerTextCell *)cell;
    JCWSlideBall *slide = self.tipArray[index];
    myCell.content = slide.desc;

}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    JCWSlideBall *slide = self.tipArray[index];
    [self pushWithSlide:slide];

    
    
}

- (void)pushWithSlide:(JCWSlideBall *)slide {
    if ([slide.type integerValue]==1) {

        if (![JCWStringTool isEmptyStr:slide.app_url]) {
            [JCPageRedirectManager redirectWithRoute:slide.app_url vc:[self getViewController]];
            return ;
        }
        //网址无效不跳转
        if (![JCWStringTool isUrlAddress:slide.url]) {
            return ;
        }
        WebViewController *webVC = [WebViewController new];
        webVC.urlStr = slide.url;
        [[self getViewController].navigationController pushViewController:webVC animated:YES];
    }

    if ([slide.type integerValue]==2||[slide.type integerValue]==3) {
//            [[self getViewController].navigationController pushViewController:[JcActivitySquareVC new] animated:NO];
        JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
        vc.actID = slide.activity_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    if ([slide.type integerValue]==4) {
        JCActivityGuessVC *vc = [JCActivityGuessVC new];
        vc.actID = slide.activity_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    if ([slide.type integerValue]==5) {
        JCActivityKindVC *vc = [JCActivityKindVC new];
        vc.actID = slide.activity_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    if ([slide.type integerValue]==6) {
        JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
        vc.actID = slide.activity_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    if ([slide.type integerValue]==7) {
        JCActivityGuess_SPF_More_VC *vc = [JCActivityGuess_SPF_More_VC new];
        vc.actID = slide.activity_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }

}


- (void)setTipArray:(NSArray *)tipArray {
    _tipArray = tipArray;
    NSMutableArray *array = [NSMutableArray array];
    [tipArray enumerateObjectsUsingBlock:^(JCWSlideBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:NonNil(obj.desc)];
    }];
    self.tipCycleScrollView.imageURLStringsGroup = array;
}

- (UIView *)tipBgView {
    if (!_tipBgView) {
        _tipBgView = [UIView new];
    }
    return _tipBgView;
}

- (SDCycleScrollView *)tipCycleScrollView {
    if (!_tipCycleScrollView) {
        _tipCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(40,0, SCREEN_WIDTH-40, 40) imageNamesGroup:nil];
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
