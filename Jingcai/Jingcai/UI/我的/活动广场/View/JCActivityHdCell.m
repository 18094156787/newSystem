//
//  JCActivityHdCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityHdCell.h"

@implementation JCActivityHdCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    UIView *bgView = [UIView new];
    [bgView hg_setAllCornerWithCornerRadius:5];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(8), AUTO(8), 0, AUTO(8)));
    }];

    [bgView addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(AUTO(12));
        make.right.offset(AUTO(-12));
        make.height.mas_equalTo(AUTO(112));
    }];
    

    [bgView addSubview:self.statusImgView];
    [self.statusImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(72), AUTO(72)));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imgView);
        make.top.equalTo(self.imgView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(15));
        make.bottom.offset(AUTO(-10));
    }];
    
    [self.contentView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(bgView).offset(AUTO(-12));
        make.top.equalTo(bgView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(15));
        make.bottom.offset(AUTO(-10));
    }];
}

- (void)setModel:(JCWSlideBall *)model {
    _model = model;
    [self.imgView sd_setImageWithURL:[NSURL URLWithString:model.img_url]];
    self.timeLab.text = [NSString stringWithFormat:@"活动时间：%@-%@",NonNil(model.start_time),NonNil(model.end_time)];
    self.statusLab.text = [model.is_participate integerValue]==1?@"已参加":@"未参加";
    self.statusLab.textColor = [model.is_participate integerValue]==1?[COLOR_2F2F2F colorWithAlphaComponent:0.6]:JCBaseColor;
    if ([model.active_state integerValue]==1) {
        self.statusImgView.image = JCIMAGE(@"Ic_nostar");
    }
    
    if ([model.active_state integerValue]==2) {
        self.statusImgView.image = JCIMAGE(@"icon_activity_ing");
    }
    if ([model.active_state integerValue]==3) {
        self.statusImgView.image = JCIMAGE(@"icon_activity_end");
    }
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
//        _imgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _imgView;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _statusLab;
}

- (UIImageView *)statusImgView {
    if (!_statusImgView) {
        _statusImgView = [UIImageView new];
        _statusImgView.image = JCIMAGE(@"icon_activity_ing");//icon_activity_end
    }
    return _statusImgView;
}

@end
