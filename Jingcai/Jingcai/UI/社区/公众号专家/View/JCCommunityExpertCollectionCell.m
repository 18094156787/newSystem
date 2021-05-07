//
//  JCCommunityExpertCollectionCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunityExpertCollectionCell.h"

@implementation JCCommunityExpertCollectionCell

- (void)initViews {

    
//    self.backgroundColor = JCBaseColor;
    [self.contentView addSubview:self.headView];
    [self.headView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(16));
        make.centerX.equalTo(self.contentView);
        make.width.height.mas_equalTo(AUTO(44));
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headView).offset(-3);
        make.left.equalTo(self.headView.mas_right).offset(-12);
        make.width.height.mas_equalTo(18);
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.headView).offset(AUTO(5));
        make.centerX.equalTo(self.contentView);
//        make.left.right.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(66));
        make.height.mas_equalTo(AUTO(16));
    }];
    [self.contentView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(5));
      make.centerX.equalTo(self.contentView);
        make.width.mas_equalTo(AUTO(66));
//      make.height.mas_equalTo(AUTO(18));
    }];
    
}

//- (void)data {
//    self.headView.backgroundColor = [UIColor blackColor];
//    self.infoLab.text = @"爆红 7串1";
//    self.nameLab.text = @"足球前瞻";
//}

- (void)setModel:(JCWExpertBall *)model {
    _model= model;
    if (model.localImage) {

        [self.headView sd_setImageWithURL:[NSURL URLWithString:@""] placeholderImage:model.localImage];
        
    }else{
        if (self.isHongbang) {
            [self.headView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"ic_hb_default")];
        }else{
            [self.headView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"ic_gzh_default")];
        }

    }
    
    self.nameLab.text = NonNil(model.user_name);
    self.countLab.text = model.on_sale_count;
    self.countLab.hidden = [model.on_sale_count integerValue]==0?YES:NO;
    

    
    
    if (self.isHongbang) {
//        self.infoLab.text = NonNil(model.rank_info);
//        self.infoLab.hidden = model.rank_info.length>0?NO:YES;
        if ([self.type integerValue]==1) {
            self.infoLab.text = [NSString stringWithFormat:@"近10中%@",model.sign];
            self.infoLab.hidden = [model.sign integerValue]>0?NO:YES;
        }
        if ([self.type integerValue]==2) {
            self.infoLab.text = model.sign;
            self.infoLab.hidden = model.sign.length>0?NO:YES;
        }
        if ([self.type integerValue]==3) {
            self.infoLab.text = [NSString stringWithFormat:@"%@连红",model.sign];
            self.infoLab.hidden = [model.sign integerValue]>0?NO:YES;
        }

    }else{
        self.infoLab.text = NonNil(model.zhong);
        self.infoLab.hidden = model.zhong.length>0?NO:YES;
    }
//
    
}

- (UIImageView *)headView {
    if (!_headView) {
        _headView = [UIImageView new];
        [_headView hg_setAllCornerWithCornerRadius:AUTO(22)];
    }
    return _headView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(9) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCWhiteColor andTextAlignment:NSTextAlignmentCenter];
        _infoLab.layer.borderColor = JCBaseColor.CGColor;
        _infoLab.layer.borderWidth = 0.5;
        _infoLab.layer.masksToBounds = YES;
        _infoLab.layer.cornerRadius = AUTO(8);
    }
    return _infoLab;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _nameLab;
}
- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:12 andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCBaseColor
                          andTextAlignment:NSTextAlignmentCenter];
        [_countLab hg_setAllCornerWithCornerRadius:9];
    }
    return _countLab;
}
@end
