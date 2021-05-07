//
//  JCTeamDetailZhuanHuiItemView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailZhuanHuiItemView.h"

@implementation JCTeamDetailZhuanHuiItemView

- (void)initViews {
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(8, 15, 15, 1));
    }];


    bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    bgView.layer.cornerRadius = 5;
    bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.05].CGColor;
    bgView.layer.shadowOffset = CGSizeMake(0,2);
    bgView.layer.shadowOpacity = 1;
    bgView.layer.shadowRadius = 4;
    
    [self addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(12));
        make.centerX.equalTo(self.mas_centerX).offset(2);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.titleLab.mas_left);
        make.centerY.equalTo(self.titleLab);
        make.width.height.mas_equalTo(AUTO(12));
    }];
    
    [self addSubview:self.iconImgView1];
    [self.iconImgView1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(12));
        make.centerX.equalTo(self);
        make.width.height.mas_equalTo(AUTO(36));
    }];
    
    [self addSubview:self.iconImgView];
    [self.iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImgView1);
        make.right.equalTo(self.iconImgView1.mas_left).offset(AUTO(-15));
        make.width.height.mas_equalTo(AUTO(36));
    }];
    
    [self addSubview:self.iconImgView2];
    [self.iconImgView2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.iconImgView1);
        make.left.equalTo(self.iconImgView1.mas_right).offset(AUTO(15));
        make.width.height.mas_equalTo(AUTO(36));
    }];
}
- (void)setModel:(JCTeamDetailInfoZhuanHuiModel *)model {
    _model = model;
    self.iconImgView.hidden = YES;
    self.iconImgView1.hidden = YES;
    self.iconImgView2.hidden = YES;
    [model.player enumerateObjectsUsingBlock:^(NSString *obj, NSUInteger idx, BOOL * _Nonnull stop) {
        switch (idx) {
            case 0:
                {
                    self.iconImgView.hidden = NO;
                    [self.iconImgView sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:JCIMAGE(@"userImg_default")];
                }
                break;
            case 1:
                {
                    self.iconImgView1.hidden = NO;
                    [self.iconImgView1 sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:JCIMAGE(@"userImg_default")];
                }
                break;
            case 2:
                {
                    self.iconImgView2.hidden = NO;
                    [self.iconImgView2 sd_setImageWithURL:[NSURL URLWithString:obj] placeholderImage:JCIMAGE(@"userImg_default")];
                }
                break;
                
            default:
                break;
        }
    }];
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_6DD400 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UIImageView *)imgView {
    if (!_imgView ) {
        _imgView = [UIImageView new];
        _imgView.hidden = YES;
    }
    return _imgView;
}



- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.hidden = YES;
        _iconImgView.contentMode = UIViewContentModeScaleAspectFill;
        [_iconImgView hg_setAllCornerWithCornerRadius:AUTO(18)];
    }
    return _iconImgView;
}

- (UIImageView *)iconImgView1 {
    if (!_iconImgView1) {
        _iconImgView1 = [UIImageView new];
        _iconImgView1.hidden = YES;
         _iconImgView1.contentMode = UIViewContentModeScaleAspectFill;
        [_iconImgView1 hg_setAllCornerWithCornerRadius:AUTO(18)];
    }
    return _iconImgView1;
}
- (UIImageView *)iconImgView2 {
    if (!_iconImgView2) {
        _iconImgView2 = [UIImageView new];
        _iconImgView2.hidden = YES;
         _iconImgView2.contentMode = UIViewContentModeScaleAspectFill;
        [_iconImgView2 hg_setAllCornerWithCornerRadius:AUTO(18)];
    }
    return _iconImgView2;
}


@end
