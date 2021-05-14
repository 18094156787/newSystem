//
//  JCBaseViewController.m
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCWConvertTool.h"
#import "UIView+CurrentVC.h"
#import "JCBaseNavigationController.h"
#import "JCNavButton.h"
#import "JCLoginWMStickVC.h"
#import "JCActivityTipView.h"
#import "JCActivityGuessVC.h"
#import "JCActivityDetailCommomVC.h"

@interface JCBaseViewController ()
@property (nonatomic, strong) NSDictionary * originNavTitleAttributes;
//@property (nonatomic, strong) UILabel * navTitleLabel;
@end

@implementation JCBaseViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//     self.navigationController.navigationBarHidden = NO;
//    self.navigationController.swipeBackEnabled = YES;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = JCWhiteColor;
    
    [self pickOriginNavTitleAttributes];
    //状态栏frame变化监听(如热点模式)
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didChangeStatusBarFrame) name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
    [self setNeedsStatusBarAppearanceUpdate];
    
//    self.edgesForExtendedLayout = YES;
//    self.automaticallyAdjustsScrollViewInsets = YES;
    [self initSubViews];
    self.statusBarHidden = NO;
}
- (void)didChangeStatusBarFrame {
    //NSLog(@"状态栏frame变了");
    if (self.didChangeStatusBarFrameBlock) {
        self.didChangeStatusBarFrameBlock();
    }
}
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIApplicationDidChangeStatusBarFrameNotification object:nil];
}
- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat navW = self.navigationController.navigationBar.bounds.size.width;
    CGFloat navH = self.navigationController.navigationBar.bounds.size.height;
    self.navBackView.frame = CGRectMake(0, -StatusBar_HEIGHT, navW, StatusBar_HEIGHT+navH);
}

#pragma mark - Setter && Getter
- (void)setNavBackView:(UIImageView *)navBackView {
    _navBackView = navBackView;
//    if (navBackView) {
//        [self.navigationController.navigationBar addSubview:navBackView];
//        [self.navigationController.navigationBar sendSubviewToBack:navBackView];
//    }
}
- (void)setNavTitleAlpha:(CGFloat)navTitleAlpha {
    _navTitleAlpha = navTitleAlpha;
    //遍历subviews
    for (UIView * barsv in self.navigationController.navigationBar.subviews) {
        if ([barsv isKindOfClass:NSClassFromString(@"_UINavigationBarContentView")]) {
            for (UIView * contentsv in barsv.subviews) {
                if ([contentsv isKindOfClass:[UILabel class]]) {
                    contentsv.alpha = navTitleAlpha;
                    return ;
                }
            }
        }
    }
}
- (void)setNavigationBarStyle:(JCNavigationBarStyle)navigationBarStyle {
    _navigationBarStyle = navigationBarStyle;
    
    //statusbar设定
    if (navigationBarStyle == JCNavigationBarStyleDefault) {
//        self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    }
    else if (navigationBarStyle == JCNavigationBarStyleRed){
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    else{
//        self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    }
    
    //navbar设定
    if (navigationBarStyle == JCNavigationBarStyleTransparent) {
        [self.navigationController.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        [self.navigationController.navigationBar setTranslucent:YES];
    } else {
        [self.navigationController.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:nil];
        [self.navigationController.navigationBar setTranslucent:NO];
    }
    
    //navtitle设定
    if (navigationBarStyle == JCNavigationBarStyleDefault) {
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
//        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor blackColor]}];
//        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor blackColor]}];
        [self.navigationController.navigationBar setBarTintColor:[UIColor whiteColor]];
        return ;
    } else if (navigationBarStyle == JCNavigationBarStyleRed) {
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
//        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor blackColor]}];
//        [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xE23F3D)];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor whiteColor]}];
        [self.navigationController.navigationBar setBarTintColor:COLOR_E4463E];
        return ;
    } else if (navigationBarStyle == JCNavigationBarStyleTransparent) {
        UIFont * font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
//        [[UINavigationBar appearance] setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor whiteColor]}];
//        [[UINavigationBar appearance] setBarTintColor:UIColorFromRGB(0xE23F3D)];
        
        [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:[UIColor whiteColor]}];
        //[self.navigationController.navigationBar setBarTintColor:UIColorFromRGB(0xE23F3D)];
        [self.navigationController.navigationBar setBarTintColor:[UIColor clearColor]];
        return ;
    }
}
//- (void)changeNavAlphaByScrollView:(UIScrollView *)scrollView maxOffseY:(CGFloat)maxOffsetY {
//    //self.hideNavBackWhenAppear = YES;
//    self.hideNavTitleWhenAppear = YES;
//    [scrollView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
//    self.observeScrollView = scrollView;
//    self.maxOffsetY = maxOffsetY;
//}
- (void)setStatusBarBackgroundColor:(UIColor *)statusBarBackgroundColor {
    _statusBarBackgroundColor = statusBarBackgroundColor;
    UIView *statusBar = [[[UIApplication sharedApplication] valueForKey:@"statusBarWindow"] valueForKey:@"statusBar"];
    if ([statusBar respondsToSelector:@selector(setBackgroundColor:)]) {
        statusBar.backgroundColor = statusBarBackgroundColor;
    }
    [self setNeedsStatusBarAppearanceUpdate];
}
- (void)setStatusBarHidden:(BOOL)statusBarHidden {
    _statusBarHidden = statusBarHidden;
    [self setNeedsStatusBarAppearanceUpdate];
}

//#pragma mark - Observe
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
//    CGPoint point = [((NSValue *)[self.observeScrollView valueForKey:keyPath]) CGPointValue];
//    CGFloat alpha = point.y/self.maxOffsetY;
//    if (self.isOnAppear) {
//        [self setNavBackAlpha:alpha];
//        [self setNavTitleAlpha:alpha];
//    }
//}

#pragma mark - 
- (CGFloat)contentH {
    NSLog(@"请重写contentH");
    return 0;
}
- (void)presentLogin {

    dispatch_async(dispatch_get_main_queue(), ^{

        [self.navigationController pushViewController:[JCLoginWMStickVC new] animated:YES];//
    });//
}
//- (void)refreshData {
//    NSLog(@"refreshData");
//}

#pragma mark - Basic
- (void)setNavTitleAlpha:(CGFloat)alpha color:(UIColor *)color {
    NSDictionary * attributes = self.navigationController.navigationBar.titleTextAttributes;
    if (![attributes.allKeys containsObject:NSForegroundColorAttributeName]) {
        return ;
    }
    NSMutableDictionary * mAttributes = [NSMutableDictionary dictionaryWithDictionary:attributes];
    UIColor * fontColor = color ? color : [mAttributes objectForKey:NSForegroundColorAttributeName];
    //.R.G.B
    CGFloat components[3];
    [self getRGBComponents:components forColor:fontColor];
    NSLog(@"%f %f %f", components[0], components[1], components[2]);
    
    UIColor * nextFontColor = [UIColor colorWithRed:components[0] green:components[1] blue:components[2] alpha:alpha];
    [mAttributes setValue:nextFontColor forKey:NSForegroundColorAttributeName];
    
    self.navigationController.navigationBar.titleTextAttributes = [mAttributes copy];
}
- (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color {
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component] / 255.0f;
    }
}

#pragma mark - Backen
- (void)pickOriginNavTitleAttributes {
    self.originNavTitleAttributes = self.navigationController.navigationBar.titleTextAttributes;
}
- (void)customizeNavTitleAttributes {
    self.originNavTitleAttributes = self.navigationController.navigationBar.titleTextAttributes;
}
- (void)restoreNav {
    self.navigationController.navigationBar.titleTextAttributes = self.originNavTitleAttributes;
//    [UIView animateWithDuration:0.3 animations:^{
//        self.navBackImageView.alpha = 0;
//    } completion:^(BOOL finished) {
//        [self.navBackImageView removeFromSuperview];
//    }];
}

- (void)setNavBackImg {
    JCNavButton * backBtn = [[JCNavButton alloc] initWithFrame:CGRectMake(0, 0, NavigationBar_HEIGHT, NavigationBar_HEIGHT)];
    if (self.navigationBarStyle == JCNavigationBarStyleRed||self.navigationBarStyle ==JCNavigationBarStyleTransparent) {
        backBtn.navButtonType = JCNavButtonTypeWhite;
    }else{
        backBtn.navButtonType = JCNavButtonTypeBack;
    }
    
    
    [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];

}

- (void)setNavBackImgWhiteColor {
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"common_title_back_white_bold") style:0 target:self action:@selector(back:)];
    item.tintColor = JCWhiteColor;
    self.navigationItem.leftBarButtonItem = item;
   
}

- (void)initSubViews {
    
}

- (void)back:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - ConnectionMode
- (BOOL)isStatusBarConnectionMode {
    //刘海屏:44、普通屏:20
    CGFloat statusH = [UIApplication sharedApplication].statusBarFrame.size.height;
    if (IPHONE_X) {
        return statusH != 44;
    }
    return statusH != 20;
}

#pragma mark - StatusBar
- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
    return UIStatusBarAnimationSlide;
}
- (BOOL)prefersStatusBarHidden {
    return self.statusBarHidden;
}

//去除导航栏阴影,导航栏顶部线
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

- (void)hideNavShadow {
    UIImageView * navBarHairlineImageView = [self findHairlineImageViewUnder:self.navigationController.navigationBar];
    navBarHairlineImageView.hidden = YES;
}

- (UIWindow *)jcWindow {
    return [UIApplication sharedApplication].keyWindow;
}


#pragma mark

- (void)showActivityPresentWithPosition:(NSString *)position ViewController:(UIViewController *)viewController {
    NSString *day = [[NSUserDefaults standardUserDefaults] objectForKey:JCActivity_show_date];
    //判断是否是同一天
    BOOL isSame = [NSDate isToday:day];
    if (day&&!isSame) {
        if ([JCWUserBall currentUser]) {
            //如果是已登录用户,隔天清空
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:JCActivity_data];
        }
        
    }
    
    id  old_Object = [[NSUserDefaults standardUserDefaults] objectForKey:JCActivity_data];
    NSString *actIDs = @"";
    if (old_Object) {
        NSArray *old_Data =  (NSArray *)old_Object;
        for (int i =0; i<old_Data.count; i++) {
            if (i==0) {
                actIDs = old_Data[i];
            }else {
                actIDs = [NSString stringWithFormat:@"%@,%@",actIDs,old_Data[i]];
            }
        }
    }
    

    JCActivityService *service = [JCActivityService new];
    [service getActivityPresentWithPosition:position actIDs:actIDs success:^(id  _Nullable object) {
        if ([JCWJsonTool isSuccessResponse:object]) {
            NSArray *array = [NSArray yy_modelArrayWithClass:[JCWSlideBall class] json:object[@"data"]];
            [[NSUserDefaults standardUserDefaults] setValue:[NSDate currentDay] forKey:JCActivity_show_date];
            self.activtyArray = [NSMutableArray arrayWithArray:array];
            if (self.activtyArray.count>0) {
                [self showActivityViewWithVC:self];
            }

           NSArray *old_array = [[NSUserDefaults standardUserDefaults] objectForKey:JCActivity_data];
            if (!old_array) {
                old_array = @[];
            }
            NSMutableArray *actID_Array = [NSMutableArray array];
            [array enumerateObjectsUsingBlock:^(JCWSlideBall *obj, NSUInteger idx, BOOL * _Nonnull stop) {
                if (![old_array containsObject:obj.id]) {
                    [actID_Array addObject:obj.id];
                }
                
            }];
            if (actID_Array.count>0) {
                [[NSUserDefaults standardUserDefaults] setValue:actID_Array forKey:JCActivity_data];
            }

        }
    } failure:^(NSError * _Nonnull error) {
        
    }];

}

- (void)showActivityViewWithVC:(UIViewController *)viewController {
    if (self.activtyArray.count>0) {
        JCActivityTipView *activityTipView = [JCActivityTipView new];
        JCWSlideBall *actModel = self.activtyArray.firstObject;
        [activityTipView.imgView sd_setImageWithURL:[NSURL URLWithString:actModel.img_url]];
        activityTipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        if (self.jcWindow.subviews.count>0) {
            [self.jcWindow insertSubview:activityTipView atIndex:self.jcWindow.subviews.count-1];
        }else {
            [self.jcWindow addSubview:activityTipView];
        }
//
//        [self.jcWindow addSubview:activityTipView];
//        [self.jcWindow insertSubview:activityTipView atIndex:0];
        WeakSelf;

        activityTipView.JCSureBlock = ^{

            [weakSelf.activtyArray removeObject:actModel];
            if ([actModel.type integerValue]==1) {

                if (![JCWStringTool isEmptyStr:actModel.app_url]) {
                    [JCPageRedirectManager redirectWithRoute:actModel.app_url vc:self];
                    return ;
                }
                //网址无效不跳转
                if (![JCWStringTool isUrlAddress:actModel.url]) {
                    return ;
                }
                WebViewController *webVC = [WebViewController new];
                webVC.urlStr = actModel.url;
                [self.navigationController pushViewController:webVC animated:YES];
            }

            
            
            if ([actModel.type integerValue]==2||[actModel.type integerValue]==3) {
                JCActivityDetailCommomVC *vc = [JCActivityDetailCommomVC new];
                vc.actID = actModel.id;
                [viewController.navigationController pushViewController:vc animated:YES];
                vc.JCCancelBlock = ^{
                    [weakSelf showActivityViewWithVC:weakSelf];
                };
            }
            if ([actModel.type integerValue]==4) {
                JCActivityGuessVC *vc = [JCActivityGuessVC new];
                vc.actID = actModel.id;
                [viewController.navigationController pushViewController:vc animated:YES];

                vc.JCCancelBlock = ^{
                    [weakSelf showActivityViewWithVC:weakSelf];
                };
            }

        };
        activityTipView.JCCancelBlock = ^{
            [weakSelf.activtyArray removeObject:actModel];
            [weakSelf showActivityViewWithVC:weakSelf];
        };
    }

}


#pragma mark - UIGestureRecognizerDelegate
//- (BOOL)gestureRecognizerShouldBegin：(UIGestureRecognizer *)gestureRecognizer {
// return self.navigationController.childViewControllers.count > 1;
//}
//  
//- (BOOL)gestureRecognizer：(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
//return self.navigationController.viewControllers.count > 1;
//}
@end
