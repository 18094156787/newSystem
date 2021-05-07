//
//  JCBaseViewController.h
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, JCNavigationBarStyle) {
    JCNavigationBarStyleDefault,//白底黑字
    JCNavigationBarStyleRed,     //红底白字
    JCNavigationBarStyleTransparent     //透明底白字
};
typedef NS_ENUM(NSInteger, JCStatusBarStyle) {
    JCStatusBarStyleDefault,//黑字
    JCStatusBarStyleLight   //白字
};

typedef void(^JCVCNeedReturnHeightBlock)(CGFloat contentH); //返回内容高度
typedef void(^JCVCDidChangeStatusBarFrameBlock)(void);      //StatusBar发生变化

NS_ASSUME_NONNULL_BEGIN
@interface JCBaseViewController : UIViewController
@property (nonatomic, copy) JCVCNeedReturnHeightBlock needReturnHeightBlock;
@property (nonatomic, copy) JCVCDidChangeStatusBarFrameBlock didChangeStatusBarFrameBlock;

//配置项
@property (nonatomic, strong) UIView * navBackView;
@property (nonatomic, assign) CGFloat navTitleAlpha;
@property (nonatomic, strong) UIColor * statusBarBackgroundColor;
@property (nonatomic, assign) JCNavigationBarStyle navigationBarStyle;
@property (nonatomic, assign) BOOL statusBarHidden;
@property (nonatomic,strong) UIView *fatherView;
@property (nonatomic,strong) UIWindow *jcWindow;
- (CGFloat)contentH;
- (void)presentLogin;
- (BOOL)isStatusBarConnectionMode;
- (void)setNavBackImg;//修改返回按钮的颜色
- (void)setNavBackImgWhiteColor;//白色返回箭头
//- (void)refreshData;
- (void)hideNavShadow;//隐藏导航栏顶部的线,阴影
- (void)initSubViews;

#pragma mark//活动广场

@property (nonatomic,strong) NSMutableArray *activtyArray;

- (void)showActivityPresentWithPosition:(NSString *)position ViewController:(UIViewController *)viewController;
@end
NS_ASSUME_NONNULL_END
