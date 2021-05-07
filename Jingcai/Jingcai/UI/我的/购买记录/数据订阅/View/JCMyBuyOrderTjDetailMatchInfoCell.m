//
//  JCMyBuyOrderTjDetailMatchInfoCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderTjDetailMatchInfoCell.h"

@implementation JCMyBuyOrderTjDetailMatchInfoCell

- (void)initViews {
    self.backgroundColor= COLOR_F4F6F9;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [bgView addSubview:self.matchTitleLab];
    [self.matchTitleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.matchTitleLab.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(1);
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [bgView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.titleLab);
    }];
    
    [bgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(75));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [bgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-75));
        make.top.equalTo(self.homeImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [bgView addSubview:self.resImageView];
    [self.resImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-8));
        make.top.equalTo(self.awayImgView);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
    [bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeImgView);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
//    [bgView addSubview:self.vsImgView];
//    [self.vsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.scoreLab);
//        make.centerX.equalTo(self.scoreLab);
//        make.size.mas_equalTo(CGSizeMake(AUTO(18), AUTO(13)));
//    }];
    
    [bgView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.scoreLab.mas_bottom);
    }];
    
    [bgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.homeImgView);
        make.width.mas_equalTo(AUTO(110));
//        make.height.mas_equalTo(AUTO(21));
    }];
    
    [bgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.awayImgView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_greaterThanOrEqualTo(AUTO(25));
        make.bottom.offset(AUTO(-20));
    }];
    
    WeakSelf;
    [bgView bk_whenTapped:^{
        if (weakSelf.JCDetailBlock) {
            weakSelf.JCDetailBlock();
        }
    }];
    
//    UIView *lineView = [UIView new];
//    lineView.backgroundColor = COLOR_DDDDDD;
//    [bgView addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-10));
//        make.bottom.offset(AUTO(-10));
//        make.height.mas_equalTo(0.5);
//    }];
    

}

- (void)setModel:(JCDianPingMatchBall *)model {
    _model = model;
    
    
       NSString *title = @"";
    if (model.round_num.length>0) {
        title = [NSString stringWithFormat:@"%@ | %@ | %@",NonNil(model.competition_name),NonNil(model.round_num),NonNil(model.match_time_two)];
    }else{
        title = [NSString stringWithFormat:@"%@ | %@",NonNil(model.competition_name),NonNil(model.match_time_two)];
    }

    self.titleLab.text = title;

    self.statusLab.text = model.status_cn;
    if ([model.status_id intValue]>1&&[model.status_id intValue]<9) {

        self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",self.model.home_scores,self.model.away_scores];
    }else{
        self.scoreLab.text = @"vs";
//        self.vsImgView.hidden = NO;
    }
    self.homeNameLab.text = model.home_team_name;
    self.awayNameLab.text = model.away_team_name;
    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
     [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    
    self.resImageView.hidden = [model.wl integerValue]>0?NO:YES;
    if ([model.wl integerValue]==1) {
        self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hong"];
    }
    if ([model.wl integerValue]==2) {
        self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hei"];
        return ;
    }
    if ([model.wl integerValue]==3) {
        self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_zou"];

    }
    
    

}

- (void)setDetailModel:(JCHongbangOrderDetailModel *)detailModel {
    _detailModel = detailModel;
    self.matchTitleLab.text = detailModel.title;
//    self.resImageView.hidden = [detailModel.wl integerValue]>0?NO:YES;
//    if ([detailModel.wl integerValue]==1) {
//        self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hong"];
//    }
//    if ([detailModel.wl integerValue]==2) {
//        self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hei"];
//        return ;
//    }
//    if ([detailModel.wl integerValue]==3) {
//        self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_zou"];
//
//    }
    

}

- (void)setBigDataModel:(JCBigDataOrderDetailModel *)bigDataModel {
    _bigDataModel = bigDataModel;
    self.matchTitleLab.text = bigDataModel.title;
//        NSString *title = @"";
//        if (bigDataModel.match_name.length>0) {
//            title = [NSString stringWithFormat:@"%@ | %@ | %@",NonNil(bigDataModel.league_name),NonNil(bigDataModel.match_name),NonNil(bigDataModel.match_time)];
//        }else{
//            title = [NSString stringWithFormat:@"%@ | %@",NonNil(bigDataModel.league_name),NonNil(bigDataModel.match_time)];
//        }
//    self.titleLab.text = title;
//
////        if (bigDataModel.league_name.length>0) {
////            NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
////            NSRange range = [title rangeOfString:bigDataModel.league_name];
////            [attrTitle addAttributes:@{NSForegroundColorAttributeName:COLOR_0091FF} range:range];
////            self.titleLab.attributedText = attrTitle;
////        }else{
////            self.titleLab.text = title;
////        }
//
//
//        self.homeNameLab.text = bigDataModel.home_name;
//        self.awayNameLab.text = bigDataModel.away_name;
//
//    self.statusLab.text = bigDataModel.type_desc;
//
//    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:bigDataModel.homo_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
//    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:bigDataModel.away_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
//    if ([bigDataModel.matchStatus intValue]>1) {
//        self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",bigDataModel.full_home,bigDataModel.full_away];
//
//    }else{
//        self.scoreLab.text = @"VS";
//
//    }
//

//    self.priceLab.text = [NSString stringWithFormat:@"实付：%@红币",model.total];
}

- (UILabel *)matchTitleLab {
    if (!_matchTitleLab) {
        _matchTitleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _matchTitleLab.numberOfLines= 0;
    }
    return _matchTitleLab;
}




- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.cornerRadius = AUTO(1.5);
        _tagLab.layer.masksToBounds = YES;
    }
    return _tagLab;
}

- (UIImageView *)homeImgView {
    if (!_homeImgView) {
        _homeImgView = [UIImageView new];
        _homeImgView.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.contentMode = UIViewContentModeScaleAspectFit;

    }
    return _awayImgView;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

-(UIImageView *)vsImgView {
    if (!_vsImgView) {
        _vsImgView = [UIImageView new];
        _vsImgView.image = JCIMAGE(@"icon_vs");
        _vsImgView.hidden = YES;
    }
    return _vsImgView;
}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _statusLab;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _homeNameLab.numberOfLines= 2;
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayNameLab.numberOfLines= 2;
    }
    return _awayNameLab;
}

-(UIImageView *)resImageView {
    if (!_resImageView) {
        _resImageView = [UIImageView new];
    }
    return _resImageView;
}

@end
