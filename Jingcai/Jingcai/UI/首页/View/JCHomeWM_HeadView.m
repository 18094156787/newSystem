//
//  JCHomeWM_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/24.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeWM_HeadView.h"
#import "JCYCHomeWMStickVC.h"
#import "JCHomeTitleView.h"
#import "JCExpertWMViewController.h"
#import "JCTopRankListWMVC.h"
#import "JCMainTabBarController.h"
#import "JCSpecialAttentionVC.h"
#import "JNTabBar.h"
#import "JCActivityDetailCommomVC.h"
#import "JCActivityGuessVC.h"
#import "WebViewController.h"
#import "JCActivityKindVC.h"
#import "JCActivityGuess_SPF_VC.h"
#import "JCActivityGuess_SPF_More_VC.h"
@implementation JCHomeWM_HeadView

- (void)initViews {
    UIView *topView = [UIView new];
    topView.backgroundColor = JCWhiteColor;
    topView.frame = CGRectMake(0, 0, SCREEN_WIDTH, 200);
    [self addSubview:topView];
    
    
    
    
    self.backgroundColor= COLOR_F0F0F0;
    
    SDCycleScrollView *cycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0,0, SCREEN_WIDTH, AUTO(190)+kNavigationBarHeight) imageNamesGroup:nil];
    cycleScrollView.delegate = self;
    cycleScrollView.backgroundColor = JCWhiteColor;
//    cycleScrollView.currentPageDotColor = JCBaseColor;
    cycleScrollView.bannerImageViewContentMode = UIViewContentModeScaleAspectFill;
    cycleScrollView.clipsToBounds = YES;
    cycleScrollView.autoScrollTimeInterval = 3;
    cycleScrollView.placeholderImage = JCIMAGE(@"ic_banner_default");
    [self addSubview:cycleScrollView];
    cycleScrollView.pageControlBottomOffset = AUTO(20);
    
    id cache = [[NSUserDefaults standardUserDefaults] objectForKey:JCHomeCache];
    if (!cache) {
        cycleScrollView.placeholderImage = JCIMAGE(@"banner_cache");
    }
    self.cycleScrollView = cycleScrollView;
    
    UIView *colorView = [UIView new];
    colorView.backgroundColor = JCWhiteColor;
    [colorView hg_setCornerOnTopWithRadius:AUTO(5)];
    [self addSubview:colorView];
    [colorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(cycleScrollView);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = JCWhiteColor;
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.right.offset(0);
        make.top.equalTo(self.cycleScrollView.mas_bottom).offset(0);
        make.height.mas_equalTo(AUTO(70));
//        make.bottom.offset(AUTO(-10));
    }];

    
    float length = (SCREEN_WIDTH - AUTO(48)*4)/4.0f;
    NSArray *imgArray = @[JCIMAGE(@"icon_mjtj"),JCIMAGE(@"icon_hbdr"),JCIMAGE(@"icon_tbgx"),JCIMAGE(@"icon_help")];
    NSArray *titleArray = @[@"公众号专家",@"红榜达人",@"特别关注",@"帮助&客服"];
    for (int i=0; i<4; i++) {
        UIButton *btn = [UIButton new];
        [btn setImage:imgArray[i] forState:0];
         [btn setImage:imgArray[i] forState:UIControlStateHighlighted];
        btn.tag = 100+i;
        btn.frame = CGRectMake(length/2.0f+(length+AUTO(48))*i, AUTO(-3), AUTO(40), AUTO(40));
        [bottomView addSubview:btn];
        
        UILabel *label = [UILabel initWithTitle:titleArray[i] andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        [bottomView addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(btn);
            make.top.equalTo(btn.mas_bottom).offset(0);
        }];
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    
    
    //
    
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.equalTo(bottomView.mas_bottom).offset(AUTO(8));
        
    }];
    
    
    
    [self.tableView registerClass:[JCHomeExpertTableViewCell class] forCellReuseIdentifier:@"JCHomeExpertTableViewCell"];
    [self.tableView registerClass:[JCHomeMatchTableViewCell class] forCellReuseIdentifier:@"JCHomeMatchTableViewCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    
 
}




- (void)setBannerArray:(NSArray *)bannerArray {
    _bannerArray = bannerArray;
    NSMutableArray *urlArray = [NSMutableArray array];
    for (JCWSlideBall *item in self.bannerArray) {
        [urlArray addObject:item.image];
    }
    self.cycleScrollView.imageURLStringsGroup= urlArray;
}

- (void)btnClick:(UIButton *)sender {
    if (self.clickEnable==2) {
        return;
    }
    if (sender.tag==100) {
        JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
         [tabBarController showGZHVC];
    }
    if (sender.tag==101) {
        JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
         [tabBarController showHBVC];

    }
    
    if (sender.tag==102) {

//    JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
//        [tabBarController showYCVC];
        if ([JCWUserBall currentUser].token.length==0) {
            [self presentLogin];
            return;
        }
        JCSpecialAttentionVC *vc = [JCSpecialAttentionVC new];
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    if (sender.tag==103) {
        WebViewController *vc = [WebViewController new];
        vc.titleStr = @"帮助&客服";
        NSString *url = [NSString stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_customer];
        vc.urlStr = NonNil(url);
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
}

#pragma mark <UITableViewDataSource>

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        return AUTO(110);
    }

    if (indexPath.section==1) {
      return  self.matchArray.count>0?AUTO(110):0;
//        return AUTO(95);
    }
    return AUTO(112);
}



- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.001f;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    if (section==0) {
        JCHomeTitleView *view = [JCHomeTitleView new];
        view.titleLab.text = @"热门专家";
        WeakSelf;
        [view.infoBgView bk_whenTapped:^{
            JCExpertWMViewController * vc = [JCExpertWMViewController new];
            [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        }];
        return view;
    }

    return [UIView new];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section==0) {
        return AUTO(40);
    }
    if (section==1) {
        return 0.001f;
    }
    return  0.001f;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section==0) {
        JCHomeExpertTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHomeExpertTableViewCell"];
        cell.collectionView.scrollEnabled = NO;
        cell.dataSource = self.expertArray;
        self.expertCell = cell;
        return cell;
    }
    if (indexPath.section==1&&self.matchArray.count>0) {
        JCHomeMatchTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"JCHomeMatchTableViewCell"];
        cell.bannerArray = self.matchArray;
        self.matchCell = cell;
        return cell;
    }
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell"];
//    cell.textLabel.text = @"11111";
    return cell;
}
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch
{  // 输出点击的view的类名
// 若为UITableViewCellContentView（即点击了tableViewCell），则不截获Touch事件
    if ([NSStringFromClass([touch.view class]) isEqualToString:@"UITableViewCellContentView"])
    {
        return NO;
    }  //截获Touch事件
    return  YES;

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

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
                if ([type integerValue]==5) {
                    JCActivityKindVC *vc = [JCActivityKindVC new];
                    vc.actID = act_id;
                    [[self getViewController].navigationController pushViewController:vc animated:YES];
                }
                if ([type integerValue]==6) {
                    JCActivityGuess_SPF_VC *vc = [JCActivityGuess_SPF_VC new];
                    vc.actID = act_id;
                    [[self getViewController].navigationController pushViewController:vc animated:YES];
                }
                if ([type integerValue]==7) {
                    JCActivityGuess_SPF_More_VC *vc = [JCActivityGuess_SPF_More_VC new];
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
            webVC.isHomeBanner = YES;
            webVC.slide = slide;
            webVC.urlStr = slide.url;
            webVC.titleStr = @"鲸猜足球";
            [[self getViewController].navigationController pushViewController:webVC animated:YES];
            
        }


    }

    
}

- (void)setExpertArray:(NSMutableArray *)expertArray {
    _expertArray = expertArray;
    [self.tableView reloadData];
    self.expertCell.clickEnable = self.clickEnable;
     self.matchCell.clickEnable = self.clickEnable;
}

- (void)setMatchArray:(NSMutableArray *)matchArray {
    _matchArray = matchArray;
    [self.tableView reloadData];
    self.expertCell.clickEnable = self.clickEnable;
     self.matchCell.clickEnable = self.clickEnable;
}

- (void)setClickEnable:(NSInteger)clickEnable {
    _clickEnable = clickEnable;
    self.expertCell.clickEnable = clickEnable;
    self.matchCell.clickEnable = clickEnable;
}


- (UITableView *)tableView {
    if (!_tableView) {
        
        UITableView *view = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        view.dataSource = self;
        view.delegate = self;
        view.separatorStyle = UITableViewCellSeparatorStyleNone;

        view.showsVerticalScrollIndicator = NO;
        //        view.delaysContentTouches = NO;
        view.estimatedSectionHeaderHeight = 0;
        view.estimatedSectionFooterHeight = 0;
        view.backgroundColor = JCClearColor;
//        view.scrollEnabled = NO;
        //注册cell
        [view registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        
        _tableView = view;

        
    }
    
    return _tableView;
}

@end
