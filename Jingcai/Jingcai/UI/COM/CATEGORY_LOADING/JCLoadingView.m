//
//  JCLoadingView.m
//  Jingcai
//
//  Created by Administrator on 2019/2/13.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCLoadingView.h"

@implementation JCLoadingView

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.activity.backgroundColor = COLOR_000000;
    self.bgView.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
}

- (void)initViews {
    self.bgView.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
}

@end
