//
//  WebViewController.m
//  CoinWay
//
//  Created by Rain on 2018/7/15.
//  Copyright © 2018年 rain. All rights reserved.
//

#import "WebViewController.h"
#import "JCMainTabBarController.h"
#import "JCYCHomeWMStickVC.h"
#import <WebKit/WebKit.h>
#import "JCShareView.h"
#import "JCPageRedirectManager.h"

@interface WebViewController () <WKNavigationDelegate, WKUIDelegate,WKScriptMessageHandler>
//@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (strong, nonatomic) WKWebView *wkWebView; //webview
@property (strong, nonatomic) UIProgressView *progressView; //进度条

@property (nonatomic,strong) JCShareView *shareView;



@end

@implementation WebViewController

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    // 因此这里要记得移除handlers
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"Login"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startExpert"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startTalent"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startExpertArticle"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startTalentArticle"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startExpertPage"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startTalentPage"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startRecharge"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startMatchDetails"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"startTeamDetails"];
    [self.wkWebView.configuration.userContentController removeScriptMessageHandlerForName:@"userShare"];
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
    [self loadWebData];//请求数据
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"Login"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startExpert"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startTalent"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startExpertArticle"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startTalentArticle"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startExpertPage"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startTalentPage"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startRecharge"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startMatchDetails"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"startTeamDetails"];
    [self.wkWebView.configuration.userContentController addScriptMessageHandler:self name:@"userShare"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initSubviews];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLoginAction) name:NotificationUserLogin object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userLoginAction) name:UserRegisterSuccess object:nil];
}


- (void)userLoginAction {
    //h5要连续调用2次才能成功刷新带有token页面
    [self loadWebData];
    [self loadWebData];
}


- (void)backItemClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    CGFloat width = self.view.bounds.size.width;
    CGFloat height = self.view.bounds.size.height;
    if (@available(iOS 11.0, *)) {
        height -= self.view.safeAreaInsets.bottom;
    }
    _wkWebView.frame = CGRectMake(0, 0, width, height);
}

- (void)initSubviews {
    //self.disableDragBack = YES;
    //self.navigationController.navigationBar.hidden = YES;
    
    if (self.isYCRule) {
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:AppDidLoad];
    }
    self.title = NonNil(self.titleStr);
    [self.wkWebView addObserver:self forKeyPath:@"title" options:NSKeyValueObservingOptionNew context:NULL];
    
    if (self.showBackItem) {
        UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"common_title_back") style:0 target:self action:@selector(backItemClick)];
        backItem.tintColor = COLOR_2F2F2F;
        self.navigationItem.leftBarButtonItem = backItem;
    }
    WKWebViewConfiguration *configuration = [[WKWebViewConfiguration alloc] init];
    WKPreferences *preference = [WKPreferences new];
    preference.javaScriptCanOpenWindowsAutomatically = YES;
//    preference.minimumFontSize = 40.0;
    configuration.preferences = preference;
    
    //wkWebView
    _wkWebView = [[WKWebView alloc] initWithFrame:CGRectZero configuration:configuration];
    _wkWebView.navigationDelegate = self;
    _wkWebView.UIDelegate = self;
    _wkWebView.allowsBackForwardNavigationGestures = YES;
    //kvo 添加进度监控
    [_wkWebView addObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress)) options:0 context:nil];
    [self.view addSubview:_wkWebView];
  


    
    //progressView
    _progressView = [[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
    _progressView.frame = CGRectMake(0, 0, self.view.bounds.size.width, 3);
    // 设置进度条的色彩
    [_progressView setTrackTintColor:[UIColor colorWithRed:240.0/255 green:240.0/255 blue:240.0/255 alpha:1.0]];
    _progressView.progressTintColor = [UIColor greenColor];
    [self.view addSubview:_progressView];
    
    if (self.isHomeBanner) {
        UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"ic_share_black") style:0 target:self action:@selector(shareItemClick)];
        shareItem.tintColor = JCBlackColor;
        self.navigationItem.rightBarButtonItem = shareItem;
    }
}



- (void)shareItemClick {
    WeakSelf;
    [weakSelf.shareView show];

}

- (void)setSlide:(JCWSlideBall *)slide {
    _slide = slide;
    self.shareView.title = slide.wechat_share.share_title;
    self.shareView.content = slide.wechat_share.share_desc;
    self.shareView.desc = slide.wechat_share.share_desc;
    self.shareView.webPageUrl = slide.wechat_share.share_url;
    self.shareView.friend_url = slide.wechat_share.friend_url;
}


#pragma mark - WKScriptMessageHandler

- (void)userContentController:(WKUserContentController *)userContentController didReceiveScriptMessage:(WKScriptMessage *)message {
    // message.body  --  Allowed types are NSNumber, NSString, NSDate, NSArray,NSDictionary, and NSNull.
    if ([message.name isEqualToString:@"userShare"]) {
        NSLog(@"%@",message.body);
        if ([message.body isKindOfClass:[NSDictionary class]]) {
//            NSDictionary *dic = [message.body isKindOfClass:[NSDictionary class]];
            JCShareModel *slide = (JCShareModel *)[JCWJsonTool entityWithJson:message.body class:[JCShareModel class]];
            self.shareView.title = slide.share_title;
            self.shareView.content = slide.share_desc;
            self.shareView.desc = slide.share_desc;
            self.shareView.webPageUrl = slide.share_url;
            self.shareView.friend_url = slide   .friend_url;
            
            UIBarButtonItem *shareItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"ic_share_black") style:0 target:self action:@selector(shareItemClick)];
            shareItem.tintColor = JCBlackColor;
            self.navigationItem.rightBarButtonItem = shareItem;
        }
    }else{
        [JCPageRedirectManager redirectHtmlWithRoute:message.name param:message.body vc:self];
    }
    

    
}

- (void)userLogin {
    [self presentLogin];
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
    }else if ([keyPath isEqualToString:@"title"]) {
        if (self.titleStr.length==0) {
            NSLog(@"%@",self.wkWebView.title);
            self.title = self.wkWebView.title;
        }

        
    }else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

//注意，观察的移除
-(void)dealloc{
    [self.wkWebView removeObserver:self forKeyPath:NSStringFromSelector(@selector(estimatedProgress))];
    [self.wkWebView removeObserver:self forKeyPath:@"title"];
}
//这个是prsentVC时,导航栏没有一个返回键,这边加上
- (void)backItemClick:(UIButton *)sender {
    if (_wkWebView.canGoBack) {
        [_wkWebView goBack];
    } else {
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (void)back:(UIButton *)sender {
    if (self.JCCancelBlock) {
        self.JCCancelBlock();
    }
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)closeItemClick:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 扩展方法
- (void)loadWebData {
    NSString *link_url = self.urlStr;

    if ([link_url containsString:@"#"]) {
        NSArray *array = [link_url componentsSeparatedByString:@"#"];
        NSLog(@"%@",array);
        NSString *appand = [NSString stringWithFormat:@"?dev=1&sv=%@&token=%@&native=ios",[JCWInterfaceTool appVersion],NonNil([JCWUserBall currentUser].token)];
        if (array.count>=2) {
            link_url = [NSString stringWithFormat:@"%@%@#%@",array[0],appand,array[1]];
        }
    }else{
        if ([link_url containsString:@"?"]) {
            link_url = [NSString stringWithFormat:@"%@&dev=1&sv=%@&native=ios",link_url,[JCWInterfaceTool appVersion]];
        }else{
            link_url = [NSString stringWithFormat:@"%@?dev=1&sv=%@&native=ios",link_url,[JCWInterfaceTool appVersion]];
        }
    }

    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:link_url]];
    NSLog(@"请求链接%@",link_url);
    [_wkWebView loadRequest:request];
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
//    if (self.titleStr.length==0) {
//        NSLog(@"%@",self.wkWebView.title);
    if (self.titleStr.length==0) {
        self.title = self.wkWebView.title;
    }
       
//    }
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
//    [self updateNavigationItems];
    if (self.loadSuccessBlock) {
        self.loadSuccessBlock();
    }
}


//开始加载
-(void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation{
    //开始加载的时候，让加载进度条显示
    self.progressView.hidden = NO;
    NSLog(@"%@",webView.URL.absoluteString);
    
    if ([webView.URL.absoluteString isEqualToString:@"https://wap.jingcai.com/"]||[webView.URL.absoluteString isEqualToString:@"http://wap.jingcai.com/"]||[webView.URL.absoluteString isEqualToString:@"https://www.jingcai.com/"]||[webView.URL.absoluteString isEqualToString:@"http://www.jingcai.com/"]) {
        [self.navigationController popViewControllerAnimated:YES];
    }

      
}

//内容返回时调用
-(void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation{}

//服务器请求跳转的时候调用
-(void)webView:(WKWebView *)webView didReceiveServerRedirectForProvisionalNavigation:(WKNavigation *)navigation{
    
    
}

//服务器开始请求的时候调用
- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    // 如果不添加这个，那么wkwebview跳转不了AppStore
    NSLog(@"%@",webView.URL.absoluteString);
    
    if ([webView.URL.absoluteString containsString:@"app_jump"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        [self.progressView setProgress:0 animated:NO];
        [JCPageRedirectManager jumpVCWithRoute:webView.URL.absoluteString vc:self];
       
    }
    else  {
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
- (JCShareView *)shareView {
    if (!_shareView) {
        _shareView = [JCShareView viewFromXib];
//        _shareView.titleString = @"分享方案";
        _shareView.image = JCIMAGE(@"icon_app");
    }
    return _shareView;
}
@end
