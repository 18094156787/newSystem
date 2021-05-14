//
//  JCFootBallAuthorHistoryPlaneCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/9.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallAuthorHistoryPlaneCell.h"

@implementation JCFootBallAuthorHistoryPlaneCell

- (void)initViews {

    [self.contentView addSubview:self.ysImgView];
    [self.ysImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.width.height.mas_equalTo(AUTO(40));
    }];

    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
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
//        make.bottom.offset(AUTO(-12));
    }];
    
    [self addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.timeLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(25)));
    }];
    
    [self.likeBtn addSubview:self.likeImgView];
    [self.likeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.likeBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(16), AUTO(16)));
    }];
    
    [self.likeBtn addSubview:self.likeLab];
    [self.likeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.likeImgView.mas_right).offset(AUTO(5));
        make.right.offset(0);
        make.centerY.equalTo(self.likeBtn);
    }];
    
    UIView *lineView  = [UIView new];
    lineView.backgroundColor = COLOR_DDDDDD;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(0.5);
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(10));
    }];
    
    [self.contentView addSubview:self.scroeLab];
    [self.scroeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(10));
        make.bottom.offset(AUTO(-15));
        
    }];
    

}

- (void)setModel:(JCWTjInfoBall *)model {
    
    _model = model;
    NSString *title = [NSString stringWithFormat:@"%@",model.title];
    if (model.is_bd==1) {
        title = [NSString stringWithFormat:@"【补】%@",model.title];
    }

    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:@"【补】"];
    if (range.location!=NSNotFound) {
        [attrTitle addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
    }


     self.titleLab.attributedText = attrTitle;
    self.timeLab.text = [NSString stringWithFormat:@"%@ 截止",model.end_time];
    
    self.contentLab.text = model.subtitle;
    [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
        if (model.subtitle.length==0) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(0.01);
        }else{
            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
        }
     }];
    
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
    
//    self.refundLab.text = @"";
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
    
    if ([model.refund integerValue]>0) {

        [self.timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
            make.centerY.equalTo(self.refundLab);
//            make.bottom.offset(AUTO(-12));
        }];
    }else{

        [self.timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.refundLab.mas_left);
            make.centerY.equalTo(self.refundLab);
//            make.bottom.offset(AUTO(-12));
        }];
//        self.refundLab.text = @"";
    }


    if (model.result.length>0) {
        self.scroeLab.text = model.result;
        self.scroeLab.textColor = JCBaseColor;
    }else {
        self.scroeLab.text = @"待定";
        self.scroeLab.textColor = COLOR_60BA02;
    }
    if ([model.click intValue]==0) {
        self.likeImgView.hidden = YES;
        self.likeLab.text = @"";
    }else{
        self.likeImgView.hidden = NO;
        self.likeLab.text = model.click;
    }

}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;

    }
    return _titleLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel labelTitle:@"" andFont:AUTO(13) andWeight:0 andTextColor:COLOR_000000 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}


- (UILabel *)scroeLab {
    if (!_scroeLab) {
        _scroeLab = [UILabel labelTitle:@"" andFont:AUTO(14) andWeight:0 andTextColor:COLOR_FE1F19 andBackgroundColor:JCClearColor andTextAlignment:0];
        _scroeLab.numberOfLines = 0;
        _scroeLab.font = [UIFont boldSystemFontOfSize:AUTO(14)];
    }
    return _scroeLab;
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
        _likeImgView.image = JCIMAGE(@"icon_click_s_un");
    }
    return _likeImgView;
}

- (UILabel *)likeLab {
    if (!_likeLab) {
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
}
- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
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
- (UIImageView *)ysImgView {
    if (!_ysImgView) {
        _ysImgView = [UIImageView new];
        _ysImgView.image = JCIMAGE(@"ic_presale");
    }
    return _ysImgView;
}
@end
