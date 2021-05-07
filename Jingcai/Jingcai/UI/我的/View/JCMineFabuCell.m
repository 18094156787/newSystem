//
//  JCMineFabuCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCMineFabuCell.h"

@implementation JCMineFabuCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.userInteractionEnabled = YES;
    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(8));
        make.right.offset(AUTO(-8));
        make.top.offset(0);
        make.height.mas_equalTo(AUTO(95));
        make.bottom.offset(0);
    }];
    
    float width = (SCREEN_WIDTH-AUTO(16))/3.0f;
    [bgView addSubview:self.fabuView];
    [self.fabuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(bgView);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.incomeView];
    [self.incomeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.left.equalTo(self.fabuView.mas_right);
        make.width.mas_equalTo(width);
    }];
    
    [bgView addSubview:self.recordView];
    [self.recordView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(bgView);
        make.left.equalTo(self.incomeView.mas_right);
        make.width.mas_equalTo(width);
    }];
    
    

    WeakSelf;
    [self.fabuView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(100);
        }
    }];
    
    [self.incomeView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(101);
        }
    }];
    
    [self.recordView bk_whenTapped:^{
        if (weakSelf.JCMineClick) {
            weakSelf.JCMineClick(102);
        }
    }];

}

- (JCMineCellItemView *)fabuView {
    if (!_fabuView) {
        _fabuView = [JCMineCellItemView new];
        _fabuView.iconImg = JCIMAGE(@"me_ic_release");
        _fabuView.title = @"发布方案";
        _fabuView.userInteractionEnabled = YES;
    }
    return _fabuView;
}

- (JCMineCellItemView *)incomeView {
    if (!_incomeView) {
        _incomeView = [JCMineCellItemView new];
        _incomeView.iconImg = JCIMAGE(@"me_ic_income");
        _incomeView.title = @"方案收入";
    }
    return _incomeView;
}

- (JCMineCellItemView *)recordView {
    if (!_recordView) {
        _recordView = [JCMineCellItemView new];
        _recordView.iconImg = JCIMAGE(@"me_ic_history");
        _recordView.title = @"发布记录";
    }
    return _recordView;
}


@end
