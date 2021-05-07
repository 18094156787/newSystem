//
//  JCFamousExpertCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFamousExpertCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
@implementation JCFamousExpertCell

- (void)initViews {
    
       [self.contentView addSubview:self.headImgView];
        [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.top.offset(AUTO(10));
            make.width.height.mas_equalTo(AUTO(36));
    //        make.bottom.offset(AUTO(-15));
        }];
        
        [self.contentView addSubview:self.nameLab];
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
            make.top.equalTo(self.headImgView).offset(AUTO(3));
            make.height.mas_equalTo(AUTO(15));
        }];
    
    [self.contentView addSubview:self.ysImgView];
    [self.ysImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.width.height.mas_equalTo(AUTO(40));
    }];
    
    [self.contentView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(3));
        make.height.mas_equalTo(AUTO(14));
    }];
    
    [self.contentView insertSubview:self.userClickView atIndex:0];
    [self.userClickView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.offset(0);
        make.bottom.equalTo(self.headImgView);
        make.right.equalTo(self.nameLab);
    }];
    

    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(12));
        make.right.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
        make.right.offset(AUTO(-15));
    }];

    [self.contentView addSubview:self.refundLab];
    [self.refundLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.contentView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.refundLab);
//        make.right.offset(AUTO(-15));
    }];

    
    [self.contentView addSubview:self.likeBtn];

    
    [self.likeBtn addSubview:self.likeImgView];
    [self.likeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(15), AUTO(10)));
    }];
    
    [self.likeBtn addSubview:self.likeLab];
    [self.likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeImgView.mas_right).offset(AUTO(5));
        make.right.offset(0);
        make.centerY.equalTo(self.likeBtn);
    }];
    
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-5));
        make.centerY.equalTo(self.timeLab);
        make.height.mas_equalTo(AUTO(25));
        make.left.equalTo(self.likeImgView);
//        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(25)));
    }];
    
    

    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(0.5);
    }];
    self.lineView = lineView;
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.lineView.mas_bottom).offset(AUTO(10));
        make.bottom.offset(AUTO(-10));
    }];
    

    WeakSelf;
    [self.userClickView bk_whenTapped:^{

        if (weakSelf.model.user_id.length==0) {
            return;
        }
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        vc.autherID = weakSelf.model.user_id;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
    }];
    
}

- (void)setModel:(JCWTjInfoBall *)model {
    
    _model = model;
    if (self.isDetail) {
        if ([model.sf integerValue]>0) {
//            model.is_free = 1;
            model.result = model.zhong;
        }else{
//            model.is_free = 0;
        }
    }
    if ([model.sf integerValue]>0){
        model.is_free = 1;
    }else{
        model.is_free = 0;
    }

    self.nameLab.text = model.user_name;
    
    if (model.zhong.length>0) {
        self.tagLab.text = [NSString stringWithFormat:@"%@",model.zhong];
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
            make.top.equalTo(self.headImgView).offset(AUTO(4));
            make.height.mas_equalTo(AUTO(15));
        }];
    }else{
        self.tagLab.text = @"";
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(5));
            make.centerY.equalTo(self.headImgView);
            make.height.mas_equalTo(AUTO(15));
        }];
    }
    self.tagLab.hidden = model.zhong.length==0?YES:NO;
    
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"ic_gzh_default")];
    self.titleLab.text = model.title;
    self.contentLab.text = model.subtitle;
//    [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
//        if (model.subtitle.length==0) {
//            make.top.equalTo(self.titleLab.mas_bottom);
//        }else{
//            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
//        }
//     }];
    if ((model.subtitle.length==0)) {
        [self.contentLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
            make.right.offset(AUTO(-15));
        }];
    }else{
        [self.contentLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
            make.right.offset(AUTO(-15));
        }];
    }

    BOOL isRefund = NO;//不中返还
    self.refundLab.text = @"";
    if ([model.refund integerValue]==1) {
        isRefund = YES;
    }
    BOOL isBudan = NO;//补单
    if ([model.refund integerValue]==2) {
        isBudan = YES;
    }
    self.ysImgView.hidden = [model.pre_sale integerValue]==1?NO:YES;
    if (isRefund||isBudan) {
        if (isRefund) {
            self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中返还"];
            self.refundLab.textColor = JCBaseColor;
            self.refundLab.layer.borderColor = JCBaseColor.CGColor;
            self.refundLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        }
        if (isBudan) {
            self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中补单"];
            self.refundLab.textColor = COLOR_F37E22;
            self.refundLab.layer.borderColor = COLOR_F37E22.CGColor;
            self.refundLab.backgroundColor = [COLOR_F37E22 colorWithAlphaComponent:0.1];
        }
        
            [self.timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
                make.centerY.equalTo(self.refundLab);
        //        make.right.offset(AUTO(-15));
            }];
    }else{
        [self.timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.centerY.equalTo(self.refundLab);
        }];
        self.refundLab.text = @"";
    }
    

    if (model.is_free==0) {
        self.timeLab.text = [NSString stringWithFormat:@"%@ 发布",model.created_at];
    }else {
        if ([model.end_time containsString:@"-"]||[model.end_time containsString:@"/"]) {
            self.timeLab.text = [NSString stringWithFormat:@"截止时间: %@",model.end_time];
        }else{
            self.timeLab.text = [NSString stringWithFormat:@"截止时间: %@",[NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[model.end_time doubleValue]]];
        }

    }
//    if (self.isDetail) {
//        if (model.is_free==0) {
//            self.timeLab.text = [NSString stringWithFormat:@"%@ 发布",model.time];
//        }else{
////            self.timeLab.text = [NSString stringWithFormat:@"截止时间:%@",model.end_time];
//            self.timeLab.text = [NSString stringWithFormat:@"截止时间: %@",[NSDate timeStringWithIntervalWithFormat:@"yyyy-MM-dd HH:mm" time:[model.end_time doubleValue]]];
//        }
//    }
    if ([model.click intValue]==0) {
        self.likeImgView.hidden = YES;
        self.likeLab.text = @"";
    }else{
        self.likeImgView.hidden = NO;
        self.likeLab.text = model.click;
    }

//    model.is_end = 1;
//    model.is_free==1是付费 0是免费


    
    if (model.is_end==1&&model.is_free==1) {
        
        if (model.result.length>0) {
            self.infoLab.textColor = JCBaseColor;
            self.infoLab.text = NonNil(model.result);
            self.lineView.hidden = NO;

        }else{
            self.infoLab.textColor = COLOR_30B27A;
            self.infoLab.text = @"待定";
            self.lineView.hidden = NO;

        }

        
        [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(10));
            make.left.offset(AUTO(15));
            make.right.offset(AUTO(-15));
            make.height.mas_equalTo(0.5);
        }];
        
    }else{
        [self.lineView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(-6));
            make.left.offset(AUTO(15));
            make.right.offset(AUTO(-15));
            make.height.mas_equalTo(0.5);
        }];
        
        self.infoLab.text = @"";
        self.lineView.hidden = YES;
//        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
////            make.top.equalTo(self.lineView.mas_bottom).offset(-10);
//           make.bottom.offset(AUTO(-10));
//        }];
        
    }

   
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}


- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        [_headImgView hg_setAllCornerWithCornerRadius:AUTO(18)];
    }return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (KKPaddingLabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.layer.cornerRadius = AUTO(7);
        _tagLab.layer.masksToBounds = YES;
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.borderColor = JCBaseColor.CGColor;
        _tagLab.padding = UIEdgeInsetsMake(0, 5, 0, 5);
    }
    return _tagLab;
}

- (UILabel *)refundLab {
    if (!_refundLab) {
        _refundLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _refundLab.layer.cornerRadius = AUTO(8);
        _refundLab.layer.masksToBounds = YES;
        _refundLab.layer.borderWidth = 0.5;
        _refundLab.layer.borderColor = JCBaseColor.CGColor;
    }
    return _refundLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_FF4642 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}

- (UIButton *)shareBtn {
    if (!_shareBtn) {
        _shareBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _shareBtn;
}


- (UIImageView *)shareImgView {
    if (!_shareImgView) {
        _shareImgView = [UIImageView new];
        _shareImgView.image = JCIMAGE(@"icon_fx_s");
    }
    return _shareImgView;
}

- (UILabel *)shareLab {
    if (!_shareLab) {
        _shareLab = [UILabel initWithTitle:@"分享" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _shareLab;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _likeBtn;
}

- (UIImageView *)likeImgView {
    if (!_likeImgView) {
        _likeImgView = [UIImageView new];
        _likeImgView.image = JCIMAGE(@"ic_lll");
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}
- (UIView *)userClickView {
    if (!_userClickView) {
        _userClickView = [UIView new];
    }
    return _userClickView;
}

- (UIImageView *)ysImgView {
    if (!_ysImgView) {
        _ysImgView = [UIImageView new];
        _ysImgView.image = JCIMAGE(@"ic_presale");
        _ysImgView.hidden = YES;
    }
    return _ysImgView;
}

@end
