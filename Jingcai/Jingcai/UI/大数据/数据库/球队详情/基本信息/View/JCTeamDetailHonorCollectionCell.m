//
//  JCTeamDetailHonorCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailHonorCollectionCell.h"

@implementation JCTeamDetailHonorCollectionCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(9));
        make.size.mas_equalTo(CGSizeMake(AUTO(42), AUTO(42)));
    }];
    
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(4));
        make.left.right.offset(0);
    }];
    

    
    [self.contentView addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(2));
    }];
}

- (void)setModel:(JCTeamDetailInfoHonorModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:JCIMAGE(@"default_icon_cp_mr")];
    self.nameLab.text = model.title_zh;
    self.numberLab.text = [NSString stringWithFormat:@"(%@)",model.num];
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _nameLab;
}


- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _numberLab;
}


@end
