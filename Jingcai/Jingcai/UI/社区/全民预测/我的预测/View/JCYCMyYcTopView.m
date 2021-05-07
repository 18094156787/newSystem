//
//  JCYCMyYcTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/13.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCMyYcTopView.h"
#import "JCYCMyYcRecordViewController.h"
@implementation JCYCMyYcTopView

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;

    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];

    self.gl = [CAGradientLayer layer];
    self.gl.frame = CGRectMake(0,0,SCREEN_WIDTH,190+kNavigationBarHeight);
    self.gl.startPoint = CGPointMake(0.5, 0.05);
    self.gl.endPoint = CGPointMake(0.5, 1);
    self.gl.colors = @[(__bridge id)[UIColor colorWithRed:187/255.0 green:0/255.0 blue:61/255.0 alpha:1.0].CGColor, (__bridge id)[UIColor colorWithRed:72/255.0 green:4/255.0 blue:31/255.0 alpha:1.0].CGColor];
    self.gl.locations = @[@(0), @(1.0f)];
//    self.bgView.layer.cornerRadius = 68;
    [self.bgView.layer addSublayer:self.gl];

    [self addSubview:self.contentBgView];
    [self.contentBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(kNavigationBarHeight);
        make.height.mas_equalTo(170);
    }];
    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.bottom.equalTo(self);
        make.height.mas_equalTo(12);
    }];
    
    [self.contentBgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.top.offset(20);
        make.width.height.mas_equalTo(AUTO(48));
    }];
    
    [self.contentBgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView).offset(AUTO(5));
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(10));
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.qianyueView];
    [self.qianyueView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgView.mas_centerX);
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(15)));
    }];
    
    [self.contentBgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(5));
    }];
    
    [self.contentBgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-35));
        make.centerY.equalTo(self.nameLab);
        make.height.mas_equalTo(20);
    }];
    
    [self.contentBgView addSubview:self.historyLab];
    [self.historyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-35));
        make.centerY.equalTo(self.infoLab);
    }];
    
    UIImageView *indicateImgView = [UIImageView new];
    [self.contentBgView addSubview:indicateImgView];
    indicateImgView.image = JCIMAGE(@"jc_match_myIndicate");
    [indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.historyLab.mas_right);
        make.centerY.equalTo(self.historyLab);
        make.width.height.mas_equalTo(AUTO(22));
    }];
    
    UIView *historyBgView = [UIView new];
    [self.contentBgView insertSubview:historyBgView belowSubview:self.historyLab];
    [historyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.historyLab);
        make.right.equalTo(indicateImgView);
    }];
    
    
    [self.contentBgView addSubview:self.bottombgView];
    [self.bottombgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(12);
        make.right.offset(-12);
        make.top.equalTo(self.headImgView.mas_bottom).offset(0);
        make.height.mas_equalTo(AUTO(92));
    }];
    
    [self.bottombgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.bottom.offset(AUTO(-25));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self.bottombgView addSubview:self.predicateLab];
    [self.predicateLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.contentLab);
        make.width.mas_equalTo(AUTO(100));
    }];

    
//    [self data];
    WeakSelf;
    [self.predicateLab bk_whenTapped:^{
        [[weakSelf getViewController].navigationController popViewControllerAnimated:YES];
    }];
    
    [historyBgView bk_whenTapped:^{
        [[weakSelf getViewController].navigationController pushViewController:[JCYCMyYcRecordViewController new] animated:YES];
       
    }];
    
    [self.countLab bk_whenTapped:^{
        [[weakSelf getViewController].navigationController pushViewController:[JCYCMyYcRecordViewController new] animated:YES];
    }];
}

- (void)setCommom_Model:(JCYuceCommomModel *)commom_Model {
    _commom_Model = commom_Model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:commom_Model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
    self.nameLab.text = commom_Model.user_name;

    if (commom_Model.lianhong.length>0&&commom_Model.mingzhong.length>0) {
        self.infoLab.text = [NSString stringWithFormat:@"本周: %@ 连红 | 命中 %@ 场",commom_Model.lianhong,commom_Model.mingzhong];
    }else if (commom_Model.lianhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"%@连红",commom_Model.lianhong];
    }else if (commom_Model.mingzhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"命中%@场",commom_Model.mingzhong];
    }
    self.countLab.text = commom_Model.rank_count;
    self.historyLab.text = @"历史上榜";
    self.contentLab.text = commom_Model.yc_desc;
    self.qianyueView.hidden = [commom_Model.top integerValue]==1?NO:YES;
}


- (void)setModel:(JCYCUserInfoModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
    self.nameLab.text = model.user_name;

    if (model.lianhong.length>0&&model.mingzhong.length>0) {
        self.infoLab.text = [NSString stringWithFormat:@"本周: %@ 连红 | 命中 %@ 场",model.lianhong,model.mingzhong];
    }else if (model.lianhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"%@连胜",model.lianhong];
    }else if (model.mingzhong.length>0){
        self.infoLab.text = [NSString stringWithFormat:@"命中%@场",model.mingzhong];
    }
    self.countLab.text = model.rank_count;
    self.historyLab.text = @"历史上榜";
    self.contentLab.text = model.yc_desc;
    self.qianyueView.hidden = [model.top integerValue]==1?NO:YES;
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];

    }
    return _bgView;;
}

- (UIView *)contentBgView {
    if (!_contentBgView) {
        _contentBgView = [UIView new];
    }
    return _contentBgView;;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = COLOR_F0F0F0;
        [_bottomView hg_setCornerOnTopWithRadius:12];
    }
    return _bottomView;;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.layer.borderWidth = 1;
        _headImgView.layer.borderColor = COLOR_A9A9A9.CGColor;
        _headImgView.layer.cornerRadius = AUTO(24);
        _headImgView.layer.masksToBounds = YES;
    }
    return _headImgView;;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _nameLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
    }
    return _nameLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _infoLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _countLab.font = [UIFont fontWithName:@"PingFangSC-Semibold" size:AUTO(20)];
        _countLab.userInteractionEnabled = YES;
    }
    return _countLab;
}

- (UILabel *)historyLab {
    if (!_historyLab) {
        _historyLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
        _historyLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
    }
    return _historyLab;
}

- (UIImageView *)qianyueView {
    if (!_qianyueView) {
        _qianyueView = [UIImageView new];
        _qianyueView.image = JCIMAGE(@"jc_qianyue_tag");
        _qianyueView.hidden = YES;
    }
    return _qianyueView;;
}

- (UIImageView *)bottombgView {
    if (!_bottombgView) {
        _bottombgView = [UIImageView new];
        _bottombgView.image = JCIMAGE(@"jc_match_myBg");
        _bottombgView.userInteractionEnabled = YES;
//        [_bottombgView hg_setAllCornerWithCornerRadius:AUTO(28)];
    }
    return _bottombgView;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:16 andWeight:0 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    }
    return _contentLab;
}

- (UILabel *)predicateLab {
    if (!_predicateLab) {
        _predicateLab = [UILabel initWithTitle:@"去预测" andFont:16 andWeight:0 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _predicateLab.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)];
        _predicateLab.userInteractionEnabled = YES;
    }
    return _predicateLab;
}


@end
