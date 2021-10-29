//
//  JCFootBallAuthorNewPlaneCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/9.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCFootBallAuthorNewPlaneCell.h"

@implementation JCFootBallAuthorNewPlaneCell

- (void)initViews {
    
    self.backgroundColor = COLOR_F0F0F0;
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(8));
        make.left.right.offset(0);
        make.bottom.offset(0);
    }];
    
    [bgView addSubview:self.ysImgView];
    [self.ysImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.right.offset(0);
        make.width.height.mas_equalTo(AUTO(40));
    }];

    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.right.offset(AUTO(-15));
    }];
    
    [bgView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
        make.left.right.equalTo(self.titleLab);
    }];
    
    [bgView addSubview:self.refundLab];
    [self.refundLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
        make.centerY.equalTo(self.refundLab);
        make.bottom.offset(AUTO(-12));
    }];
    
    [bgView addSubview:self.likeBtn];
    [self.likeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.timeLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(25)));
    }];
    
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

    

}

- (void)setModel:(JCWTjInfoBall *)model {
    
    _model = model;


    
    NSString *title = model.title;
    NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
    if (model.is_column==1) {
        title = [NSString stringWithFormat:@" %@",model.title];
        NSTextAttachment *attch = [[NSTextAttachment alloc] init];
           // 表情图片
           attch.image = JCIMAGE(@"ic_icon_column");
           // 设置图片大小
           attch.bounds = CGRectMake(0, -2, 44, 16);
           // 创建带有图片的富文本
           NSAttributedString *string = [NSAttributedString attributedStringWithAttachment:attch];

   //    [attr appendAttributedString:string]; //在文字后面添加图片
        [attrTitle insertAttributedString:string atIndex:0];
    }
    self.titleLab.attributedText = attrTitle;
    
    self.contentLab.text = model.subtitle;
    

    if (model.subtitle.length==0) {
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(0.01);

        }];
    }else{
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(8));
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
    self.refundLab.text = @"";
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
            make.bottom.offset(AUTO(-12));
        }];
    }else{

        [self.timeLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.refundLab.mas_left);
            make.centerY.equalTo(self.refundLab);
            make.bottom.offset(AUTO(-12));
        }];
        self.refundLab.text = @"";
    }
    

    if ([self.type integerValue]==3) {
        self.timeLab.text = [NSString stringWithFormat:@"%@ 发布",model.created_at];
    }else{
        self.timeLab.text = [NSString stringWithFormat:@"%@ 截止",model.end_time];
    }
    
    if ([model.click intValue]==0) {
        self.likeImgView.hidden = YES;
        self.likeLab.text = @"";
    }else{
        self.likeImgView.hidden = NO;
        self.likeLab.text = model.click;
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
        _timeLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_000000 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIButton *)likeBtn {
    if (!_likeBtn) {
        _likeBtn = [UIButton initWithText:@"" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:[COLOR_000000 colorWithAlphaComponent:0.6]];
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
        _likeLab = [UILabel initWithTitle:@"点赞" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _likeLab;
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
        _ysImgView.hidden = YES;
    }
    return _ysImgView;
}
@end
