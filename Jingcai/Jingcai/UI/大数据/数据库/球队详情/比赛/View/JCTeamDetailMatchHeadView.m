//
//  JCTeamDetailMatchHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/16.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailMatchHeadView.h"

@implementation JCTeamDetailMatchHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(8), 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(bgView);
        make.centerX.equalTo(bgView);
    }];
    
    [bgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLab.mas_right);
        make.centerY.equalTo(bgView);
        make.width.height.mas_equalTo(AUTO(12));
    }];
    
    WeakSelf;
    [bgView bk_whenTapped:^{
        weakSelf.showAll = !weakSelf.showAll;
        if (weakSelf.JCShowMoreMatchBlock) {
            weakSelf.JCShowMoreMatchBlock(weakSelf.showAll);
        }
    }];
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"点击查看更多赛程" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = JCIMAGE(@"match_icon_x");
        _iconImgView.userInteractionEnabled = YES;
    }
    return _iconImgView;
}

- (void)setShowAll:(BOOL)showAll {
    _showAll = showAll;
    self.titleLab.text = showAll?@"收起更多赛程":@"点击查看更多赛程";
    self.iconImgView.image = showAll?JCIMAGE(@"match_icon_s"):JCIMAGE(@"match_icon_x");
}

@end
