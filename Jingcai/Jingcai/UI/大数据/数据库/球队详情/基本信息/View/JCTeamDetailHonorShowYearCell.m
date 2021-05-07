//
//  JCTeamDetailHonorShowYearCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailHonorShowYearCell.h"

@implementation JCTeamDetailHonorShowYearCell

- (void)initViews {
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}




- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:11 andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:COLOR_F4F6F9 andTextAlignment:NSTextAlignmentCenter];
    }
    return _titleLab;
}

@end
