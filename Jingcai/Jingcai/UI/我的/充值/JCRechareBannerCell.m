//
//  JCRechareBannerCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/27.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCRechareBannerCell.h"
#import "JCRechargeBannerTextCell.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "JCActivityKindVC.h"
#import "JCActivityGuess_SPF_VC.h"
//#import <SDCycleScrollView.h>
@implementation JCRechareBannerCell

- (void)initViews {
    [self.contentView addSubview:self.cycleScrollView];
    self.cycleScrollView = self.cycleScrollView;
    
    [self.contentView addSubview:self.textBannerView];
    [self.textBannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(40);
    }];

}





- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
    JCWSlideBall *slide = self.bannerArray[index];
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
        vc.actID = slide.id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    if ([slide.type integerValue]==4) {
        JCActivityGuessVC *vc = [JCActivityGuessVC new];
        vc.actID = slide.id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }

    if ([slide.type integerValue]==5) {
        JCActivityKindVC *vc = [JCActivityKindVC new];
        vc.actID = slide.id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    if ([slide.type integerValue]==6) {
        JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
        vc.actID = slide.id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
}

- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray = bannerArray;
    NSMutableArray *urlArray = [NSMutableArray array];
    for (JCWSlideBall *item in self.bannerArray) {
        [urlArray addObject:item.img_url];
    }
    self.cycleScrollView.imageURLStringsGroup= urlArray;
    self.cycleScrollView.hidden = urlArray.count>0?NO:YES;
}

- (void)setTipArray:(NSArray *)tipArray {
    _tipArray = tipArray;
    self.textBannerView.hidden = tipArray.count>0?NO:YES;
    self.textBannerView.tipArray = tipArray;
}

- (SDCycleScrollView *)cycleScrollView {
    if (!_cycleScrollView) {
        _cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(16,8, SCREEN_WIDTH-32, 112) imageNamesGroup:nil];
    //    [cycleScrollView hg_setAllCornerWithCornerRadius:AUTO(5)];
        _cycleScrollView.delegate = self;
        _cycleScrollView.backgroundColor = JCWhiteColor;
        _cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
        _cycleScrollView.clipsToBounds = YES;
        _cycleScrollView.autoScrollTimeInterval = 3;
    }
    return _cycleScrollView;
}

- (JCRechargeTextBannerView *)textBannerView {
    if (!_textBannerView) {
        _textBannerView = [JCRechargeTextBannerView new];
        _textBannerView.hidden = YES;
    }
    return _textBannerView;
}



@end
