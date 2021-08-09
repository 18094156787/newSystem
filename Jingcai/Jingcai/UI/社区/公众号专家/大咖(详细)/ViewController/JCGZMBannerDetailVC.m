//
//  JCGZMBannerDetailVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCGZMBannerDetailVC.h"
#import <WKWebView+AFNetworking.h>
#import <WebKit/WebKit.h>
@interface JCGZMBannerDetailVC ()<WKNavigationDelegate>

@property (strong, nonatomic) WKWebView * webView;

@end

@implementation JCGZMBannerDetailVC

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.title = self.titleName;
    
    [self initSubViews];
//    [self refreshData];
}

//- (void)refreshData {
//    [self.view showLoading];
//    JCUserService_New * service = [JCUserService_New service];
//    [service disableAccountTextWithoperation:@"1" mobile:@"" code:@"" Success:^(id  _Nullable object) {
//        [self.view endLoading];
//        if ([JCWJsonTool isSuccessResponse:object]) {
//            NSString *count = object[@"data"][@"count"];
//            self.count = [count integerValue];
//
//            NSString *content = object[@"data"][@"html_text"];
//
//
//            return;
//        }
//        [JCWToastTool showHint:object[@"msg"]];
//
//    } failure:^(NSError * _Nonnull error) {
//        [self.view endLoading];
//    }];
//
//}

- (void)initSubViews {
    
    [self.view addSubview:self.webView];
    [self.webView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.right.offset(0);
        make.bottom.offset(-kBottomTabSafeAreaHeight);
    }];
    

    

}

- (void)setContent:(NSString *)content {
    _content = content;
//    NSString *headStr = [NSString stringWithFormat:@"<head><style>img{max-width:%f !important;height:auto;font-size:14px}*{font-size:14px!important}</style></head>", SCREEN_WIDTH-60];
////    str = [str stringByAppendingString:@"\n\n\n\n"];
//    NSString  * str = [NSString stringWithFormat:@"%@<html><meta content=\"width=device-width, initial-scale=1.0, maximum-scale=3.0, user-scalable=0; \" name=\"viewport\" /><body style=\"overflow-wrap:break-word;word-break:break-all;white-space: normal; font-size:14px!important;  \">%@</body></html>",headStr,self.content];
//    [self.webView loadHTMLString:str baseURL:nil];
    NSString *headerString = @"<header><meta name='viewport' content='width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no'><style>img{max-width:100%}</style></header>";
    [self.webView loadHTMLString:[headerString stringByAppendingString:self.content] baseURL:nil];
//    [self.webView loadHTMLString:self.content baseURL:nil];
}

- (void)setTitleName:(NSString *)titleName {
    _titleName = titleName;
    self.title = titleName;
}


- (WKWebView *)webView {
    if (!_webView) {
        _webView = [WKWebView new];
        _webView.scrollView.showsVerticalScrollIndicator = NO;
        _webView.scrollView.showsHorizontalScrollIndicator = NO;
        _webView.navigationDelegate = self;
        
        _webView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
//        _webView.scrollView.scrollEnabled = NO;
        _webView.userInteractionEnabled = YES;
//        _webView.contentScaleFactor = 1;
    }
    return _webView;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
