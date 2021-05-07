//
//  JCLoadingFailureView.m
//  Jingcai
//
//  Created by Administrator on 2019/2/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCLoadingFailureView.h"

@implementation JCLoadingFailureView
- (IBAction)retryBtnClick:(UIButton *)sender {
    if (self.failureViewRetryBlock) {
        self.failureViewRetryBlock();
    }
}
@end
