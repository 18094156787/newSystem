//
//  JCDakaBuyPlanStickWMVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaBuyPlanStickWMVC.h"
#import "JCDakaPlanDetailAutherHeadView.h"
#import "JCDakaBuyPlanVC.h"
#import "JCHongBangOrderDetailVC.h"
static CGFloat const kWMMenuViewHeight = 0;
@interface JCDakaBuyPlanStickWMVC ()

@property (nonatomic, assign) float height;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCDakaPlanDetailAutherHeadView *autherHeadView;

@property (nonatomic, strong) JCDakaBuyPlanVC *homeVC;

@property (nonatomic, strong) JCWExpertBall *expertDetailModel;

@property (nonatomic, strong) UIView *bottomView;

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UILabel *hbPriceLab;//没有使用红包的原价

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, assign) BOOL isLoad;

@end

@implementation JCDakaBuyPlanStickWMVC

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"",];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleTransparent;
    [self initViews];
    [self setNavBackImg];
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-76+self.contentView.contentOffset.y, SCREEN_WIDTH, 76);
    NSLog(@"%.0f",self.contentView.contentOffset.y);
    
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
    self.titleColorSelected = COLOR_FF4642;//COLOR_FE1F19
    self.titleColorNormal = COLOR_999999;
//    self.view.backgroundColor = [UIColor greenColor]
        [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"方案详情";
    self.view.backgroundColor = JCNavColor;
    self.autherHeadView = [[JCDakaPlanDetailAutherHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, kWHongbangDetailHeaderViewHeight)];
    
    WeakSelf;
    self.autherHeadView.JCPushBlock = ^{
                NSMutableArray*tempMarr = [NSMutableArray arrayWithArray : weakSelf.navigationController.viewControllers];
                [tempMarr removeObject:weakSelf];
                [weakSelf.navigationController setViewControllers:tempMarr animated:YES];
    };
    self.autherHeadView.JCOrderDetailBlock = ^{
        JCHongBangOrderDetailVC *vc = [JCHongBangOrderDetailVC new];
        vc.order_id = weakSelf.self.payInfoModel.order_id;
        [weakSelf.navigationController pushViewController:vc animated:YES];
    };
    [self.view addSubview:self.autherHeadView];
    [self loadDataInfo];
//    [self refreshData];

}

- (void)loadDataInfo {

    self.autherHeadView.infoModel = self.payInfoModel;
//    self.autherHeadView.orderDetailView.hidden = YES;
    CGSize size  =  [self returnTextWidth:self.payInfoModel.title size:CGSizeMake(SCREEN_WIDTH-AUTO(30), 100) font:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(16)]];
    self.height = AUTO(150)+kNavigationBarHeight+size.height;
    self.maximumHeaderViewHeight = self.height;
    self.minimumHeaderViewHeight = self.height-kNavigationBarHeight;

    self.autherHeadView.frame = CGRectMake(0, 0, CGRectGetWidth(self.view.bounds), self.height);
    self.viewTop = self.height;
    self.isLoad = YES;
    
    [self reloadData];
}

- (void)initViews {

    
    [self.view addSubview:self.bottomView];
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-76, SCREEN_WIDTH, 76);
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-76, SCREEN_WIDTH, 76);
    self.bottomView.layer.shadowColor = [UIColor colorWithRed:221/255.0 green:221/255.0 blue:221/255.0 alpha:0.5].CGColor;
    self.bottomView.layer.shadowOffset = CGSizeMake(0,-1);
    self.bottomView.layer.shadowOpacity = 1;
    self.bottomView.layer.shadowRadius = 1.5;
    UIButton *sureBtn = [UIButton initWithText:@"确认支付" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
    [sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
    [self.bottomView addSubview:sureBtn];
    self.sureBtn = sureBtn;
    [sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(AUTO(128), AUTO(44)));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"需支付: " andFont:AUTO(13) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bottomView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(sureBtn);
    }];
    

    
    NSString *price = [NSString stringWithFormat:@"%@",@([self.payInfoModel.sf floatValue]/100.0f)];

    self.priceLab.text = price;
    [self.bottomView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(infoLab.mas_right);
        make.centerY.equalTo(sureBtn);
    }];
    

    
    UILabel *priceLab = [UILabel initWithTitle:@"红币" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bottomView addSubview:priceLab];
    [priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right).offset(3);
        make.centerY.equalTo(self.priceLab);
    }];
    
    [self.bottomView addSubview:self.hbPriceLab];
    [self.hbPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(priceLab.mas_right).offset(15);
        make.centerY.equalTo(sureBtn).offset(3);
    }];

    
    WeakSelf;
    [sureBtn bk_whenTapped:^{
        [weakSelf.homeVC sureBtnClick];
    }];
}




- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    [self addCornerWithView:self.menuView type:UIRectCornerTopLeft|UIRectCornerTopRight size:CGSizeMake(20, 20)];
    
    CGFloat headerViewHeight = self.height;
//    CGFloat headerViewHeight = kWHongbangDetailHeaderViewHeight;
    CGFloat headerViewX = 0;
    UIScrollView *scrollView = (UIScrollView *)self.view;
    if (scrollView.contentOffset.y < 0) {
        headerViewX = scrollView.contentOffset.y;
        headerViewHeight -= headerViewX;

    }
    self.autherHeadView.frame = CGRectMake(0, headerViewX, CGRectGetWidth(self.view.bounds), self.height);
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
        if (scrollView.contentOffset.y>30) {
            self.autherHeadView.bgView.hidden = YES;
//            self.title = self.expertDetailModel.user_name;
        }else {
            self.autherHeadView.bgView.hidden = NO;
//            self.title = @"";
        }
    }
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-76+scrollView.contentOffset.y, SCREEN_WIDTH, 76);
//    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (self.isLoad) {
        self.homeVC = [JCDakaBuyPlanVC new];
        self.homeVC.payInfoModel = self.payInfoModel;
        WeakSelf;
        self.homeVC.JCPirceBlock = ^(NSString * _Nonnull price) {
            weakSelf.priceLab.text = price;
            [weakSelf showOldPrice];
            
        };
        self.homeVC.JCEndBlock = ^(bool isEnd) {
            if (isEnd) {
                weakSelf.sureBtn.userInteractionEnabled = NO;
                weakSelf.sureBtn.backgroundColor = COLOR_9F9F9F;
                [weakSelf.sureBtn setTitle:@"无法购买" forState:0];
                weakSelf.hbPriceLab.text = @"";
            }
        };
        return self.homeVC;
    }

    return [UIViewController new];

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {
    menuView.backgroundColor = JCWhiteColor;
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
//    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height-NavigationStatusBarHeight-kBottomTabSafeAreaHeight-49);
    return CGRectMake(0, originY, self.view.frame.size.width, SCREEN_HEIGHT-76-self.height+kNavigationBarHeight);
    
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

- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}
- (void)showOldPrice {
    if (self.homeVC.useHbModel) {
        NSString *hBprice = [NSString stringWithFormat:@"%@红币",@([self.payInfoModel.sf floatValue]/100.0f)];

        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:hBprice];

        [attribtStr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:attribtStr.rangeOfAll];

//                        self.priceInfoView.hbPriceLab.attributedText = attribtStr;
        if ([self.homeVC.useHbModel.id integerValue]==0) {
            self.hbPriceLab.text = @"";
        }else{
            self.hbPriceLab.attributedText = attribtStr;
 
            
        }

    }else{
        self.hbPriceLab.text = @"";
    }
    if (self.payInfoModel.is_end==1) {
        self.hbPriceLab.text = @"";//已截止不显示
    }

}
#pragma mark --

- (void)back {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = [UIColor whiteColor];
    }
    return _bottomView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(28) andWeight:2 andTextColor:COLOR_FE644D andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}
- (UILabel *)hbPriceLab {
    if (!_hbPriceLab) {
        _hbPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _hbPriceLab;
}
@end
