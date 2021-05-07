//
//  JCPaySuccessVC.m
//  Jingcai
//
//  Created by Administrator on 2019/5/14.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPaySuccessVC.h"

@interface JCPaySuccessVC ()
@end

@implementation JCPaySuccessVC
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"支付结果";
    UIBarButtonItem * closeItem = [[UIBarButtonItem alloc] initWithTitle:@"关闭" style:UIBarButtonItemStyleDone target:self action:@selector(closeItemClick)];
    self.navigationItem.rightBarButtonItem = closeItem;
}
- (void)closeItemClick {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
