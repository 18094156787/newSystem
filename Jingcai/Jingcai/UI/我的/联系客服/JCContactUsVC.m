//
//  JCContactUsVC.m
//  Jingcai
//
//  Created by Rain on 2018/10/17.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCContactUsVC.h"

@interface JCContactUsVC ()

@end

@implementation JCContactUsVC

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
    [super viewDidLoad];
    self.navigationItem.title = @"联系客服";
}

@end
