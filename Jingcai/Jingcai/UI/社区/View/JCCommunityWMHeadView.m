//
//  JCCommunityWMHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunityWMHeadView.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
@implementation JCCommunityWMHeadView

- (void)initViews {
//    self.backgroundColor= COLOR_F0F0F0;
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, SCREEN_WIDTH, AUTO(190)+kNavigationBarHeight) imageNamesGroup:nil];
//    [cycleScrollView hg_setAllCornerWithCornerRadius:AUTO(5)];
    cycleScrollView.delegate = self;
    cycleScrollView.backgroundColor = JCWhiteColor;
    cycleScrollView.placeholderImage = JCIMAGE(@"ic_banner_default");
//    cycleScrollView.currentPageDotColor = JCBaseColor;
    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.clipsToBounds = YES;
    cycleScrollView.pageControlBottomOffset = AUTO(20);
//    cycleScrollView.autoScroll = NO;
    cycleScrollView.autoScrollTimeInterval = 3;
//    cycleScrollView.showPageControl = NO;
    [self addSubview:cycleScrollView];
//    cycleScrollView.pageControlAliment = SDCycleScrollViewPageContolAlimentRight;
    self.cycleScrollView = cycleScrollView;
    
    UIView *colorView = [UIView new];
    colorView.backgroundColor = JCWhiteColor;
    [colorView hg_setCornerOnTopWithRadius:AUTO(5)];
    [self addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(cycleScrollView);
        make.height.mas_equalTo(AUTO(0));
    }];

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
        //跳转模块
        JCWSlideBall * slide = self.bannerArray[index];
        if ([slide.app_url containsString:@"huodong_"]) {
            NSArray *array = [slide.app_url componentsSeparatedByString:@"_"];
            if (array.count==3) {
                NSString *type = array[1];
                NSString *act_id = array[2];
                if ([type integerValue]==2||[type integerValue]==3) {
                    JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
                    vc.actID = act_id;
                    [[self getViewController].navigationController pushViewController:vc animated:YES];
                }
                if ([type integerValue]==4) {
                    JCActivityGuessVC *vc = [JCActivityGuessVC new];
                    vc.actID = act_id;
                    [[self getViewController].navigationController pushViewController:vc animated:YES];
                }
                
                
            }
        }else {
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


    }

    
    
}

@end
