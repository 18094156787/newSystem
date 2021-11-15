//
//  JCDataModelBannerView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDataModelBannerView.h"

@implementation JCDataModelBannerView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
    }
    return self;
}
- (void)setupUI {
    self.backgroundColor = COLOR_F0F0F0;
    
    UIView *topView = [UIView new];
    topView.backgroundColor = JCWhiteColor;
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(64));
    [self addSubview:topView];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, self.bounds.size.height) imageNamesGroup:nil];
    cycleScrollView.delegate = self;
    cycleScrollView.backgroundColor = JCClearColor;
    cycleScrollView.placeholderImage = JCIMAGE(@"img_data_banner");
//    cycleScrollView.layer.cornerRadius = 3;
//    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
//    cycleScrollView.clipsToBounds = YES;
    cycleScrollView.autoScroll = NO;
    cycleScrollView.autoScrollTimeInterval = 3;
    cycleScrollView.showPageControl = NO;
    [cycleScrollView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [cycleScrollView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self addSubview:cycleScrollView];
    [cycleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsMake(AUTO(12), AUTO(12), AUTO(12), AUTO(12)));
        make.edges.insets(UIEdgeInsetsMake(AUTO(8), AUTO(8), 0, AUTO(8)));
    }];
    self.cycleScrollView = cycleScrollView;
    
}

//- (void)setBannerArray:(NSArray *)bannerArray {
//    _bannerArray = bannerArray;
//    NSMutableArray *dataArray = [NSMutableArray array];
//    for (JCWSlideBall *model in bannerArray) {
//        [dataArray addObject:model.image];
//    }
//    self.cycleScrollView.imageURLStringsGroup = dataArray;
//}


- (void)setUrl:(NSString *)url {
    _url = url;
    self.cycleScrollView.imageURLStringsGroup = @[url];
}



//- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
//
//    //跳转模块
//    JCWSlideBall * slide = self.bannerArray[index];
//    if (![JCWStringTool isEmptyStr:slide.app_url]) {
//        [JCPageRedirectManager redirectWithRoute:slide.app_url vc:[self getViewController]];
//        return ;
//    }
//    //网址无效不跳转
//    if (![JCWStringTool isUrlAddress:slide.url]) {
//        return ;
//    }
//    WebViewController *webVC = [WebViewController new];
//    webVC.urlStr = slide.url;
//    [[self getViewController].navigationController pushViewController:webVC animated:YES];
//
//}
@end
