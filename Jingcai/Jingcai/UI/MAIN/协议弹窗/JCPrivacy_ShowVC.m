//
//  JCPrivacy_ShowVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPrivacy_ShowVC.h"
#import "JCWConst.h"
#import "UIView+JCLoading.h"

@interface JCPrivacy_ShowVC ()

@end

@implementation JCPrivacy_ShowVC


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    self.navigationBarStyle = JCNavigationBarStyleDefault;
//    [self setNavBackImg];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    self.navigationBarStyle = JCNavigationBarStyleDefault;
}

- (void)viewDidLoad {
    
//   NSString *url = [JCWInterfaceTool serviceUrlWithRoute:@"privacypolicy/鲸猜足球"];
    NSString *url = @"http://api.yixinzuqiu.com/v1/zucai/privacypolicy/鲸猜足球";
    
    self.urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    [super viewDidLoad];
    
    WeakSelf;
    self.loadFailureBlock = ^{
        [JCWToastTool showHint:@"网络异常"];
    };
    self.loadSuccessBlock = ^{
        [weakSelf.view endLoading];
    };
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] initWithImage:JCIMAGE(@"common_title_back") style:0 target:self action:@selector(backItemClick)];
    backItem.tintColor = COLOR_2F2F2F;
    self.navigationItem.leftBarButtonItem = backItem;
}

- (void)backItemClick {
    [self dismissViewControllerAnimated:YES completion:^{

    }];
}

@end
