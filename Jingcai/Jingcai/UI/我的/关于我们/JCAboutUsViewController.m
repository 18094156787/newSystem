//
//  JCAboutUsViewController.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCAboutUsViewController.h"
#import "JCWConst.h"
#import "UIView+JCLoading.h"
@interface JCAboutUsViewController ()

@end

@implementation JCAboutUsViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    self.titleStr = @"关于我们";
   NSString *url = [NSString stringWithFormat:@"http://w.yixinzuqiu.com/#/about?dev=1&sv=%@",[JCWInterfaceTool appVersion]];
    self.urlStr = url;
//    self.urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [super viewDidLoad];
    
    WeakSelf;
    self.loadFailureBlock = ^{
        [JCWToastTool showHint:@"网络异常"];
    };
    self.loadSuccessBlock = ^{
        [weakSelf.view endLoading];
    };
}
@end
