//
//  JCDatabaseCommomMatchCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDatabaseCommomMatchCollectionCell.h"

@implementation JCDatabaseCommomMatchCollectionCell

- (void)initViews {
    UIView *bgView = [UIView new];;
//    bgView.backgroundColor = COLOR_F4F6F9;
    [self.contentView addSubview:bgView];
//    [bgView hg_setAllCornerWithCornerRadius:AUTO(4)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(3, 0, 3, 0));
    }];
    


    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 5;
    bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.05].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,2);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 4;
    
    [self.contentView addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(12));
        make.centerY.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(36));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconImgView.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.contentView);
        make.right.offset(AUTO(-5));
    }];
}

- (void)setModel:(JCDataBaseMatchModel *)model {
    _model = model;
    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:model.logo]];
    self.titleLab.text = model.short_name_zh;
}


-(UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.layer.borderColor = COLOR_DDDDDD.CGColor;
        _iconImgView.layer.borderWidth = 0.5;
        _iconImgView.layer.cornerRadius = AUTO(18);
        _iconImgView.layer.masksToBounds = YES;
    }
    return _iconImgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

@end
