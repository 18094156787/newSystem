//
//  JCPrivacyVC.m
//  Jingcai
//
//  Created by Administrator on 2019/2/16.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPrivacyVC.h"
#import "JCWConst.h"
#import "UIView+JCLoading.h"

@interface JCPrivacyVC ()

@end

@implementation JCPrivacyVC


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
    
//   NSString *url = [JCWInterfaceTool serviceUrlWithRoute:@"privacypolicy/鲸猜足球"];
    NSString *url = [NSString stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_privacy];
    
    self.urlStr = [url stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
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
