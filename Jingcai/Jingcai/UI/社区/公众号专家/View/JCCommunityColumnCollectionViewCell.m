//
//  JCCommunityColumnCollectionViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCCommunityColumnCollectionViewCell.h"

@implementation JCCommunityColumnCollectionViewCell

- (void)initViews {
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 2;
    bgView.layer.shadowColor = [UIColor colorWithRed:181/255.0 green:182/255.0 blue:183/255.0 alpha:0.3].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,2);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 10;
//    [bgView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(4));
        make.right.offset(AUTO(-4));
        make.top.offset(AUTO(4));
        make.height.mas_equalTo(AUTO(90));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView);
        make.top.equalTo(self.iconImgView.mas_bottom).offset(AUTO(5));
    }];
    
    [self data];
}

- (void)data {
    self.iconImgView.backgroundColor = JCBaseColor;
    self.titleLab.text = @"英超精选方案推荐";
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

@end
