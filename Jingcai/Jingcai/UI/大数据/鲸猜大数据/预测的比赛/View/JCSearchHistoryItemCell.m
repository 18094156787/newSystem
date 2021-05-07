//
//  JCSearchHistoryItemCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCSearchHistoryItemCell.h"

@implementation JCSearchHistoryItemCell

- (void)initViews {

    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
//    self.titleLab.frame = self.bounds;
}

- (KKPaddingLabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:COLOR_F0F0F0 andTextAlignment:NSTextAlignmentCenter];
        _titleLab.layer.cornerRadius = AUTO(12);
        _titleLab.layer.masksToBounds = YES;
        _titleLab.padding = UIEdgeInsetsMake(0, 5, 0, 5);
//        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}
//- (UILabel *)titleLab {
//    if (!_titleLab) {
//        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:COLOR_F0F0F0 andTextAlignment:0];
//    }
//    return _titleLab;
//}


@end
