//
//  JCDakaPlanDetailStickWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaPlanDetailStickWMVC.h"
#import "JCDakaPlanDetailAutherHeadView.h"
#import "JCDakaBuyPlanVC.h"

#import "JCShareView.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCMyBuyPlanWMViewController.h"
#import "JCHongBangOrderDetailVC.h"
#import "JCPlaneDetailNewVC.h"
#import "JCHomeSearchVC.h"
#import "JCBasketBallMatchDetailWMStickVC.h"
#import "JCPlaneDetailFreeVC.h"
#import "JCBaseTitleAlertView.h"
static CGFloat const kWMMenuViewHeight = 0;
@interface JCDakaPlanDetailStickWMVC ()

@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCDakaPlanDetailAutherHeadView *autherHeadView;

@property (nonatomic, strong) JCWExpertBall *expertDetailModel;

@property (nonatomic, strong) UIView *bottomView;

@property (strong, nonatomic) UIButton *shareBtn;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *shareImgView;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *shareLab;

@property (strong, nonatomic) UILabel *likeLab;

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) NSMutableArray *matchArray;

@property (nonatomic,strong) JCGZHTuiJianModel *lastModel;

@end

@implementation JCDakaPlanDetailStickWMVC


- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"",];
    }
    return _titleArray;
}



- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
//    if (@available(iOS 15.0, *)) {
//        [self configNavBarImage:@"blank"];
//    }
    
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleTransparent;
}

- (instancetype)init {
    if (self = [super init]) {
        self.height = kWHongbangDetailHeaderViewHeight;
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
//        self.menuItemWidth = AUTO(40);
        self.progressWidth =0;
        self.viewTop = kWHongbangDetailHeaderViewHeight;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.maximumHeaderViewHeight = kWHongbangDetailHeaderViewHeight;
        self.minimumHeaderViewHeight = kNavigationBarHeight;
//        self.titleFontName = @"PingFangSC-Medium";
//        [self setNavBackImg];
        self.contentView.bounces = NO;
    }
    return self;
}

- (void)viewDidLoad {

    [super viewDidLoad];
    self.title = @"方案详情";
//    self.view.backgroundColor = COLOR_002868;
    [self initViews];
    // Do any additional setup after loading the view.
    self.autherHeadView = [[JCDakaPlanDetailAutherHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWHongbangDetailHeaderViewHeight)];
    [self.view addSubview:self.autherHeadView];
    
    WeakSelf;
    self.autherHeadView.JCOrderDetailBlock = ^{
        JCHongBangOrderDetailVC *vc = [JCHongBangOrderDetailVC new];
        vc.order_id = weakSelf.self.planDetailModel.order_id;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    [self loadDataInfo];
    [self getMatchList];

}

- (void)initViews {

    
    [self.view addSubview:self.bottomView];
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-49-kBottomTabSafeAreaHeight, SCREEN_WIDTH, 49+kBottomTabSafeAreaHeight);

    self.bottomView.layer.shadowColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:0.5].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,-1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 1.5;
    
    [self.bottomView addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2.0f, 49));
    }];
    
    [self.bottomView addSubview:self.shareBtn];
    [self.shareBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH/2.0f, 49));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_979797;
    [self.bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.bottomView);
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(0.5, 20));
    }];
    
    [self.likeBtn addSubview:self.likeImgView];
    [self.likeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(65));
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(24)));
    }];
    [self.likeBtn addSubview:self.likeLab];
    [self.likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.likeBtn);
        make.left.equalTo(self.likeImgView.mas_right).offset(AUTO(5));
    }];
    
    [self.shareBtn addSubview:self.shareImgView];
    [self.shareImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.bottomView.mas_centerX).offset(AUTO(65));
        make.centerY.equalTo(self.shareBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(24), AUTO(24)));
    }];
    
    [self.shareBtn addSubview:self.shareLab];
    [self.shareLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.shareBtn);
        make.left.equalTo(self.shareImgView.mas_right).offset(AUTO(5));
    }];
    
    
    WeakSelf;
    [self.shareBtn bk_whenTapped:^{
        [JCWAppTool isUserNotificationEnable:^(BOOL isEnabled) {
            if (!isEnabled) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    JCBaseTitleAlertView *alertView = [JCBaseTitleAlertView new];
                    [alertView alertTitle:@"" TitleColor:COLOR_2F2F2F Mesasge:@"您未开启通知权限，开启后才能使用分享功能，是否前往开启？" MessageColor:COLOR_666666 SureTitle:@"确认" SureColor:JCWhiteColor SureHandler:^{
                        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:UIApplicationOpenSettingsURLString] options:@{} completionHandler:nil];
                        [alertView removeFromSuperview];
                    } CancleTitle:@"取消" CancleColor:JCBaseColor CancelHandler:^{
                       [alertView removeFromSuperview];
                    }];
                    alertView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
                    [[UIApplication sharedApplication].keyWindow addSubview:alertView];

                });



            }else {

                
                dispatch_async(dispatch_get_main_queue(), ^{
                    [weakSelf.shareView show];

                });

            }
        
        }];

    }];
    
    self.shareView.JCShareBlock = ^{
        [weakSelf addShareCount];
    };

    [self.likeBtn bk_whenTapped:^{
        [weakSelf addLikeCount];
    }];
    

    
}



- (void)loadDataInfo {
    if ([self.planDetailModel.status integerValue]==8) {
        self.bottomView.hidden = YES;
    }
    
//    _planDetailModel =planDetailModel;
     self.likeLab.text = [self.planDetailModel.dz_number integerValue]==0?@"点赞":self.planDetailModel.dz_number;
    self.likeImgView.image = self.planDetailModel.is_good==0?JCIMAGE(@"daka_icon_dz_un"):JCIMAGE(@"daka_icon_dz");
    self.shareView.title = self.planDetailModel.wechat_share.share_title;
    self.shareView.content = self.planDetailModel.wechat_share.share_desc;
    self.shareView.desc = self.planDetailModel.wechat_share.share_desc;
    self.shareView.webPageUrl =self.planDetailModel.wechat_share.share_url;
    self.shareView.friend_url =self.planDetailModel.wechat_share.friend_url;

//    self.autherHeadView.expertDetailModel = self.expertDetailModel;
    self.autherHeadView.infoModel = self.planDetailModel;
    self.shareView.imageUrl = self.expertDetailModel.user_img;
    CGSize size  =  [self returnTextWidth:self.planDetailModel.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
    self.height = AUTO(150)+kNavigationBarHeight+size.height;
    self.maximumHeaderViewHeight = self.height;
    self.minimumHeaderViewHeight =self.height-kNavigationBarHeight;
    self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
    self.viewTop = self.height;
    
}
//获取详情关联的比赛
- (void)getMatchList {
//    [self.jcWindow showLoading];
    JCHomeService_New *service = [JCHomeService_New service];//36563,37807
    //self.planDetailModel.id
    [service getGZHT_TuijianDetailMatchListWithTuijian_id:self.planDetailModel.id Success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            
           NSArray * matchArray = [JCWJsonTool arrayWithJson:object[@"data"] class:[JCGZHTuiJianModel class]];
//            matchArray = @[];
            self.matchArray = [NSMutableArray array];
            NSMutableArray *show_Array = [NSMutableArray array];
            NSMutableArray *noShow_Array = [NSMutableArray array];
            [matchArray enumerateObjectsUsingBlock:^(JCGZHTuiJianModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if ([obj.show integerValue]==0) {
                    obj.match_info = @[];
                }
                if (obj.match_info.count>0) {
                    [show_Array addObject:obj];
                }else{
                    [noShow_Array addObject:obj];
                }
//                if (self.matchArray.count>1) {
//                    if (obj.match_info.count>0&&self.lastModel.match_info.count==0) {
//                        [self.matchArray removeObject:obj];
//                        [self.matchArray insertObject:obj atIndex:0];
////                        [self.matchArray exchangeObjectAtIndex:idx withObjectAtIndex:0];
////                        *stop = YES;
//                    }
//
//                    self.lastModel = obj;
//                }
                
                
                
            }];
            
            if (matchArray.count==1) {
                JCGZHTuiJianModel *obj = matchArray.firstObject;
                if (obj.analysis.length==0) {
                    obj.analysis = self.planDetailModel.analyse;
                }
            }
            [self.matchArray addObjectsFromArray:show_Array];
            [self.matchArray addObjectsFromArray:noShow_Array];
            [self reloadData];
        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }
        
    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];

}


- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(5, 5)];
    
    CGFloat headerViewHeight = self.height;
//    CGFloat headerViewHeight = kWHongbangDetailHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.autherHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);
    [self.view bringSubviewToFront:self.bottomView];
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
 
    if ([scrollView isKindOfClass:[WMMagicScrollView class]]) {
        if (scrollView.contentOffset.y>AUTO(50)) {
            self.autherHeadView.bgView.hidden = YES;
//            self.title = self.expertDetailModel.user_name;
        }else {
            self.autherHeadView.bgView.hidden = NO;
//            self.title = @"";
        }
    }
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-49-kBottomTabSafeAreaHeight+scrollView.contentOffset.y, SCREEN_WIDTH, 49+kBottomTabSafeAreaHeight);
//    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {

    //付费
    if (self.planDetailModel.is_free==1) {
        JCPlaneDetailNewVC *vc = [JCPlaneDetailNewVC new];
        vc.planDetailModel = self.planDetailModel;
        vc.matchArray = self.matchArray;
        return vc;
    }

    
    //免费
    JCPlaneDetailFreeVC *vc = [JCPlaneDetailFreeVC new];
    vc.planDetailModel = self.planDetailModel;
    vc.matchArray = self.matchArray;
    return vc;


}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    [menuView hg_setCornerOnTopWithRadius:AUTO(5)];
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
//    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kBottomTabSafeAreaHeight-49-kWMMenuViewHeight);
    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-kBottomTabSafeAreaHeight-49-self.height+kNavigationBarHeight);
}




- (void)addCornerWithView:(UIView *)aView type:(UIRectCorner)aCorners size:(CGSize)aSize
{
    // 根据矩形画带圆角的曲线
    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:aView.bounds byRoundingCorners:aCorners cornerRadii:aSize];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = aView.bounds;
    maskLayer.path = maskPath.CGPath;
    aView.layer.mask = maskLayer;
}

//增加分享次数
- (void)addShareCount {
    JCHomeService_New * service = [JCHomeService_New service];
    [service getArticleBrowseWithId:self.planDetailModel.id article_cate:@"2" type:@"2" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {

        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
//点赞
- (void)addLikeCount {
    
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
    [service getArticleBrowseWithId:self.planDetailModel.id article_cate:@"2" type:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_good = object[@"data"][@"is_good"];
            self.planDetailModel.is_good = [is_good integerValue];
            self.planDetailModel.dz_number= [NSString stringWithFormat:@"%@",object[@"data"][@"dz_number"]];
            self.likeLab.text = [self.planDetailModel.dz_number integerValue]>0?self.planDetailModel.dz_number:@"点赞";
            self.likeImgView.image = self.planDetailModel.is_good==1?JCIMAGE(@"daka_icon_dz"):JCIMAGE(@"daka_icon_dz_un");

        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];

}

#pragma mark --


//- (void)back:(UIButton *)sender {
////    [self.navigationController popViewControllerAnimated:YES];
//    NSArray *array = self.navigationController.viewControllers;
//    for (UIViewController *vc in self.navigationController.viewControllers) {
//        if ([vc isKindOfClass:[JCFootBallAuthorDetailWMViewController class]]||[vc isKindOfClass:[JCMyBuyPlanWMViewController class]]||[vc isKindOfClass:[JCHomeSearchVC class]]||[vc isKindOfClass:[JCBasketBallMatchDetailWMStickVC class]]) {
//            [self.navigationController popToViewController:vc animated:YES];
//            return;
//        }
//    }
//    [self.navigationController popToRootViewControllerAnimated:YES];
//}

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _shareBtn;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _likeBtn;
}

- (UIImageView *)shareImgView {
    if (!_shareImgView) {
        _shareImgView = [UIImageView new];
        _shareImgView.image = JCIMAGE(@"daka_icon_fx");
    }
    return _shareImgView;
}

- (UILabel *)shareLab {
    if (!_shareLab) {
        _shareLab = [UILabel initWithTitle:@"分享" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _shareLab;
}

- (UIImageView *)likeImgView {
    if (!_likeImgView) {
        _likeImgView = [UIImageView new];
        _likeImgView.image = JCIMAGE(@"daka_icon_dz_un");//daka_icon_dz
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}

- (JCShareView *)shareView {
    if (!_shareView) {
        _shareView = [JCShareView viewFromXib];
        _shareView.titleString = @"分享方案";
        _shareView.image = JCIMAGE(@"icon_app");
    }
    return _shareView;
}

@end
