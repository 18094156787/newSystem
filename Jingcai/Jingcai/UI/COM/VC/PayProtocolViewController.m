//
//  PayProtocolViewController.m
//  Jingcai
//
//  Created by Rain on 2018/10/10.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "PayProtocolViewController.h"
#import "JCWConst.h"
#import "UIView+JCLoading.h"

@interface PayProtocolViewController ()
@end

@implementation PayProtocolViewController
- (void)viewDidLoad {
    NSString *url = [NSString stringWithFormat:@"%@/鲸猜足球",PayAgreeUrl];
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
