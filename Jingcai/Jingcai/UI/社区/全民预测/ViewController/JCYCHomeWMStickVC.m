//
//  JCYCHomeWMStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCHomeWMStickVC.h"
#import "JCYCHomeHeadView.h"
#import "JCYCHomeViewController.h"
#import "JCYCHomeFootView.h"
#import "JCParticipateJingCaiTipView.h"
#import "JCJingCaiReasonView.h"
#import "JCYCCheckView.h"
#import "JCYCResultModel.h"
#import "JCYCSuccessViewController.h"
#import "JCYCMyFriendViewController.h"
#import "JCLoginLotteryVC.h"
#import "JCTitleBannerModel.h"
#import "JCYCResustShowView.h"//预测结果
#import "JCYCQianYueShowView.h"//签约邀请
#import "JCYCResustOnListView.h"//上周入榜
#import "JCYCResustNotOnListView.h"//上周未入榜
#import "JCYuceCommomModel.h"
#import "JCYuCeWeekResultModel.h"
#import "JCQianYueModel.h"
#import "JCJingCaiResultMatchModel.h"
#import "JCYCUserInfoModel.h"
#import "JCMainTabBarController.h"
#import "JNTabBar.h"
#import "JCCommunityWMStickHomeVC.h"
#import "JCPostCheckRuleVC.h"
#import "JCYuceSettingModel.h"
#import "JCAppGuideView.h"
static CGFloat const kWMMenuViewHeight = 0;
@interface JCYCHomeWMStickVC ()<WMStickyPageControllerDelegate>

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic,strong) JCYCHomeViewController *homeVC;

@property (nonatomic, strong) JCYCHomeHeadView *topHeadView;

@property (nonatomic, strong) JCYCHomeFootView *bottomView;

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) JCParticipateJingCaiTipView *tipView;

@property (nonatomic,strong) JCJingCaiMatchModel *currentJingModel;//当前选择的预测

@property (nonatomic,assign) BOOL inputReason;//是否需要填写精彩理由

@property (nonatomic,strong) JCYCCheckView *checkView;//参与预测二次确认页面

@property (nonatomic,strong) JCYuCeWeekResultModel *weekResultModel;//每周开奖结果

@property (nonatomic,strong) NSArray *dayYuceResultArray;//每日预测结果

@property (nonatomic,strong) JCYCUserInfoModel *yueceResultModel;//每日预测

@property (nonatomic,strong) JCQianYueModel *qianyueModel;//签约

@property (nonatomic,strong) JCYCResustShowView *yuceResultView;//每日开奖结果


@property (nonatomic,strong) JCYCResustOnListView *weekInView;//上周入榜

@property (nonatomic,strong) JCYCResustNotOnListView *weekOutView;//上周未入榜

@property (nonatomic,strong) JCYCQianYueShowView *qianYueView;//签约邀请

@property (nonatomic,strong) UIRefreshControl *refreshControl;

@property (nonatomic,strong) JCYuceSettingModel *settingModel;

@property (nonatomic,strong) NSString *sing_value;//选择单场赔率限制

@property (nonatomic,strong) NSString *double_value;//选择双场赔率限制

@property (nonatomic,strong) NSString *total_value;//选择双场总赔率限制

@property (nonatomic,assign) NSInteger yc_count;

@end

@implementation JCYCHomeWMStickVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self showInfo];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
    self.bottomView.hidden = YES;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@""];
    }
    return _titleArray;
}


- (instancetype)init {
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 5;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = JCBaseColor;
        self.titleColorNormal = JCWhiteColor;
        self.titleSizeNormal = 14;
        self.titleSizeSelected = 14;
        self.progressHeight = 4;
        self.progressWidth = 28;
        self.viewTop = kWMHeaderViewHeight;
        self.menuViewHeight = 0;
        self.maximumHeaderViewHeight = kWMHeaderViewHeight;
//        self.minimumHeaderViewHeight = 0;
        self.delegate = self;
//        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = COLOR_F0F0F0;
    self.contentView.backgroundColor = COLOR_F0F0F0;
    self.title= @"全民鲸猜";
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWMHeaderViewHeight);
    [self.view addSubview:self.topHeadView];
    WeakSelf;
    self.topHeadView.JCColorBlock = ^(UIColor * _Nonnull color) {
        weakSelf.contentView.backgroundColor = color;
    };
    //默认配置
    self.sing_value = @"1.4";
    self.double_value = @"2.0";
    self.total_value = @"5.6";
    [self initViews];
    [self getSettingData];
    [self getHomeData];
    [self getYuceResult];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jcRefresh) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLoginOutRefresh) name:NotificationUserLogout object:nil];
    [self showGuideView];
//    [self showQianYueView];
    
    

    

}


- (void)userLoginToRefresh {
    [self getYuceResult];
    [self.homeVC refreshData];
}

- (void)userLoginOutRefresh {
    [self.homeVC refreshData];
}

- (void)getSettingData {
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getYuceSettingWithSuccess:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            JCYuceSettingModel *model = (JCYuceSettingModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCYuceSettingModel class]];
            self.sing_value = model.radio_min;
            self.double_value = model.select_min;
            self.total_value = model.select_sum;
            self.settingModel = model;
            self.homeVC.settingModel = self.settingModel;
//            [self showChanceCount:model.future_num]
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        
    }];

}

- (void)getHomeData {
    
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getJingcaiHomeDataWithCompetition_id:@"0" page:1 success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *titleArray = [JCWJsonTool arrayWithJson:object[@"data"][@"red_packet_banner"] class:[JCTitleBannerModel class]];

            self.topHeadView.titleArray = titleArray;
            JCYuceCommomModel *model = (JCYuceCommomModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCYuceCommomModel class]];
            [self showChanceCount:model.future_num];
            self.yc_count = [model.future_num integerValue];
            
        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];


}


//预测结果,每天开奖,每周入榜
- (void)getYuceResult {
    if (![JCWUserBall currentUser]) {
        return;
    }
//    [self.fatherView showLoading];
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    [service getJingcaiUserYC_ResultWithsuccess:^(id  _Nullable object) {
        NSLog(@"开奖%@",object);
        [self.fatherView endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            if ([object[@"data"] isKindOfClass:[NSDictionary class]]) {
                NSLog(@"预测开奖数据%@",object);
                self.weekResultModel = (JCYuCeWeekResultModel *)[JCWJsonTool entityWithJson:object[@"data"][@"future_gift"] class:[JCYuCeWeekResultModel class]];//每周上榜
//                self.dayYuceResultArray = [NSArray yy_modelArrayWithClass:[JCJingCaiResultMatchModel class] json:object[@"data"][@"future_result"][@"future_info"]];
                self.yueceResultModel = (JCYCUserInfoModel *)[JCWJsonTool entityWithJson:object[@"data"][@"future_result"] class:[JCYCUserInfoModel class]];
                self.qianyueModel =  (JCQianYueModel *)[JCWJsonTool entityWithJson:object[@"data"][@"future_sign"] class:[JCQianYueModel class]];

                [self showWeekView];


            }


        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.fatherView endLoading];
    }];

 
}

- (void)initViews {

     UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"yuce_share") style:0 target:self action:@selector(shareItemClick)];
    shareItem.tintColor = JCWhiteColor;
    self.navigationItem.rightBarButtonItem = shareItem;
    
    self.bottomView.backgroundColor = JCWhiteColor;
    self.bottomView.frame = CGRectMake(0,  SCREEN_HEIGHT-100-kTabBarHeight, SCREEN_HEIGHT, 90);

    self.bottomView.hidden = YES;
    [[UIApplication sharedApplication].keyWindow addSubview:self.bottomView];

    [self.bottomView.submitBtn addTarget:self action:@selector(submitBtnClick) forControlEvents:UIControlEventTouchUpInside];
    UIRefreshControl *refreshControl = [[UIRefreshControl alloc] init];
    refreshControl.tintColor = [UIColor whiteColor];
    refreshControl.attributedTitle = [[NSAttributedString alloc] initWithString:@""];
    [refreshControl addTarget:self action:@selector(jcRefresh) forControlEvents:UIControlEventValueChanged];
    refreshControl.tintColor = COLOR_999999;
//    listTableView.refreshControl = refreshControl;
    self.refreshControl = refreshControl;
    self.contentView.refreshControl = refreshControl;
    
        CGRect bounds = refreshControl.bounds;
//        bounds.origin.x = 50;//左移 50
    //    rect.origin.x = -50;//右移 50
        bounds.origin.y = 0;//上移 10;
    //    rect.origin.y = -10;//下移 10;
        refreshControl.bounds = bounds;
//    self.contentView.mj_header = [MJRefreshHeader headerWithRefreshingBlock:^{
//
//        [self.homeVC refreshData];
//
//    }];
}

- (void)jcRefresh {
    [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        model.isSelect = NO;
        [model.requestModel.btnArray removeAllObjects];
//        model.requestModel = [JCJingCaiMatchRequstInfoModel new];
    }];
    [self.currentJingModel.requestModel.btnArray removeAllObjects];
//    self.checkView.dataArray = @[];
    [self getSettingData];
    [self getHomeData];
    [self.homeVC refreshData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

}

- (void)btnClicked:(id)sender {
    NSLog(@"touch up inside");
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - ScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [super scrollViewDidScroll:scrollView];
//    if (scrollView.contentOffset.y < 0) {
//        [self.view setNeedsLayout];
//    }
    CGFloat offsetY = self.contentView.contentOffset.y;
    NSLog(@"%.0f",offsetY);

}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    self.homeVC = [JCYCHomeViewController new];
    self.homeVC.fatherView = self.fatherView;
    WeakSelf;
    self.homeVC.JCBlock = ^(NSArray * _Nonnull array) {
        weakSelf.dataArray = array;
        [weakSelf showInfo];
    };
    self.homeVC.JCEndRefreshBlock = ^{
//        [weakSelf.contentView.mj_header endRefreshing];
        [weakSelf.refreshControl endRefreshing];
    };
    return self.homeVC;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
//    menuView.backgroundColor = JCWhiteColor;
//    self.lineView.frame = CGRectMake(0, 43, SCREEN_WIDTH, 1);
//    [menuView addSubview:self.lineView];
    menuView.backgroundColor = JCWhiteColor;
//    [menuView hg_setCornerOnTopWithRadius:AUTO(15)];
    return CGRectMake(0, _viewTop, self.view.frame.size.width, 0);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
//    if (self.is_sq) {
//        return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-kBottomTabSafeAreaHeight-44-50);
//    }
//    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-kBottomTabSafeAreaHeight);
     return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kNavigationBarHeight-50);
}

- (BOOL)pageController:(WMStickyPageController *)pageController shouldScrollWithSubview:(UIScrollView *)subview {
//    NSLog(@"111=%@",subview.class);
    if ([subview isKindOfClass:[JCYCHomeFootView class]])
    {
        return NO;
    }
    return YES;
}

- (void)showGuideView {
    if (![[NSUserDefaults standardUserDefaults] objectForKey:@"JCAppGuide_guess"]) {
        JCAppGuideView *view = [JCAppGuideView new];
        if (SCREEN_HEIGHT>667){
            view.dataArray = @[JCIMAGE(@"course_3")];
        }else{
            view.dataArray = @[JCIMAGE(@"course_min_3")];
        }
        view.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        view.JCBlock = ^{
            [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"JCAppGuide_guess"];
        };
        [self.jcWindow addSubview:view];
    }

}


#pragma mark 点击事件

- (void)shareItemClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    [self.navigationController pushViewController:[JCYCMyFriendViewController new] animated:YES];
}

- (void)submitBtnClick {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    if (self.yc_count==0) {
        self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        NSString *total = self.settingModel.num.length==0?@"3":self.settingModel.num;
        self.tipView.infoLab.text = [NSString stringWithFormat:@"今天已预测%@场单场,请明天再来~",total];
        [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
        return;
    }



    WeakSelf;
    NSMutableArray *array = [NSMutableArray array];
//    [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
//        if (model.isSelect) {
//            weakSelf.currentJingModel = model;
//            [array addObject:model.requestModel];
//        }
//    }];
    for (JCJingCaiMatchModel *model in self.dataArray) {
        if (model.isSelect) {
            weakSelf.currentJingModel = model;
            [array addObject:model.requestModel];
        }
    }

    if (array.count==1) {
        JCJingCaiMatchRequstInfoModel *model = array[0];

        NSArray *btnArray = model.btnArray;
        if (btnArray.count==1) {
            JCJingCaiBtn *jingcaiBtn = btnArray[0];
            //如果是单关，但是小于
            if ([jingcaiBtn.value floatValue]>1.40f) {
                [[UIApplication sharedApplication].keyWindow addSubview:self.checkView];

            }else{
                self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                   self.tipView.infoLab.text = @"单场单选赔率必须1.4以上";
                   [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
            }

            //to do
        }else if (btnArray.count==2) {
            JCJingCaiBtn *jingcaiBtn0 = btnArray[0];
            JCJingCaiBtn *jingcaiBtn1 = btnArray[1];
            float total = [jingcaiBtn0.value floatValue]+[jingcaiBtn1.value floatValue];
            //如果是单关，但是小于
            if ([jingcaiBtn0.value floatValue]>=[self.double_value floatValue]&&[jingcaiBtn1.value floatValue]>=[self.double_value floatValue]&&total>[self.total_value floatValue]) {
                [[UIApplication sharedApplication].keyWindow addSubview:self.checkView];
            }else{
                self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                self.tipView.infoLab.text = [NSString stringWithFormat:@"单场多选赔率必须全部≥%@\n并且相加大于%@",self.settingModel.select_min,self.settingModel.select_sum];
                [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
            }

        }

        
        
    }

    
}

- (void)submitRequest {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }



    WeakSelf;
    NSMutableArray *array = [NSMutableArray array];
    [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        if (model.isSelect) {
    //            NSLog(@"%@",model.requestModel.yy_modelToJSONString);
            weakSelf.currentJingModel = model;
            [array addObject:model.requestModel];
        }
    }];
    

    NSString *matchTime = @"";
    if (array.count==1) {
        JCJingCaiMatchRequstInfoModel *model = array[0];
         matchTime = model.match_time;
        NSArray *btnArray = model.btnArray;
        if (btnArray.count==1) {
            JCJingCaiBtn *jingcaiBtn = btnArray[0];
//            self.jingcaiMoney = [NSString stringWithFormat:@"%.2f",[jingcaiBtn.value floatValue]*2];
            //如果是单关，但是小于
            if ([jingcaiBtn.value floatValue]>[self.sing_value floatValue]) {

                NSString * jingcaiBtn_spf = jingcaiBtn.spf;
//                if (self.currentJingModel.is_reverse==1) {
//                    if ([jingcaiBtn_spf integerValue]==1) {
//                        jingcaiBtn_spf = @"3";
//                    }
//                    if ([jingcaiBtn_spf integerValue]==3) {
//                        jingcaiBtn_spf = @"1";
//                    }
//                    if ([jingcaiBtn_spf integerValue]==4) {
//                        jingcaiBtn_spf = @"6";
//                    }
//                    if ([jingcaiBtn_spf integerValue]==6) {
//                        jingcaiBtn_spf = @"4";
//                    }
//                }
                
                JCJingCaiMatchRequstInfoModel *infoModel = array[0];
                
                infoModel.spf = jingcaiBtn_spf;
                
                
                  [infoModel.btnArray removeAllObjects];
                [self creatJingCaiWithModel:infoModel];
//                [self creatJingCaiWithMatchInfo:array matchType:@"2" matchTime:matchTime Yj_hb:self.jingcaiMoney Status:@"2"];
            }else{
                self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                self.tipView.infoLab.text = [NSString stringWithFormat:@"单场单选赔率必须%@以上",self.sing_value];
                [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
            }

            //to do
        }else if (btnArray.count==2) {
            JCJingCaiMatchRequstInfoModel *infoModel = array[0];
            JCJingCaiBtn *jingcaiBtn0 = btnArray[0];
            JCJingCaiBtn *jingcaiBtn1 = btnArray[1];
            NSString * jingcaiBtn0_spf = jingcaiBtn0.spf;
            NSString *jingcaiBtn1_spf = jingcaiBtn1.spf;
//            if (self.currentJingModel.is_reverse==1) {
//                if ([jingcaiBtn0_spf integerValue]==1) {
//                    jingcaiBtn0_spf = @"3";
//                }else if([jingcaiBtn0_spf integerValue]==3){
//                    jingcaiBtn0_spf = @"1";
//                }else if([jingcaiBtn0_spf integerValue]==4){
//                    jingcaiBtn0_spf = @"6";
//                }else if([jingcaiBtn0_spf integerValue]==6){
//                    jingcaiBtn0_spf = @"4";
//                }
//
//                if ([jingcaiBtn1_spf integerValue]==1) {
//                    jingcaiBtn1_spf = @"3";
//                }else if([jingcaiBtn1_spf integerValue]==3){
//                    jingcaiBtn1_spf = @"1";
//                }else if([jingcaiBtn1_spf integerValue]==4){
//                    jingcaiBtn1_spf = @"6";
//                }else if([jingcaiBtn1_spf integerValue]==6){
//                    jingcaiBtn1_spf = @"4";
//                }
//            }
            
            
            infoModel.spf = [NSString stringWithFormat:@"%@,%@",jingcaiBtn0_spf,jingcaiBtn1_spf];
            float total = [jingcaiBtn0.value floatValue]+[jingcaiBtn1.value floatValue];
//            self.jingcaiMoney = [NSString stringWithFormat:@"%.2f",total];
            //如果是单关，但是小于
            if ([jingcaiBtn0.value floatValue]>=[self.double_value floatValue]&&[jingcaiBtn1.value floatValue]>=[self.double_value floatValue]&&total>[ self.total_value floatValue]) {
                JCJingCaiMatchRequstInfoModel *infoModel = array[0];
                [infoModel.btnArray removeAllObjects];
                [self creatJingCaiWithModel:infoModel];
//            [self creatJingCaiWithMatchInfo:array matchType:@"1" matchTime:matchTime Yj_hb:self.jingcaiMoney Status:@"2"];
            }else{
                self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                self.tipView.infoLab.text = [NSString stringWithFormat:@"单场多选赔率必须全部%@以上，\n并且相加大于%@",self.double_value,self.total_value];
                [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
            }

        }

        
        
    }

    
}

- (void)creatJingCaiWithModel:(JCJingCaiMatchRequstInfoModel *)model {
    
    //不需要填写竞猜理由
    [self.checkView.tableView showLoading];
    JCJingCaiService_New *service = [JCJingCaiService_New service];
    NSString *home_select = @"";
    NSString *away_select = @"";
//    NSMutableArray *homeArray = [NSMutableArray array];
//    NSMutableArray *awayArray = [NSMutableArray array];
    if (model.spf.length>0) {
        NSArray *array = [model.spf componentsSeparatedByString:@","];
        if (array.count==1) {
            home_select = array.firstObject;
        }
        if (array.count==2) {
            home_select = array.firstObject;
            away_select = array.lastObject;
        }

    }

    [service creatYucewithMatch_id:model.match_id home_select:home_select away_select:away_select success:^(id  _Nullable object) {
        [self.checkView.tableView endLoading];
        self.checkView.dataArray = @[];//清空数据
        [self.checkView removeFromSuperview];
        if ([JCWJsonTool isSuccessResponse:object]) {

            self.currentJingModel.is_future = 1;
            [self.currentJingModel.requestModel.btnArray removeAllObjects];
            NSString *count = [NSString stringWithFormat:@"%@",object[@"data"][@"now_num"]];
            self.yc_count = [count integerValue];
            [self showChanceCount:count];
            [JCWToastTool showHint:@"预测成功"];
            [self.homeVC refreshData];
            JCYCSuccessViewController *vc = [JCYCSuccessViewController new];
            vc.msg = object[@"data"][@"yc_desc"];
            [self.navigationController pushViewController:vc animated:YES];

             [self.homeVC.tableView reloadData];


        }else{
            self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.tipView.infoLab.text = object[@"msg"];
            [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];


        }
            [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                obj.isSelect = NO;
            }];
        [self.homeVC.tableView reloadData];
        [self showInfo];

    } failure:^(NSError * _Nonnull error) {
        [self.checkView.tableView endLoading];
        [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            obj.isSelect = NO;
        }];
        [self.homeVC.tableView reloadData];
        [self showInfo];
    }];
 
    
 
}
- (void)showChanceCount:(NSString *)count {
    self.homeVC.headView.count = count;
}

- (void)showInfo {
        NSMutableArray *array = [NSMutableArray array];
        NSMutableArray *btnArray = [NSMutableArray array];
        [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
            if (model.isSelect) {
                [array addObject:model];
                [btnArray addObjectsFromArray:model.requestModel.btnArray];
            }
        }];
    if (array.count==0) {
        self.bottomView.teamLab.text = @"";
        self.bottomView.infoLab.text = @"";
        self.bottomView.submitBtn.backgroundColor = COLOR_DADADA;
        self.bottomView.submitBtn.userInteractionEnabled = NO;
        self.bottomView.hidden = YES;
        self.homeVC.hideShowInfo = YES;
        return;
    }
    
    self.bottomView.hidden = NO;
    self.homeVC.hideShowInfo = NO;
    if (array.count>=1&&btnArray.count>=1) {
        JCYCResultModel *resultModel = [JCYCResultModel new];
        
        self.bottomView.submitBtn.backgroundColor = COLOR_EF2F2F;
        self.bottomView.submitBtn.userInteractionEnabled = YES;
        JCJingCaiMatchModel *model = array.firstObject;
        NSString *team = [NSString stringWithFormat:@"%@ VS %@",model.home_team_name,model.away_team_name];
        if (model.is_reverse==1) {
            team = [NSString stringWithFormat:@"%@ VS %@",model.away_team_name,model.home_team_name];
        }
        self.bottomView.teamLab.text = team;
        resultModel.team = team;
        resultModel.title = [NSString stringWithFormat:@"%@ | %@ | %@",model.competition_name,NonNil(model.issue_num),model.match_time];
        if (model.issue_num.length==0) {
            resultModel.title = [NSString stringWithFormat:@"%@ | %@",model.competition_name,model.match_time];
        }
        if (btnArray.count==1) {
            JCJingCaiBtn *jcBtn = btnArray.firstObject; 
            NSString *result = @"";
            if ([jcBtn.spf integerValue]==1) {
                result = [NSString stringWithFormat:@"主胜 %@",jcBtn.value];
            }
            if ([jcBtn.spf integerValue]==2) {
                result = [NSString stringWithFormat:@"平 %@",jcBtn.value];
            }
            if ([jcBtn.spf integerValue]==3) {
                result = [NSString stringWithFormat:@"客胜 %@",jcBtn.value];
            }
            if ([jcBtn.spf integerValue]==4) {
                result = [NSString stringWithFormat:@"让胜 %@",jcBtn.value];
            }
            if ([jcBtn.spf integerValue]==5) {
                result = [NSString stringWithFormat:@"让平 %@",jcBtn.value];
            }
            if ([jcBtn.spf integerValue]==6) {
                result = [NSString stringWithFormat:@"让负 %@",jcBtn.value];
            }
            resultModel.result = result;
             self.bottomView.infoLab.text = result;
            self.checkView.dataArray = @[resultModel];
            
          }
        if (btnArray.count==2) {

            JCJingCaiBtn *firstBtn = btnArray.firstObject;
            JCJingCaiBtn *lastBtn = btnArray.lastObject;
            NSString *result1 = @"";
            NSString *result2 = @"";
            if ([firstBtn.spf integerValue]==1) {
                result1 = [NSString stringWithFormat:@"主胜 %@",firstBtn.value];
            }
            if ([firstBtn.spf integerValue]==2) {
                result1 = [NSString stringWithFormat:@"平 %@",firstBtn.value];
            }
            if ([firstBtn.spf integerValue]==3) {
                result1 = [NSString stringWithFormat:@"客胜 %@",firstBtn.value];
            }
            if ([firstBtn.spf integerValue]==4) {
                result1 = [NSString stringWithFormat:@"让胜 %@",firstBtn.value];
            }
            if ([firstBtn.spf integerValue]==5) {
                result1 = [NSString stringWithFormat:@"让平 %@",firstBtn.value];
            }
            if ([firstBtn.spf integerValue]==6) {
                result1 = [NSString stringWithFormat:@"让负 %@",firstBtn.value];
            }

            if ([lastBtn.spf integerValue]==1) {
                result2 = [NSString stringWithFormat:@"主胜 %@",lastBtn.value];
            }
            if ([lastBtn.spf integerValue]==2) {
                result2 = [NSString stringWithFormat:@"平 %@",lastBtn.value];
            }
            if ([lastBtn.spf integerValue]==3) {
                result2 = [NSString stringWithFormat:@"客胜 %@",lastBtn.value];
            }
            if ([lastBtn.spf integerValue]==4) {
                result2 = [NSString stringWithFormat:@"让胜 %@",lastBtn.value];
            }
            if ([lastBtn.spf integerValue]==5) {
                result2 = [NSString stringWithFormat:@"让平 %@",lastBtn.value];
            }
            if ([lastBtn.spf integerValue]==6) {
                result2 = [NSString stringWithFormat:@"让负 %@",lastBtn.value];
            }

            self.bottomView.infoLab.text = [NSString stringWithFormat:@"%@ %@",result1,result2];
             resultModel.result = [NSString stringWithFormat:@"%@ %@",result1,result2];
            self.checkView.dataArray = @[resultModel];
          }
    }
}

#pragma mark - -
- (void)showWeekView {
    if (self.weekResultModel.is_win.length>0) {
        if ([self.weekResultModel.is_win intValue]==1) {
        //上周入榜
        self.weekInView = [JCYCResustOnListView new];
        self.weekInView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.weekInView.weekResultModel = self.weekResultModel;
        [[UIApplication sharedApplication].keyWindow addSubview:self.weekInView];
        
        WeakSelf;
        self.weekInView.JCCloseBlock = ^{
            [weakSelf.weekInView removeFromSuperview];
            [weakSelf showDayYuceResult];
        };
    }else{
        //上周未入榜
        self.weekOutView = [JCYCResustNotOnListView new];
        self.weekOutView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
         self.weekOutView.weekResultModel = self.weekResultModel;
        [[UIApplication sharedApplication].keyWindow addSubview:self.weekOutView];
        WeakSelf;
        self.weekOutView.JCCloseBlock = ^{
            [weakSelf.weekOutView removeFromSuperview];
            [weakSelf showDayYuceResult];
        };
    }
    }else{
        
        [self showDayYuceResult];
    }
    

}
//每日开奖
- (void)showDayYuceResult {
    if (self.yueceResultModel.future_info.count>0) {
        self.yuceResultView = [JCYCResustShowView new];
        self.yuceResultView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//        self.yuceResultView.dataArray = self.dayYuceResultArray;
        self.yuceResultView.yueceResultModel = self.yueceResultModel;
        [[UIApplication sharedApplication].keyWindow addSubview:self.yuceResultView];
        WeakSelf;
        self.yuceResultView.JCCloseBlock = ^{
            [weakSelf.yuceResultView removeFromSuperview];
            [weakSelf showQianYueView];
        };
        self.yuceResultView.JCSureBlock = ^{
            JCMainTabBarController *tabBarController = (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
             [tabBarController showYCVC];
            [weakSelf.yuceResultView removeFromSuperview];
            [weakSelf showQianYueView];
        };
    }else{
        [self showQianYueView];
    }

}
//签约资格
- (void)showQianYueView {
    if (self.qianyueModel&&[self.qianyueModel.is_sign integerValue]==1) {
        self.qianYueView = [JCYCQianYueShowView new];
        self.qianYueView.qianyueModel = self.qianyueModel;
        self.qianYueView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [[UIApplication sharedApplication].keyWindow addSubview:self.qianYueView];
        WeakSelf;
        self.qianYueView.JCAgreeBlock = ^{
            JCPostCheckRuleVC *vc = [JCPostCheckRuleVC new];
            vc.isJingcai = YES;
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
    }


}



- (UIImageView *)findHairlineImageViewUnder:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self findHairlineImageViewUnder:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}



- (JCYCHomeHeadView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCYCHomeHeadView new];
    }
    return _topHeadView;
}

- (JCYCHomeFootView *)bottomView {
    if (!_bottomView) {
        _bottomView = [JCYCHomeFootView new];
    }
    return _bottomView;
}

- (JCParticipateJingCaiTipView *)tipView {
    if (!_tipView) {
        _tipView = [JCParticipateJingCaiTipView new];
    }
    return _tipView;
}

- (JCYCCheckView *)checkView {
    if (!_checkView) {
        _checkView = [JCYCCheckView new];
        _checkView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        [_checkView.sureBtn addTarget:self action:@selector(submitRequest) forControlEvents:UIControlEventTouchUpInside];
    }
    return _checkView;;
}

@end
