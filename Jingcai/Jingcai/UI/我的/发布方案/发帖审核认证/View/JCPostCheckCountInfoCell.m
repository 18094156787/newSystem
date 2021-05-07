//
//  JCPostCheckCountInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckCountInfoCell.h"

@implementation JCPostCheckCountInfoCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    UILabel *label = [UILabel initWithTitle:@"需要添加2场比赛的方案进行审核" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.contentView addSubview:label];    
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
    }];
}

@end
