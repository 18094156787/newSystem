//
//  JCTeamMatchWMStickVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchWMStickVC.h"
#import "JCYCRankTopView.h"
#import "JCYCRankViewController.h"
#import "JCYCUserInfoModel.h"
#import "JCYuceCommomModel.h"
#import "JCTeamMatchWMStickHeadView.h"
#import "ZJPickerView.h"

#import "JCTeamMatchInfoVC.h"
#import "JCTeamMatchInfoMatchVC.h"
#import "JCTeamMatchInfoScoreVC.h"
#import "JCTeamMatchInfoUserMemberVC.h"
#import "JCTeamMatchInfoTeamListVC.h"

#import "JCDataBaseEventBaseModel.h"
#import "JCDataBaseEventSeasonModel.h"
#import "JCDataBaseEventTabModel.h"
static CGFloat const kWMMenuViewHeight = 44;
@interface JCTeamMatchWMStickVC ()

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCTeamMatchWMStickHeadView *topHeadView;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UIView *timeBgView;

@property (nonatomic, strong) UIImageView *updowmImgView;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) NSMutableArray *timeArray;

@property (nonatomic, strong) JCDataBaseEventBaseModel *eventInfoModel;

@property (nonatomic, strong) NSArray *seasonArray;//季度塞选

@property (nonatomic, strong) NSArray *tabArray;

@property (nonatomic, strong) NSString *season_id;

@property (nonatomic, strong) NSString *stage_id;

@property (nonatomic, assign) BOOL isLoad;

@end

@implementation JCTeamMatchWMStickVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
    UIImageView * navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
    [self setNavBackImg];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"match_top_nav"] forBarMetrics:UIBarMetricsDefault];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"基本信息",@"积分榜",@"比赛",@"球员榜",@"球队榜"];
    }
    return _titleArray;
}


- (instancetype)init {
    if (self = [super init]) {
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressViewBottomSpace = 1;
        self.progressColor= JCBaseColor;
        self.titleColorSelected = COLOR_2F2F2F;
        self.titleColorNormal = COLOR_2F2F2F;
        self.progressWidth = AUTO(28);
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.progressHeight = 2;
//        self.progressWidth = 28;
        self.viewTop = kWMTeamMatchHeaderViewHeight;
//        self.menuViewHeight = 0;
        self.maximumHeaderViewHeight = kWMTeamMatchHeaderViewHeight;
        self.minimumHeaderViewHeight = NavigationStatusBarHeight;
//        self.menuItemWidth = AUTO(100);
//        self.automaticallyCalculatesItemWidths = YES;
//        self.titleFontName = @"PingFangSC-Regular";
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {

//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = COLOR_F0F0F0;
    self.view.backgroundColor = JCWhiteColor;
//    self.contentView.backgroundColor= COLOR_81060F;
    self.topHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, kWMTeamMatchHeaderViewHeight);
    [self.view addSubview:self.topHeadView];
    [self initViews];
    [self refreshData];

}

- (void)refreshData {
    [self.view showLoading];
    
    
    JCDataBaseService_New *service = [JCDataBaseService_New new];
    [service getDataBaseEventInfoWithCompetition_id:self.competition_id type:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            self.eventInfoModel = (JCDataBaseEventBaseModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCDataBaseEventBaseModel class]];

            self.title = self.eventInfoModel.name;
            self.topHeadView.eventInfoModel = self.eventInfoModel;
            if (!self.season_id) {
                self.season_id = [NSString stringWithFormat:@"%@",object[@"data"][@"cur_season_id"]];
            }
            if (!self.stage_id) {
                self.stage_id = [NSString stringWithFormat:@"%@",object[@"data"][@"cur_stage_id"]];
            }


//            self.tabArray = [JCWJsonTool arrayWithJson:object[@"data"][@"tab"] class:[JCDataBaseEventTabModel class]];
            if (object[@"data"][@"list"]) {
                self.seasonArray = [JCWJsonTool arrayWithJson:object[@"data"][@"list"] class:[JCDataBaseEventSeasonModel class]];
            }

            self.timeArray = [NSMutableArray array];
            [self.seasonArray enumerateObjectsUsingBlock:^(JCDataBaseEventSeasonModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [self.timeArray addObject:obj.year];
            }];
            if (self.timeArray.count>0&&self.timeLab.text.length==0) {
                self.timeLab.text = self.timeArray.firstObject;
                [self getTimeSizeWithText:self.timeArray.firstObject];
            }
            self.isLoad = YES;

            [self reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
 
}




- (void)initViews {
    UIView *customView = [UIView new];
    customView.backgroundColor = [JCWhiteColor colorWithAlphaComponent:0.21];
    [customView hg_setAllCornerWithCornerRadius:12];
    customView.frame = CGRectMake(20, 0, 90, 24);
    self.timeLab.frame = CGRectMake(10, 0, customView.width-20, 24);
    [customView addSubview:self.timeLab];

    [customView addSubview:self.updowmImgView];
    self.timeBgView = customView;
    self.updowmImgView.frame = CGRectMake(75, 10, 8, 8);
    self.updowmImgView.centerY = customView.centerY;

    WeakSelf;
    [customView bk_whenTapped:^{
        [weakSelf showPickerView];
    }];


    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:customView];
    
    self.navigationItem.rightBarButtonItem = item;
//    self.timeLab.text = @"19-20";

}






- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];

    CGFloat headerViewHeight = kWMTeamMatchHeaderViewHeight;
//    CGFloat headerViewHeight = kWMTeamMatchHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.topHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), kWMTeamMatchHeaderViewHeight);
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
    if (scrollView.contentOffset.y < 0) {
        [self.view setNeedsLayout];
    }
    CGFloat offsetY = self.contentView.contentOffset.y;
//    CGFloat maxOffsetY = 40;
//    float percent = offsetY/maxOffsetY;
    
//    if (percent>=1) {
//        self.topHeadView.contentBgView.alpha = 0;
//
//    }else{
//        self.topHeadView.contentBgView.alpha = 1-percent;
//
//    }


//    NSLog(@"%.2f",percent);
    
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
//    JCDataBaseEventTabModel *model = self.tabArray[index];
    if (self.isLoad) {
        if (index==0) {
            JCTeamMatchInfoVC *vc = [JCTeamMatchInfoVC new];
            vc.fatherView = self.view;
            vc.season_id = self.season_id;
            vc.competition_id = self.competition_id;
            return vc;
        }
        if (index==1) {
            JCTeamMatchInfoScoreVC *vc = [JCTeamMatchInfoScoreVC new];
            vc.fatherView = self.view;
            vc.season_id = self.season_id;
            vc.event_id = self.competition_id;
            vc.stage_id  =self.stage_id;
            return vc;
        }
        
        if (index==2) {
            JCTeamMatchInfoMatchVC *vc = [JCTeamMatchInfoMatchVC new];
            vc.fatherView = self.view;
            vc.season_id = self.season_id;
            vc.event_id = self.competition_id;
            vc.stage_id = self.stage_id;
            return vc;
        }
        if (index==3) {
            JCTeamMatchInfoUserMemberVC *vc = [JCTeamMatchInfoUserMemberVC new];
            vc.fatherView = self.view;
            vc.season_id = self.season_id;
            vc.event_id = self.competition_id;
            return vc;
        }
        if (index==4) {
            JCTeamMatchInfoTeamListVC *vc = [JCTeamMatchInfoTeamListVC new];
            vc.fatherView = self.view;
            vc.season_id = self.season_id;
            vc.event_id = self.competition_id;
            return vc;
        }
    }

    
    

    
    UIViewController *vc = [UIViewController new];

    return vc;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    
    
        menuView.backgroundColor = JCWhiteColor;
    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
     return CGRectMake(0, _viewTop, SCREEN_WIDTH, kWMMenuViewHeight);

}
- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, SCREEN_WIDTH, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-kWMMenuViewHeight-kNavigationBarHeight);
}


#pragma mark 显示选择控制器
- (void)showPickerView
{

    [ZJPickerView clear];
    // 1.Custom propery（自定义属性，根据需要添加想要的属性。PS：如果在多个地方使用到自定义弹框，建议把propertyDict定义为一个宏或全局变量）
    NSDictionary *propertyDict = @{
//                                   ZJPickerViewPropertyCanceBtnTitleKey : @"取消",
//                                   ZJPickerViewPropertySureBtnTitleKey  : @"确定",
                                   ZJPickerViewPropertyTipLabelTextKey  : @"选择年份", // @"提示内容"，多列时推荐使用英文逗号隔开，参考注释
//                                   ZJPickerViewPropertyDividedSymbolKey : @"#", // 选中内容的分隔符，默认英文逗号

                                   ZJPickerViewPropertyCanceBtnTitleColorKey : JCBlackColor,
                                   ZJPickerViewPropertySureBtnTitleColorKey : JCBlackColor,
                                   ZJPickerViewPropertyTipLabelTextColorKey : COLOR_98989F,
                                   ZJPickerViewPropertyLineViewBackgroundColorKey : COLOR_DDDDDD,
                                   ZJPickerViewPropertyCanceBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertySureBtnTitleFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertyTipLabelTextFontKey : [UIFont systemFontOfSize:17.0f],
                                   ZJPickerViewPropertyPickerViewHeightKey : @300.0f,
                                   ZJPickerViewPropertyOneComponentRowHeightKey : @40.0f,
                                   ZJPickerViewPropertySelectRowTitleAttrKey : @{NSForegroundColorAttributeName : [UIColor blackColor], NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   ZJPickerViewPropertyUnSelectRowTitleAttrKey : @{NSForegroundColorAttributeName : COLOR_999999, NSFontAttributeName : [UIFont systemFontOfSize:20.0f]},
                                   ZJPickerViewPropertySelectRowLineBackgroundColorKey : JCClearColor,
                                   ZJPickerViewPropertyIsTouchBackgroundHideKey : @YES,
//                                   ZJPickerViewPropertyIsShowTipLabelKey : @YES,
                                   ZJPickerViewPropertyIsShowSelectContentKey : @YES,
                                   ZJPickerViewPropertyIsScrollToSelectedRowKey: @YES,
//                                   ZJPickerViewPropertyIsDividedSelectContentKey: @YES, // 选择的内容是否已经用英文逗号隔开
                                   ZJPickerViewPropertyIsAnimationShowKey : @YES};
    
    // 2.Show（显示）
//    __weak typeof(_selectContentLabel) weak_selectContentLabel = _selectContentLabel;
    [ZJPickerView zj_showWithDataList:self.timeArray propertyDict:propertyDict completion:^(NSString *selectContent) {
        NSLog(@"ZJPickerView log tip：---> selectContent:%@", selectContent);
        self.timeLab.text = selectContent;
        [self getTimeSizeWithText:selectContent];
        [self.seasonArray enumerateObjectsUsingBlock:^(JCDataBaseEventSeasonModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [self.timeArray addObject:obj.season];
            if ([obj.year isEqualToString:selectContent]) {
                self.season_id = obj.id;
//                self.selectIndex = 0;
                [self refreshData];
                *stop = YES;
            }
        }];

    }];
}

- (void)getTimeSizeWithText:(NSString *)text {
    CGSize textSize = [text boundingRectWithSize:CGSizeMake(100, 24) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:12]} context:nil].size;
    self.timeLab.width = textSize.width;
    self.timeLab.frame = CGRectMake(10, 0, textSize.width, 24);
    self.timeBgView.frame = CGRectMake(20, 0, textSize.width+30, 24);
    self.updowmImgView.frame = CGRectMake(self.timeBgView.width-15, 10, 8, 8);
    self.updowmImgView.centerY = self.timeLab.centerY;
//    self.timeBgView.width = textSize.width+30;
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



- (JCTeamMatchWMStickHeadView *)topHeadView {
    if (!_topHeadView) {
        _topHeadView = [JCTeamMatchWMStickHeadView new];
    }
    return _topHeadView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:12 andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _timeLab.userInteractionEnabled = YES;
    }
    return _timeLab;
}

- (UIImageView *)updowmImgView {
    if (!_updowmImgView) {
        _updowmImgView = [UIImageView new];
        _updowmImgView.image = JCIMAGE(@"teamMatch_detail_icon_dsj");
    }
    return _updowmImgView;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
}

@end
