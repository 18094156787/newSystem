//
//  JCActivityKindCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityKindCell.h"

@implementation JCActivityKindCell

- (void)initViews {
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 16, 0, 16));
    }];
    
    [bgView addSubview:self.segment];
    self.segment.frame = CGRectMake(0, 0, SCREEN_WIDTH-32, AUTO(44));
    
}

- (HMSegmentedControl *)segment {
    if (!_segment) {
        _segment = [[HMSegmentedControl alloc] initWithSectionTitles:@[@"活动完成用户",@"积分明细",@"我的奖励"]];
    }
    return _segment;
}

@end
