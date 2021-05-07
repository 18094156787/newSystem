//
//  JCService_ShowVC.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCService_ShowVC.h"
#import "JCWConst.h"
#import "UIView+JCLoading.h"
@interface JCService_ShowVC ()

@end

@implementation JCService_ShowVC

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
    NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_service];
    
    self.urlStr = [urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
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
