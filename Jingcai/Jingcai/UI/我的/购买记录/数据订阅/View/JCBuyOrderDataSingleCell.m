//
//  JCBuyOrderDataSingleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBuyOrderDataSingleCell.h"

@implementation JCBuyOrderDataSingleCell

- (void)initViews {
    [self.contentView addSubview:self.titleInfoLab];
    [self.titleInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_F0F0F0;
    [self.contentView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.titleInfoLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(1);
    }];
    
//    [self.contentView addSubview:self.bgView];
//    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
//        make.right.offset(0);
////        make.height.mas_equalTo(AUTO(120));
//    }];
    

    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(lineView.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
//    [self.bgView addSubview:self.tagLab];
//    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-15));
//        make.centerY.equalTo(self.titleLab);
//    }];
    
    [self.contentView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(75));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [self.contentView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-75));
        make.top.equalTo(self.homeImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [self.contentView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeImgView);
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
//    [self.bgView addSubview:self.vsImgView];
//    [self.vsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(self.scoreLab);
//        make.centerX.equalTo(self.scoreLab);
//        make.size.mas_equalTo(CGSizeMake(AUTO(18), AUTO(13)));
//    }];
    
    [self.contentView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.scoreLab.mas_bottom);
    }];
    
    [self.contentView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.homeImgView);
        make.width.mas_equalTo(AUTO(110));
//        make.height.mas_equalTo(AUTO(21));
    }];
    
    [self.contentView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.awayImgView);
        make.width.mas_equalTo(AUTO(110));
//        make.height.mas_equalTo(AUTO(21));
    }];
  
    
    [self.contentView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(13));
        make.height.mas_equalTo(AUTO(20));
        make.bottom.offset(AUTO(-12));
    }];
    
    [self.contentView addSubview:self.orderDetailLab];
    [self.orderDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-25));
        make.centerY.equalTo(self.priceLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(62), AUTO(38)));
    }];
    
    UIImageView *indicateView  = [UIImageView new];
    indicateView.image = JCIMAGE(@"post_back");
    [self.contentView addSubview:indicateView];
    [indicateView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.orderDetailLab.mas_right).offset(2);
        make.centerY.equalTo(self.orderDetailLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(7), AUTO(12)));
    }];
    
    WeakSelf;
    [self.orderDetailLab bk_whenTapped:^{
        if (weakSelf.JCDetailBlock) {
            weakSelf.JCDetailBlock();
        }
    }];
}

- (void)setModel:(JCMyBuyOrderDataModel *)model {
    _model = model;
    self.titleInfoLab.text = model.style_desc;
//    if (model.match_data.count>0) {
//
//
//    }
//    JCDianPingMatchBall *matchModel = model.match_data.firstObject;
    NSString *title = @"";
    if (model.round_num.length>0) {
        title = [NSString stringWithFormat:@"%@ | %@ | %@",NonNil(model.competition_name),NonNil(model.round_num),NonNil(model.match_time)];
    }else{
        title = [NSString stringWithFormat:@"%@ | %@",NonNil(model.competition_name),NonNil(model.match_time)];
    }
    self.titleLab.text = title;
    
    self.homeNameLab.text = model.home_team_name;
    self.awayNameLab.text = model.away_team_name;
    self.statusLab.text = model.status_cn;
    
    if (model.home_team_name.length>model.away_team_name.length) {
        [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(13));
            make.height.mas_equalTo(AUTO(20));
            make.bottom.offset(AUTO(-12));
        }];
    }else{
        [self.priceLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.top.equalTo(self.awayNameLab.mas_bottom).offset(AUTO(13));
            make.height.mas_equalTo(AUTO(20));
            make.bottom.offset(AUTO(-12));
        }];
    }
   

    

    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    if ([model.status_id intValue]>1&&[model.status_id intValue]<9) {
        self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",model.home_scores,model.away_scores];

    }else{

        self.scoreLab.text = @"vs";
    }

    self.priceLab.text = [NSString stringWithFormat:@"实付：%@红币",@([model.pay_price floatValue])];

    

}

- (UILabel *)titleInfoLab {
    if (!_titleInfoLab) {
        _titleInfoLab = [UILabel initWithTitle:@"" andFont:AUTO(17) andWeight:3 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleInfoLab;
}


- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
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
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
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
        _homeNameLab.numberOfLines = 2;
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _awayNameLab.numberOfLines = 2;
    }
    return _awayNameLab;
}



- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _orderDetailLab.userInteractionEnabled = YES;
    }
    return _orderDetailLab;
}
@end
