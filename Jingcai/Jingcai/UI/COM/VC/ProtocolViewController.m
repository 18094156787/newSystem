//
//  ProtocolViewController.m
//  Jingcai
//
//  Created by Rain on 2018/10/10.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "ProtocolViewController.h"

@interface ProtocolViewController ()

@end

@implementation ProtocolViewController


- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

     self.navigationBarStyle = JCNavigationBarStyleDefault;

}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"鲸猜足球服务条款";
}

@end
