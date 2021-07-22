//
//  JCActivityGuess_SPF_More_CheckCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/22.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuess_SPF_More_CheckCell.h"

@implementation JCActivityGuess_SPF_More_CheckCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.6];
    [bgView hg_setAllCornerWithCornerRadius:6];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(8), AUTO(15), 0, AUTO(15)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-8));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
        make.bottom.equalTo(self.contentView).offset(AUTO(-8.1));
        make.width.mas_equalTo(AUTO(73));
    }];
    
    [bgView addSubview:self.resultLab];
    [self.resultLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.infoLab.mas_right).offset(0);
        make.right.offset(AUTO(-8));
        make.centerY.equalTo(self.infoLab);

    }];
}

- (void)data {
    self.titleLab.text = @"主队名称 VS 客队名称";
    self.resultLab.text = @"主胜";
    
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"竞猜选项：" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)resultLab {
    if (!_resultLab) {
        _resultLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _resultLab;
}

@end
