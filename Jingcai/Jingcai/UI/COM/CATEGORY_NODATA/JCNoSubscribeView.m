//
//  JCNoSubscribeView.m
//  Jingcai
//
//  Created by Rain on 2018/11/21.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCNoSubscribeView.h"

@implementation JCNoSubscribeView

- (IBAction)addSubscribeBtnClick:(UIButton *)sender {
    if (_addSubscribeClickBlock) {
        _addSubscribeClickBlock();
    }
}

@end
