//
//  JCColumnDetailWMViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCColumnDetailWMViewController.h"
#import "JCColumnDetailHeadView.h"
#import "WMMagicScrollView.h"
#import "JCColumnDetailIntroduceVC.h"
#import "JCColumnDetailFanganVC.h"
#import "JCColumnBuyVC.h"

static CGFloat const kWMMenuViewHeight = 44.0;

@interface JCColumnDetailWMViewController ()

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) JCColumnDetailHeadView *autherHeadView;

@property (nonatomic,strong) UIView *bottomView;

@property (nonatomic, strong) UIView *priceView;

@property (nonatomic, strong) UIButton *btnView;

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UILabel *yPriceLab;//原价

@property (nonatomic, strong) UILabel *statusLab;

@property (nonatomic, strong) UILabel *dateLab;

@property (nonatomic, strong) UIButton *sureBtn;

@property (nonatomic, strong) JCColumnDetailModel *detailModel;

@property (nonatomic, strong) JCColumnDetailIntroduceVC *introduceVC;

@property (nonatomic, assign) float height;

@property (nonatomic, assign) float scrollowOffset;

@end

@implementation JCColumnDetailWMViewController

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"介绍", @"方案"];
    }
    return _titleArray;
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationController.navigationBarHidden = NO;
     self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImgWhiteColor];
    [self initViews];
    
    UIImage *navImg =[UIImage imageNamed:@"JCColumnNav"];
      navImg = [navImg resizableImageWithCapInsets:UIEdgeInsetsZero resizingMode:UIImageResizingModeStretch];
    [self.navigationController.navigationBar setBackgroundImage:navImg forBarMetrics:UIBarMetricsDefault];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImage:@"JCColumnNav"];
    }
    
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-kNavigationBarHeight-kBottomTabSafeAreaHeight-AUTO(76)+self.contentView.contentOffset.y, SCREEN_WIDTH, AUTO(76)+kBottomTabSafeAreaHeight);
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    if (@available(iOS 15.0, *)) {
        [self configNavBarImageToNormal];
    }

}

- (instancetype)init {
    if (self = [super init]) {
        self.height = JCColumnHeaderViewHeight;
        self.titleSizeNormal = 16;
        self.titleSizeSelected = 16;
        self.titleColorSelected = COLOR_2F2F2F;//COLOR_FE1F19
        self.titleColorNormal = [COLOR_2F2F2F colorWithAlphaComponent:0.6];
        self.menuViewStyle = WMMenuViewStyleLine;
        self.progressWidth = 32;
        self.progressColor = JCBaseColor;
        self.progressViewBottomSpace = 1;
        self.viewTop = JCColumnHeaderViewHeight;
        self.menuViewHeight = kWMMenuViewHeight;
//        self.progressColor = [UIColor redColor];
        self.menuItemWidth = SCREEN_WIDTH/4.0f;
        self.maximumHeaderViewHeight = JCColumnHeaderViewHeight;
        self.minimumHeaderViewHeight = 0;
        self.contentView.bounces = NO;
        
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.autherHeadView = [[JCColumnDetailHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, JCColumnHeaderViewHeight)];
    WeakSelf;
    self.autherHeadView.JCConcernBlock = ^{
        [weakSelf concernColumn];
    };
//    WeakSelf;
//    self.autherHeadView.ShowAllBlock = ^(float height) {
//
//        if (height==0) {
//            weakSelf.height =JCColumnHeaderViewHeight;
//             weakSelf.autherHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, weakSelf.height);
//        }else{
//            weakSelf.height = AUTO(90)+kNavigationBarHeight+height;
//            weakSelf.autherHeadView.frame = CGRectMake(0, 0, SCREEN_WIDTH, weakSelf.height);
//        }
//        weakSelf.viewTop = weakSelf.height;
//        weakSelf.maximumHeaderViewHeight = weakSelf.height;
//        weakSelf.scrollView.contentSize = CGSizeMake(SCREEN_WIDTH, SCREEN_HEIGHT);
////        [weakSelf forceLayoutSubviews];
//
//    };
    [self.view addSubview:self.autherHeadView];
    
   

}

- (void)initViews {
    self.title = @"专栏详情";
    
//    self.bottomView.backgroundColor = JCBaseColor;
    [self.contentView addSubview:self.bottomView];
    self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-AUTO(76)-kBottomTabSafeAreaHeight-kNavigationBarHeight, SCREEN_WIDTH, AUTO(76)+kBottomTabSafeAreaHeight);
    
    [self.bottomView addSubview:self.priceView];
    [self.priceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.bottomView);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
        make.right.offset(AUTO(-170));
    }];
    
    [self.priceView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.priceView);
    }];
    
    [self.priceView addSubview:self.yPriceLab];
    [self.yPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right).offset(AUTO(15));
        make.bottom.equalTo(self.priceLab);
//        make.right.offset(0);
    }];

    [self.bottomView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.priceView);
        make.size.mas_equalTo(CGSizeMake(AUTO(144), AUTO(48)));
    }];
    
    [self.sureBtn addSubview:self.btnView];
    [self.btnView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.btnView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(4));
        make.centerX.equalTo(self.btnView);
        make.height.mas_equalTo(AUTO(22));
    }];

    [self.btnView addSubview:self.dateLab];
    [self.dateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.statusLab.mas_bottom);
        make.centerX.equalTo(self.btnView);
    }];
    
    
    NSString *price = [NSString stringWithFormat:@"%@红币/期",@"688"];
    NSMutableAttributedString *price_attr = [[NSMutableAttributedString alloc]initWithString:price];
    NSRange price_range = [price rangeOfString:@"红币/期"];
    [price_attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(10)],} range:price_range];
    self.priceLab.attributedText = price_attr;

    NSString *yPrice = [NSString stringWithFormat:@"%@红币",@"588"];
    NSMutableAttributedString *yPrice_attr = [[NSMutableAttributedString alloc]initWithString:yPrice];

    [yPrice_attr addAttributes:@{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle],NSBaselineOffsetAttributeName:@(NSUnderlineStyleSingle)} range:yPrice_attr.rangeOfAll];
    self.yPriceLab.attributedText = yPrice_attr;
    
    self.statusLab.text = @"立即订购";
    self.dateLab.text = @"第13期";
    
//    {
//        self.priceView.hidden = YES;
//        self.btnView.hidden = YES;
//            [self.sureBtn setTitle:@"第199期专栏将于30日99:99开始预售，敬请期待" forState:0];
//            [self.sureBtn mas_remakeConstraints:^(MASConstraintMaker *make) {
//                make.right.offset(AUTO(-15));
//                make.centerY.equalTo(self.bottomView);
//                make.left.offset(AUTO(15));
//                make.height.mas_equalTo(AUTO(48));
//        //        make.size.mas_equalTo(CGSizeMake(AUTO(144), AUTO(48)));
//            }];
//    }
    
    WeakSelf;
    [self.priceView bk_whenTapped:^{
        [weakSelf sureBtnClick];
    }];
    
}



- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat headerViewHeight = self.height;
//    CGFloat headerViewHeight = JCColumnHeaderViewHeight;
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
        self.bottomView.frame = CGRectMake(0, SCREEN_HEIGHT-AUTO(76)-kBottomTabSafeAreaHeight-kNavigationBarHeight+scrollView.contentOffset.y, SCREEN_WIDTH, AUTO(76)+kBottomTabSafeAreaHeight);
    }



    self.scrollowOffset = scrollView.contentOffset.y;
    
    NSLog(@"%.0f",scrollView.contentOffset.y);
}

#pragma mark - Datasource & Delegate
- (NSInteger)numbersOfChildControllersInPageController:(WMPageController *)pageController {
    return self.titleArray.count;
}

- (UIViewController *)pageController:(WMPageController *)pageController viewControllerAtIndex:(NSInteger)index {
    if (index==0) {
        
        if (!self.introduceVC) {
            self.introduceVC = [JCColumnDetailIntroduceVC new];
            self.introduceVC.column_id = self.column_id;
            WeakSelf;
            self.introduceVC.JCBlock = ^(JCColumnDetailModel * _Nonnull detailModel) {
                weakSelf.detailModel = detailModel;
                weakSelf.autherHeadView.detailModel = weakSelf.detailModel;
            };
        }
        
        return self.introduceVC;
    }


    JCColumnDetailFanganVC *vc = [JCColumnDetailFanganVC new];
    return vc;

}

- (NSString *)pageController:(WMPageController *)pageController titleAtIndex:(NSInteger)index {
    return self.titleArray[index];
}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForMenuView:(WMMenuView *)menuView {

    self.lineView.frame = CGRectMake(0, kWMMenuViewHeight-1, SCREEN_WIDTH, 1);
    [menuView addSubview:self.lineView];
    return CGRectMake(0, _viewTop, self.view.frame.size.width, kWMMenuViewHeight);

}

- (CGRect)pageController:(WMPageController *)pageController preferredFrameForContentView:(WMScrollView *)contentView {
    CGFloat originY = _viewTop + kWMMenuViewHeight;
    return CGRectMake(0, originY, self.view.frame.size.width, self.view.frame.size.height-kWMMenuViewHeight);
}

- (void)pageController:(WMPageController *)pageController willEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

}

- (void)pageController:(WMPageController *)pageController didEnterViewController:(__kindof UIViewController *)viewController withInfo:(NSDictionary *)info {

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
#pragma mark //购买
- (void)sureBtnClick {
    JCColumnBuyVC *vc = [JCColumnBuyVC new];
    [self.navigationController pushViewController:vc animated:YES];
}

#pragma mark//关注

- (void)concernColumn {
    [self.jcWindow showLoading];
    JCColumnService *service = [JCColumnService new];
    [service getConcernColumnWithID:NonNil(self.column_id) success:^(id  _Nullable object) {
        [self.jcWindow endLoading];
        if ([JCWJsonTool isSuccessResponse:object]) {
            
//            self.detailModel.is_subscribe
            if (object[@"is_subscribe"]) {
                self.detailModel.is_subscribe = object[@"is_subscribe"];
                self.autherHeadView.detailModel = self.detailModel;
            }

        }else {
            [JCWToastTool showHint:object[@"msg"]];
        }

    } failure:^(NSError * _Nonnull error) {
        [self.jcWindow endLoading];
    }];
 
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;;
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
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(26) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}
- (UILabel *)yPriceLab {
    if (!_yPriceLab) {
        _yPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _yPriceLab;
}
- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"" FontSize:AUTO(15) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(24)];
//        [_sureBtn addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _sureBtn;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

- (UILabel *)dateLab {
    if (!_dateLab) {
        _dateLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _dateLab;
}

- (UIView *)priceView {
    if (!_priceView) {
        _priceView = [UIView new];
//        _priceView.userInteractionEnabled = YES;
    }
    return _priceView;
}

- (UIButton *)btnView {
    if (!_btnView) {
        _btnView = [UIButton new];
        [_btnView addTarget:self action:@selector(sureBtnClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btnView;
}
@end
