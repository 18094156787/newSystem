//
//  JCNoNetworkView.m
//  Jingcai
//
//  Created by Rain on 2018/11/26.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCNoNetworkView.h"

@implementation JCNoNetworkView
- (void)awakeFromNib {
    [super awakeFromNib];
    UITapGestureRecognizer * tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewClick)];
    [self addGestureRecognizer:tap];
}
- (void)viewClick {
    if (self.noNetworkClickBlock) {
        self.noNetworkClickBlock();
    }
}
@end
