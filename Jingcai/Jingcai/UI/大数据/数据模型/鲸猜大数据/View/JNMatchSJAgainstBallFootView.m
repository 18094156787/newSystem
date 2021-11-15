//
//  JNMatchSJAgainstBallFootView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJAgainstBallFootView.h"

@implementation JNMatchSJAgainstBallFootView

- (void)initViews {
    UILabel *label = [UILabel initWithTitle:@"注：" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(17));
    }];
    
    UILabel *infoLab = [UILabel initWithTitle:@"1.数据仅供参考！不做结果保证，请理性对待！\n2.数据提前12小时给出，每小时更新，请及时关注！" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines = 2;
     [self addSubview:infoLab];
     [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(label.mas_right);
         make.top.offset(0);
         make.right.offset(AUTO(-15));
     }];
    
    UIView *lineView = [UIView new];
    [self addSubview:lineView];
    lineView.backgroundColor = COLOR_F0F0F0;
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.height.mas_equalTo(8);
    }];
    
    
}

@end
