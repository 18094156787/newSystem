//
//  JCBaseView.m
//  Jingcai
//
//  Created by Rain on 2018/10/8.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseView.h"

@implementation JCBaseView
+ (instancetype)viewFromXib {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}
- (CGFloat)contentH {
    NSLog(@"请重写contentH");
    return 0;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
        [self data];
    }
    return self;
}
- (void)initViews {
    
}
- (void)data {
    
}
- (void)presentLogin {

    for (UIViewController *vc in [self getViewController].navigationController.viewControllers) {
        if ([vc isKindOfClass:[JCLoginWMStickVC class]]) {
            return;
        }
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self getViewController].navigationController pushViewController:[JCLoginWMStickVC new] animated:YES];
    });
}

@end
