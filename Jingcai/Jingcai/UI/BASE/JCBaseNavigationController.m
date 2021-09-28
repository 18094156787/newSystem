//
//  JCBaseNavigationController.m
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseNavigationController.h"
#import <SVProgressHUD/SVProgressHUD.h>
#import "JCWConvertTool.h"
#import "JNTabBar.h"
#import "JCWConvertTool.h"
#import "JCNavButton.h"
#import "JCPostCheckArticleVC.h"
@interface JCBaseNavigationController ()<UIGestureRecognizerDelegate>
@end

@implementation JCBaseNavigationController
- (void)viewDidLoad {
    [super viewDidLoad];
    UIFont * font = [UIFont fontWithName:@"PingFangSC-Semibold" size:18];
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:font, NSForegroundColorAttributeName:UIColorFromRGB(0x000000)}];
//    self.interactivePopGestureRecognizer.delegate = self;
    
//    [self.navigationBar setBarTintColor:[UIColor whiteColor]];
//    [self.navigationBar setTranslucent:NO];
//    UIImage * colorImage = [JCWConvertTool imageWithColor:UIColorFromRGB(0xF3F3F3) size:CGSizeMake(self.view.frame.size.width, 1)];
//    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
//    [self.navigationBar setShadowImage:colorImage];
}
/**
 *  能拦截所有push进来的子控制器
 */
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (self.viewControllers.count > 0) { // 如果现在push的不是栈底控制器(最先push进来的那个控制器)
        viewController.hidesBottomBarWhenPushed = YES;
        // 设置导航栏按钮
        CGFloat navH = NavigationBar_HEIGHT;
        JCNavButton * backBtn = [[JCNavButton alloc] initWithFrame:CGRectMake(0, 0, navH, navH)];
        backBtn.navButtonType = JCNavButtonTypeBack;
        [self configBackTypeWithVC:viewController btn:backBtn];
        [backBtn addTarget:self action:@selector(back:) forControlEvents:UIControlEventTouchUpInside];
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backBtn];
    }
    [super pushViewController:viewController animated:animated];
}
- (NSArray<__kindof UIViewController *> *)popToRootViewControllerAnimated:(BOOL)animated{
    if (self.viewControllers.count > 0 ) {
        UIViewController *popController = self.viewControllers.lastObject;
        popController.hidesBottomBarWhenPushed = NO;
//        if ([popController isKindOfClass:[JCPostCheckArticleVC class]]) {
//            popController.hidesBottomBarWhenPushed = NO;
//        }
    }
    return [super popToRootViewControllerAnimated:animated];

}
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
}
//修改返回键的颜色
- (void)configBackTypeWithVC:(UIViewController *)vc btn:(JCNavButton *)sender{


    
}



- (void)back:(UIButton *)sender {
    [self popViewControllerAnimated:YES];
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
  if (self.viewControllers.count <= 1 ) {
      return NO;
  }
  return YES;
}
// 允许同时响应多个手势
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldRecognizeSimultaneouslyWithGestureRecognizer:
(UIGestureRecognizer *)otherGestureRecognizer {
   return YES;
}
//禁止响应手势的是否ViewController中scrollView跟着滚动
- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer
shouldBeRequiredToFailByGestureRecognizer:
(UIGestureRecognizer *)otherGestureRecognizer {
return [gestureRecognizer isKindOfClass:
UIScreenEdgePanGestureRecognizer.class];
}
@end
