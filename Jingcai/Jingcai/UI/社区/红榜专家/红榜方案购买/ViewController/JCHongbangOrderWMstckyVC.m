//
//  JCHongbangOrderWMstckyVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangOrderWMstckyVC.h"
#import "JCHongbangDetailTopView.h"
#import "JCHongbangOrderVC.h"
#import "JCWExpertBall.h"
#import "JCWTjInfoDetailBall.h"
#import "JCHongbangPriceInfoView.h"
#import "JCHongbangBuylWMstckyVC.h"
static CGFloat const kWMMenuViewHeight = 0;
static CGFloat const kWMMenuViewUserHeight = 60;
@interface JCHongbangOrderWMstckyVC ()

@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCHongbangDetailTopView *autherHeadView;

@property (nonatomic, strong) JCHongbangOrderVC *homeVC;

@property (nonatomic, strong) JCHongbangPriceInfoView *priceInfoView;

@end

@implementation JCHongbangOrderWMstckyVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@""];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self setNavBackImg];
//    [self initViews];
//    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-55-kBottomTabSafeAreaHeight+self.scrollView.contentOffset.y, SCREEN_WIDTH, 55+kBottomTabSafeAreaHeight);
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
        self.maximumHeaderViewHeight = kNavigationBarHeight;
        self.minimumHeaderViewHeight = 0;
        self.contentView.bounces = NO;
    }
    return self;
}



//- (void)setTjInfoId:(NSString *)tjInfoId {
//    _tjInfoId = tjInfoId;
////    [self reloadData];
//    [self loadTjDetailData];
//}

//- (void)setExpertDetailModel:(JCWExpertBall *)expertDetailModel {
//    _expertDetailModel = expertDetailModel;
//    self.autherHeadView.expertDetailModel = expertDetailModel;
//
//}

- (void)viewDidLoad {
    self.titleColorSelected = COLOR_FF4642;//COLOR_FE1F19
    self.titleColorNormal = COLOR_999999;
//    self.view.backgroundColor = [UIColor greenColor]
    [super viewDidLoad];
    self.title = @"方案详情";
    self.view.backgroundColor = COLOR_F4F6F9;
    self.autherHeadView = [[JCHongbangDetailTopView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWMMenuViewUserHeight)];
    WeakSelf;
    self.autherHeadView.backgroundColor = JCWhiteColor;
    self.autherHeadView.orderDetailView.hidden = YES;
    [self.view addSubview:self.autherHeadView];
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
    [self initViews];
    [self loadDataInfo];

}

//加载数据
- (void)loadDataInfo {
    if (!self.detailModel) {
        return;
    }
//    JCWExpertBall * tjUserBall = (JCWExpertBall *)[JCWJsonTool entityWithJson:dataDic[@"user"] class:[JCWExpertBall class]];
//    self.autherHeadView.expertDetailModel = tjUserBall;
    self.tjInfoDetailBall = self.detailModel.talent_plan;
    self.autherHeadView.tjInfoDetailBall = self.tjInfoDetailBall;
    self.priceInfoView.tjInfoDetailBall = self.tjInfoDetailBall;
    
    
    CGSize size  =  [self returnTextWidth:self.tjInfoDetailBall.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
    self.height = AUTO(150)+kNavigationBarHeight+size.height;
    self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
    self.viewTop = self.height;
    self.maximumHeaderViewHeight = self.height;
    self.minimumHeaderViewHeight = self.height-kNavigationBarHeight;
    
    
    
    
    
//    NSArray *matchDataArray = self.detailModel.match_info;
//    self.tjInfoDetailBall = self.detailModel.talent_plan;
//  if (matchDataArray.count>1) {
//      self.autherHeadView.showResult = YES;
//  }
////  self.autherHeadView.expertDetailModel = tjUserBall;
//  self.autherHeadView.tjInfoDetailBall = self.tjInfoDetailBall;
//       self.likeLab.text = [self.tjInfoDetailBall.dz_number integerValue]==0?@"点赞":self.tjInfoDetailBall.dz_number;
//      self.likeImgView.image = [self.tjInfoDetailBall.is_good integerValue]==0?JCIMAGE(@"daka_icon_dz_un"):JCIMAGE(@"daka_icon_dz");
//
//
//
//  CGSize size  =  [self returnTextWidth:self.tjInfoDetailBall.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
//  self.height = AUTO(140)+kNavigationBarHeight+size.height;
//  self.maximumHeaderViewHeight = self.height;
//  self.minimumHeaderViewHeight = self.height-kNavigationBarHeight;
////    if (kNavigationBarHeight==64) {
////        self.minimumHeaderViewHeight = self.height-kNavigationBarHeight-20;
////    }
//  self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
//  self.viewTop = self.height;
//
//    self.shareView.imageUrl= self.tjInfoDetailBall.user_img;
//    self.shareView.title = self.detailModel.wechat_share.share_title;
//    self.shareView.desc = self.detailModel.wechat_share.share_desc;
//    self.shareView.content = self.detailModel.wechat_share.share_desc;
//    self.shareView.webPageUrl = self.detailModel.wechat_share.share_desc;
//    self.shareView.friend_url = self.detailModel.wechat_share.friend_url;
}

- (void)initViews {
    [self.view addSubview:self.priceInfoView];
    self.priceInfoView.frame = CGRectMake(0, SCREEN_HEIGHT-76-kBottomTabSafeAreaHeight, SCREEN_WIDTH, 76+kBottomTabSafeAreaHeight);
    WeakSelf;
    self.priceInfoView.JCSureBtnClickBlock = ^{
        [weakSelf sureBtnClick];
    };

}

- (void)sureBtnClick {
    [self.homeVC sureBtnClick];
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
    [self.view bringSubviewToFront:self.priceInfoView];
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
    self.priceInfoView.frame = CGRectMake(0, SCREEN_HEIGHT-76-kBottomTabSafeAreaHeight+scrollView.contentOffset.y, SCREEN_WIDTH, 76+kBottomTabSafeAreaHeight);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    self.homeVC = [JCHongbangOrderVC new];
    self.homeVC.style =1;
    self.homeVC.tjInfoDetailBall= self.detailModel.talent_plan;
//    self.homeVC.expertID = self.tjInfoId;
//    self.homeVC.object = self.dataDic;
    WeakSelf;
    self.homeVC.JCPriceBlock = ^(NSString * _Nonnull price) {
        weakSelf.priceInfoView.price = price;
//        weakSelf.priceInfoView.hbPrice = @"红币";
        [weakSelf showOldPrice];
        
        
        
        
    };
     
//    self.homeVC.JCMatchStatusBlock = ^(BOOL end) {
//        //购买是否截止,截止则隐藏,反之显示
//        weakSelf.priceInfoView.hidden = end;
//    };
    return self.homeVC;

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
    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-NavigationStatusBarHeight-kBottomTabSafeAreaHeight-76-kWMMenuViewUserHeight);
}

//- (void)dataInfoWithdataDic:(NSDictionary *)dataDic {
//    if (!dataDic) {
//        return;
//    }
//    JCWExpertBall * tjUserBall = (JCWExpertBall *)[JCWJsonTool entityWithJson:dataDic[@"user"] class:[JCWExpertBall class]];
//    self.autherHeadView.expertDetailModel = tjUserBall;
//    self.tjInfoDetailBall = (JCWTjInfoDetailBall *)[JCWJsonTool entityWithJson:dataDic[@"tuijian"] class:[JCWTjInfoDetailBall class]];
//    self.autherHeadView.tjInfoDetailBall = self.tjInfoDetailBall;
////    self.tjInfoDetailBall.isAI = YES;
//    self.priceInfoView.tjInfoDetailBall = self.tjInfoDetailBall;
//    
//    CGSize size  =  [self returnTextWidth:self.tjInfoDetailBall.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
//    self.height = AUTO(150)+kNavigationBarHeight+size.height;
//    self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
//    self.viewTop = self.height;
//
//}

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
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

- (void)showOldPrice {
    if (self.homeVC.useHbModel) {
        if (([self.tjInfoDetailBall.sf floatValue]>=[self.tjInfoDetailBall.old_sf floatValue])) {
            NSString *price = [NSString stringWithFormat:@"%@",@([self.tjInfoDetailBall.sf floatValue]/100.0f)];
            NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:price];

            [attribtStr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:attribtStr.rangeOfAll];

//                        self.priceInfoView.hbPriceLab.attributedText = attribtStr;
            if ([self.homeVC.useHbModel.id integerValue]==0) {
                self.priceInfoView.hbPrice = @"";
            }else{
                self.priceInfoView.hbPrice = price;
                
            }
                
        }else{
//                        self.priceInfoView.hbPriceLab.text = @"";
            self.priceInfoView.hbPrice = @"";
        }

    }else{
        self.priceInfoView.hbPrice = @"";
    }

}

#pragma mark --

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}


- (JCHongbangPriceInfoView *)priceInfoView{
    if (!_priceInfoView) {
        _priceInfoView = [JCHongbangPriceInfoView new];
//        _priceInfoView.hidden = YES;
    }
    return _priceInfoView;
}

@end
