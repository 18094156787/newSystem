//
//  JCMyHongbaoVC.m
//  Jingcai
//
//  Created by Rain on 2018/11/16.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCMyHongbaoVC.h"
#import "JCWConst.h"
#import "UIView+JCLoading.h"

@interface JCMyHongbaoVC ()
@end

@implementation JCMyHongbaoVC
- (void)viewDidLoad {
    self.urlStr = MyHongbaoUrl;
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
