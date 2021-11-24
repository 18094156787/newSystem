//
//  JCHongbangDetailWMstckyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDetailWMstckyVC.h"
#import "JCHongbangDetailVC.h"
//#import "JCPlaneDetailVC.h"
#import "JCShareView.h"
#import "JCWTjInfoDetailBall.h"
#import "JCHongbangDetailTopView.h"
#import "JCBigDataWMVC.h"
#import "JCHongBangOrderDetailVC.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCHongbangWMstckyVC.h"
#import "JCHongbangBuylWMstckyVC.h"
#import "JCHongbangOrderWMstckyVC.h"
#import "JCBaseTitleAlertView.h"
static CGFloat const kWMMenuViewHeight = 0;
static CGFloat const kWMMenuViewUserHeight = 60;
@interface JCHongbangDetailWMstckyVC ()

@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCHongbangDetailTopView *autherHeadView;

@property (nonatomic, strong) JCWExpertBall *expertDetailModel;

@property (nonatomic, strong) UIView *bottomView;

@property (strong, nonatomic) UIButton *shareBtn;

@property (strong, nonatomic) UIButton *likeBtn;

@property (strong, nonatomic) UIImageView *shareImgView;

@property (strong, nonatomic) UIImageView *likeImgView;

@property (strong, nonatomic) UILabel *shareLab;

@property (strong, nonatomic) UILabel *likeLab;

@property (nonatomic,strong) JCShareView *shareView;

@property (nonatomic,strong) JCWTjInfoDetailBall *tjInfoDetailBall;


@end

@implementation JCHongbangDetailWMstckyVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@""];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
      self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (instancetype)init {
    if (self = [super init]) {
        self.height = AUTO(190)+kNavigationBarHeight;
        self.titleSizeNormal = 15;
        self.titleSizeSelected = 15;
        self.menuViewStyle = WMMenuViewStyleLine;
//        self.menuItemWidth = AUTO(40);
        self.progressWidth =0;
        self.viewTop = self.height;
        self.menuViewHeight = kWMMenuViewHeight;
        self.maximumHeaderViewHeight = self.height;
        self.minimumHeaderViewHeight = self.height-kNavigationBarHeight;
        self.contentView.bounces = NO;
    }
    return self;
}



- (void)setTjInfoId:(NSString *)tjInfoId {
    _tjInfoId = tjInfoId;
//    [self reloadData];
//    [self loadTjDetailData];
}

- (void)viewDidLoad {
    self.titleColorSelected = COLOR_FF4642;//COLOR_FE1F19
    self.titleColorNormal = COLOR_999999;
//    self.view.backgroundColor = [UIColor greenColor]
    [super viewDidLoad];
    [self initViews];
    self.title = @"方案详情";
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(loadNewsDetailData) name:@"JCDaShangSuccess" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(getMyUserInfo) name:@"JCDaShangSuccess" object:nil];
    self.autherHeadView = [[JCHongbangDetailTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWMMenuViewUserHeight)];

    self.autherHeadView.typeLab.hidden= YES;
    WeakSelf;
    self.autherHeadView.JCOrderDetailBlock = ^{
        JCHongBangOrderDetailVC *vc = [JCHongBangOrderDetailVC new];
        
        vc.order_id = weakSelf.tjInfoDetailBall.order_id;
        if (weakSelf.detailModel.match_info.count==1) {
            vc.all_wl = weakSelf.tjInfoDetailBall.all_wl;
            vc.wl = weakSelf.tjInfoDetailBall.all_wl;
        }
        if (weakSelf.detailModel.match_info.count>1) {
//            vc.wl = [NSString stringWithFormat:@"%ld",weakSelf.tjInfoDetailBall.wl];;
            NSString *wl = @"";
            for (int  i=0; i<weakSelf.detailModel.match_info.count; i++) {
                JCHongbangDetail_MatchModel *model = weakSelf.detailModel.match_info[i];
                if (i==0) {
                    wl = [NSString stringWithFormat:@"%ld",model.wl];
                }else{
                    wl = [NSString stringWithFormat:@"%@,%ld",wl,model.wl];
                }
            }
            
            
            vc.all_wl = wl;
            vc.wl = wl;
        }
        
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    self.autherHeadView.JCPushBlock = ^{
        NSMutableArray*tempMarr = [NSMutableArray arrayWithArray : weakSelf.navigationController.viewControllers];
        [tempMarr removeObject:weakSelf];
        for (UIViewController *vc in weakSelf.navigationController.viewControllers) {
            if ([vc isKindOfClass:[JCHongbangBuylWMstckyVC class]]||[vc isKindOfClass:[JCHongbangOrderWMstckyVC class]]) {
                [tempMarr removeObject:vc];
            }
        }
        [weakSelf.navigationController setViewControllers:tempMarr animated:YES];

        
    };
    [self.view addSubview:self.autherHeadView];
    
    
    [self loadDataInfo];
//    [self dataInfoWithdataDic:self.dataDic];

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
//加载数据
- (void)loadDataInfo {
    if (!self.detailModel) {
        return;
    }
    if (self.detailModel.talent_plan.status==8) {
        self.bottomView.hidden = YES;
    }
    NSArray *matchDataArray = self.detailModel.match_info;
    self.tjInfoDetailBall = self.detailModel.talent_plan;
  if (matchDataArray.count>1) {
      self.autherHeadView.showResult = YES;
  }
//  self.autherHeadView.expertDetailModel = tjUserBall;
  self.autherHeadView.tjInfoDetailBall = self.tjInfoDetailBall;
       self.likeLab.text = [self.tjInfoDetailBall.dz_number integerValue]==0?@"点赞":self.tjInfoDetailBall.dz_number;
      self.likeImgView.image = [self.tjInfoDetailBall.is_good integerValue]==0?JCIMAGE(@"daka_icon_dz_un"):JCIMAGE(@"daka_icon_dz");
    

  
  CGSize size  =  [self returnTextWidth:self.tjInfoDetailBall.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
  self.height = AUTO(140)+kNavigationBarHeight+size.height;
  self.maximumHeaderViewHeight = self.height;
  self.minimumHeaderViewHeight = self.height-kNavigationBarHeight;
//    if (kNavigationBarHeight==64) {
//        self.minimumHeaderViewHeight = self.height-kNavigationBarHeight-20;
//    }
  self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
  self.viewTop = self.height;
    
    self.shareView.imageUrl= self.tjInfoDetailBall.user_img;
    self.shareView.title = self.detailModel.wechat_share.share_title;
    self.shareView.desc = self.detailModel.wechat_share.share_desc;
    self.shareView.content = self.detailModel.wechat_share.share_desc;
    self.shareView.webPageUrl = self.detailModel.wechat_share.share_url;
    self.shareView.friend_url = self.detailModel.wechat_share.friend_url;
}

- (void)dataInfoWithdataDic:(NSDictionary *)dataDic {
    if (!dataDic) {
        return;
    }
      NSArray *matchDataArray = [JCWJsonTool arrayWithJson:dataDic[@"matchData"] class:[JCWVerTjInfoMatchBall class]];
     JCWExpertBall * tjUserBall = (JCWExpertBall *)[JCWJsonTool entityWithJson:dataDic[@"user"] class:[JCWExpertBall class]];
        self.expertDetailModel = tjUserBall;
    self.shareView.imageUrl= tjUserBall.user_img;

    
        
        self.tjInfoDetailBall = (JCWTjInfoDetailBall *)[JCWJsonTool entityWithJson:dataDic[@"tuijian"] class:[JCWTjInfoDetailBall class]];
    if (matchDataArray.count>1) {
        self.autherHeadView.showResult = YES;
    }
    self.autherHeadView.expertDetailModel = tjUserBall;
    self.autherHeadView.tjInfoDetailBall = self.tjInfoDetailBall;
        self.tjInfoDetailBall.order_id = dataDic[@"order_id"];
         self.likeLab.text = [self.tjInfoDetailBall.dz_number integerValue]==0?@"点赞":self.tjInfoDetailBall.dz_number;
        self.likeImgView.image = [self.tjInfoDetailBall.dz integerValue]==0?JCIMAGE(@"daka_icon_dz_un"):JCIMAGE(@"daka_icon_dz");
        self.shareView.title = dataDic[@"share_title"];
        self.shareView.desc = dataDic[@"share_desc"];
        self.shareView.content = dataDic[@"share_desc"];
        self.shareView.webPageUrl = dataDic[@"share_url"];
        self.shareView.friend_url = dataDic[@"friend_url"];
    
    CGSize size  =  [self returnTextWidth:self.tjInfoDetailBall.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
    self.height = AUTO(140)+kNavigationBarHeight+size.height;
    self.maximumHeaderViewHeight = self.height;
    self.minimumHeaderViewHeight = self.height-kNavigationBarHeight;
//    if (kNavigationBarHeight==64) {
//        self.minimumHeaderViewHeight = self.height-kNavigationBarHeight-20;
//    }
    self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
    self.viewTop = self.height;

    //            }
        
}



- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(20, 20)];
    
    CGFloat headerViewHeight = self.height;
//    CGFloat headerViewHeight = kWMMenuViewUserHeight;
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
     CGFloat offsetY = self.contentView.contentOffset.y;
     CGFloat maxOffsetY = kNavigationBarHeight;
     float percent = offsetY/maxOffsetY;
     
     if (percent>=1) {
         self.autherHeadView.userView.alpha = 0;

     }else{
         self.autherHeadView.userView.alpha = 1-percent;

     }
    
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-49-kBottomTabSafeAreaHeight+scrollView.contentOffset.y, SCREEN_WIDTH, 49+kBottomTabSafeAreaHeight);
//    [self.view bringSubviewToFront:self.bottomView];
    
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    JCHongbangDetailVC *vc = [JCHongbangDetailVC new];
    vc.detailModel = self.detailModel;
    return vc;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, _viewTop+1, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop;
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
    [service getArticleBrowseWithId:self.tjInfoDetailBall.id article_cate:@"1" type:@"2" success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {

        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
//点赞
- (void)addLikeCount {
    if (![JCWUserBall currentUser]) {
        [self presentLogin];
        return;
    }
    [self.view showLoading];
    JCHomeService_New * service = [JCHomeService_New service];
    [service getArticleBrowseWithId:self.tjInfoDetailBall.id article_cate:@"1" type:@"1" success:^(id  _Nullable object) {
        [self.view endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSString *is_good = object[@"data"][@"is_good"];
            self.tjInfoDetailBall.is_good = is_good;
            self.tjInfoDetailBall.dz_number= [NSString stringWithFormat:@"%@",object[@"data"][@"dz_number"]];
            self.likeLab.text = [self.tjInfoDetailBall.dz_number integerValue]>0?self.tjInfoDetailBall.dz_number:@"点赞";
            self.likeImgView.image =[ self.tjInfoDetailBall.is_good integerValue]==1?JCIMAGE(@"daka_icon_dz"):JCIMAGE(@"daka_icon_dz_un");

        }

    } failure:^(NSError * _Nonnull error) {
        [self.view endLoading];
    }];
}

- (void)loadNewsDetailData {
    JCHomeService_New *service = [JCHomeService_New new];
    [service getHongbang_TuijianDetailWithTuijian_id:self.detailModel.talent_plan.id orderID:@"" type:@"" Success:^(id  _Nullable object) {
        [[UIApplication sharedApplication].keyWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
           
            self.detailModel = (JCHongbangDetailModel *)[JCWJsonTool entityWithJson:object[@"data"] class:[JCHongbangDetailModel class]];
            [self reloadData];

        }else{
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [JCWToastTool showHint:@"网络异常"];
        [[UIApplication sharedApplication].keyWindow endLoading];
    }];

}

#pragma mark --

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

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
