//
//  JCAAVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCAAVC.h"
#import "JCMainTabBarController.h"
#import "JCYCHomeWMStickVC.h"
#import <WebKit/WebKit.h>
#import "JCMatchGoalDistributionTrendView.h"
@interface JCAAVC ()<WKNavigationDelegate, WKUIDelegate>
//@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) WKWebView *wkWebView; //webview
@property (strong, nonatomic) UIProgressView *progressView; //进度条
@property (strong, nonatomic) JCMatchGoalDistributionTrendView *trendView;

@end

@implementation JCAAVC
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.urlStr = @"https://tracker.namitiyu.com/zh/football?profile=YO0kUPHJ4faHB&id=3438865";
//    [self initSubviews];
//    self.title = NonNil(self.titleStr);
    [self initViews];

}

- (void)initViews {
//    []
    self.trendView= [JCMatchGoalDistributionTrendView new];
    [self.view addSubview:self.trendView];
    [self.trendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(100, 0, 0, 0));
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
//    CGFloat width = self.view.bounds.size.width;
//    CGFloat height = self.view.bounds.size.height;
//    if (@available(iOS 11.0, *)) {
//        height -= self.view.safeAreaInsets.bottom;
//    }
//    _wkWebView.frame = CGRectMake(0, 0, width, height);
}

- (void)initSubviews {
    //self.disableDragBack = YES;
    //self.navigationController.navigationBar.hidden = YES;
    
    //wkWebView
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_WIDTH*9/16)];
    _wkWebView.navigationDelegate = self;
    _wkWebView.UIDelegate = self;
    _wkWebView.allowsBackForwardNavigationGestures = YES;
    //kvo 添加进度监控
    [_wkWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:nil];
    [self.view addSubview:_wkWebView];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"https://tracker.namitiyu.com/zh/football?profile=YO0kUPHJ4faHB&id=3438865"]];
    [_wkWebView loadRequest:request];
    
    //progressView
    _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progressView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 3);
    // 设置进度条的色彩
    [_progressView setTrackTintColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]];
    _progressView.progressTintColor = [UIColor greenColor];
    [self.view addSubview:_progressView];
}

//KVO监听进度条
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    if ([keyPath isEqualToString:NSStringFromSelector(@selector(estimatedProgress))] && object == self.wkWebView) {
        [self.progressView setAlpha:1.0f];
        BOOL animated = self.wkWebView.estimatedProgress > self.progressView.progress;
        [self.progressView setProgress:self.wkWebView.estimatedProgress animated:animated];
        
        // Once complete, fade out UIProgressView
        if(self.wkWebView.estimatedProgress >= 1.0f) {
            [UIView animateWithDuration:0.3f delay:0.3f options:UIViewAnimationOptionCurveEaseOut animations:^{
                [self.progressView setAlpha:0.0f];
            } completion:^(BOOL finished) {
                [self.progressView setProgress:0.0f animated:NO];
            }];
        }
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//注意，观察的移除
-(void)dealloc{
    [self.wkWebView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
}

- (void)backItemClick:(UIButton *)sender {
    if (_wkWebView.canGoBack) {
        [_wkWebView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

-(void)closeItemClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 扩展方法
- (void)loadWebData {
    NSURLRequest * request = [NSURLRequest requestWithURL:[NSURL URLWithString:self.urlStr]];
    [self.wkWebView loadRequest:request];
}

#pragma mark ================ 自定义返回/关闭按钮 ================

-(void)updateNavigationItems {
    // 返回按钮
    CGFloat navH = NavigationBar_HEIGHT;
    UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, navH/2, navH)];
    button.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
    [button setImage:[UIImage imageNamed:@"common_title_back_white"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"common_title_back_white"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(backItemClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    if (self.wkWebView.canGoBack) {
        //self.disableDragBack = YES;
        //关闭按钮
        UIButton * closeBtn = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, navH, navH)];
        [closeBtn setTitle:@"关闭" forState:UIControlStateNormal];
        [closeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [closeBtn.titleLabel setFont:[UIFont systemFontOfSize:14.f]];
        [closeBtn addTarget:self action:@selector(closeItemClick:) forControlEvents:UIControlEventTouchUpInside];
        UIBarButtonItem * closeItem = [[UIBarButtonItem alloc] initWithCustomView:closeBtn];
        self.navigationItem.leftBarButtonItems = @[backItem, closeItem];
    } else {
        //self.disableDragBack = NO;
        self.navigationItem.leftBarButtonItems = @[backItem];
    }
}

#pragma mark ================ WKNavigationDelegate ================

//这个是网页加载完成，导航的变化
-(void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    // 获取加载网页的标题
    if (self.titleStr.length==0) {
        self.title = self.wkWebView.title;
    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    [self updateNavigationItems];
    if (self.loadSuccessBlock) {
        self.loadSuccessBlock();
    }
}

//开始加载
//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //开始加载的时候，让加载进度条显示
    self.progressView.hidden = NO;
    if ([webView.URL.absoluteString isEqualToString:@"https://m.jingcai.com/predict/index?app=mine_guess"]) {
            for (UIViewController *vc in self.navigationController.viewControllers) {
            if ([vc isKindOfClass:[JCYCHomeWMStickVC class]]) {
                [self.navigationController popToViewController:vc animated:YES];
                return ;
            }
        }
         JCMainTabBarController *tabbar =  (JCMainTabBarController *)[UIApplication sharedApplication].delegate.window.rootViewController;
        tabbar.tabSelIndex = 2;
    }

      NSLog(@"%@",webView.URL.absoluteString);
}

//内容返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{}

//服务器请求跳转的时候调用
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{}

//服务器开始请求的时候调用
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 如果不添加这个，那么wkwebview跳转不了AppStore
    if ([webView.URL.absoluteString hasPrefix:@"https://itunes.apple.com"]) {
        [[UIApplication sharedApplication] openURL:navigationAction.request.URL options:@{} completionHandler:nil];
        decisionHandler(WKNavigationActionPolicyCancel);
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
}

// 内容加载失败时候调用
-(void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation withError:(NSError *)error{
    NSLog(@"页面加载超时");
    if (self.loadFailureBlock) {
        self.loadFailureBlock();
    }
}

//跳转失败的时候调用
-(void)webView:(WKWebView *)webView didFailNavigation:(WKNavigation *)navigation withError:(NSError *)error {
    if (self.loadFailureBlock) {
        self.loadFailureBlock();
    }
}

//进度条
-(void)webViewWebContentProcessDidTerminate:(WKWebView *)webView {
    //
}

#pragma mark ================ WKUIDelegate ================

// 获取js 里面的提示
-(void)webView:(WKWebView *)webView runJavaScriptAlertPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(void))completionHandler{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler();
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
}

// js 信息的交流
-(void)webView:(WKWebView *)webView runJavaScriptConfirmPanelWithMessage:(NSString *)message initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(BOOL))completionHandler{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(YES);
    }]];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        completionHandler(NO);
    }]];
    [self presentViewController:alert animated:YES completion:NULL];
}

// 交互。可输入的文本。
-(void)webView:(WKWebView *)webView runJavaScriptTextInputPanelWithPrompt:(NSString *)prompt defaultText:(NSString *)defaultText initiatedByFrame:(WKFrameInfo *)frame completionHandler:(void (^)(NSString * _Nullable))completionHandler{
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"textinput" message:@"JS调用输入框" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.textColor = [UIColor redColor];
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        completionHandler([[alert.textFields lastObject] text]);
    }]];
    
    [self presentViewController:alert animated:YES completion:NULL];
    
}

@end
