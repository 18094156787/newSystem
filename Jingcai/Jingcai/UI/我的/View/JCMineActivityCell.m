//
//  JCMineActivityCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMineActivityCell.h"
#import "JCYCMyFriendViewController.h"
#import "JcActivitySquareVC.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "JCActivityKindVC.h"
#import "JCActivityGuess_SPF_VC.h"
#import "JCActivityGuess_SPF_More_VC.h"
@implementation JCMineActivityCell

- (void)initViews {
    
    UIView *bgView = [UIView new];
    bgView.userInteractionEnabled = YES;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(0);
        make.bottom.offset(0);
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"活动广场" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UIImageView *indicateImgView = [UIImageView new];
    indicateImgView.image = JCIMAGE(@"mine_arrow_gray");
    [bgView addSubview:indicateImgView];
    [indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-AUTO(12));
        make.centerY.equalTo(titleLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(7), AUTO(12)));
    }];
    
    UILabel *moreLab = [UILabel initWithTitle:@"查看更多" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    moreLab.userInteractionEnabled = YES;
    [bgView addSubview:moreLab];
    [moreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(indicateImgView.mas_left).offset(-2);
        make.centerY.equalTo(titleLab);
        make.height.mas_equalTo(AUTO(35));
    }];
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(AUTO(12),AUTO(36), SCREEN_WIDTH-AUTO(40), AUTO(112)) imageNamesGroup:nil];
    cycleScrollView.delegate = self;
    cycleScrollView.backgroundColor = JCWhiteColor;
//    cycleScrollView.currentPageDotColor = JCBaseColor;
    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.clipsToBounds = YES;
    cycleScrollView.autoScrollTimeInterval = 3;
    [bgView addSubview:cycleScrollView];
//    cycleScrollView.pageControlBottomOffset = AUTO(20);
    cycleScrollView.hidesForSinglePage = NO;
    self.cycleScrollView = cycleScrollView;
    
    WeakSelf;
    [moreLab bk_whenTapped:^{
        [[weakSelf getViewController].navigationController pushViewController:[JcActivitySquareVC new] animated:YES];
    }];
}

- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    
//    WebViewController *webVC = [WebViewController new];
//    webVC.urlStr = @"http://wap.weicaizq.com/zucai/informationdetails/5335";
//    [[self getViewController].navigationController pushViewController:webVC animated:YES];
//    return;
    
    if (self.bannerArray.count==0) {
        [self pushInviteFriendVC];
        return;
    }
    
    if (cycleScrollView==self.cycleScrollView) {
        JCWSlideBall * slide = self.bannerArray[index];
        
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
            webVC.titleStr = slide.title;
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
        if ([slide.type integerValue]==7) {
            JCActivityGuess_SPF_More_VC *vc = [JCActivityGuess_SPF_More_VC new];
            vc.actID = slide.id;
            [[self getViewController].navigationController pushViewController:vc animated:YES];
        }

        
        

    }

    
}

- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray = bannerArray;
    NSMutableArray *urlArray = [NSMutableArray array];
    for (JCWSlideBall *item in self.bannerArray) {
        [urlArray addObject:item.img_url];
    }
    
    if (self.bannerArray.count>0) {
        self.cycleScrollView.imageURLStringsGroup= urlArray;
    }else{
        self.cycleScrollView.localizationImageNamesGroup = @[@"activity_img_invite"];
    }
    

}

//邀请好友
- (void)pushInviteFriendVC {
    if (![JCWUserBall currentUser]) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [[self getViewController].navigationController pushViewController:[JCLoginWMStickVC new] animated:YES];
        });
        return ;
    }
    [[self getViewController].navigationController pushViewController:[JCYCMyFriendViewController new] animated:YES];
}

@end
