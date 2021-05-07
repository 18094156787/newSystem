//
//  JCMyBuyOrderDataSingleHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCMyBuyOrderDataSingleHeadView.h"

@implementation JCMyBuyOrderDataSingleHeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.titleInfoLab];
    [self.titleInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.height.mas_equalTo(AUTO(25));
    }];
    
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleInfoLab.mas_bottom).offset(AUTO(8));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(AUTO(120));
    }];
    


    self.bgView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
    self.bgView.layer.cornerRadius = 4;
    self.bgView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.12].CGColor;
    self.bgView.layer.shadowOffset = CGSizeMake(0,0);
    self.bgView.layer.shadowOpacity = 1;
    self.bgView.layer.shadowRadius = 5;
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(8));
        make.height.mas_equalTo(AUTO(20));
    }];

    [self.bgView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(50));
        make.top.offset(AUTO(37));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [self.bgView addSubview:self.awayImgView];
    [self.awayImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-50));
        make.top.offset(AUTO(37));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [self.bgView addSubview:self.scoreLab];
    [self.scoreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.homeImgView);
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(30)));
    }];
    
    [self.bgView addSubview:self.vsImgView];
    [self.vsImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.scoreLab);
        make.centerX.equalTo(self.scoreLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(18), AUTO(13)));
    }];
    
    [self.bgView addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.scoreLab.mas_bottom);
    }];
    
    [self.bgView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(AUTO(110));
//        make.height.mas_equalTo(AUTO(21));
    }];
    
    [self.bgView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.right.offset(AUTO(-15));
        make.width.mas_equalTo(AUTO(110));
//        make.height.mas_equalTo(AUTO(21));
    }];
  
//
//    [self addSubview:self.priceLab];
//    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(13));
//        make.height.mas_equalTo(AUTO(20));
//        make.bottom.offset(AUTO(-12));
//    }];
//
//    [self addSubview:self.orderDetailLab];
//    [self.orderDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(AUTO(-15));
//        make.centerY.equalTo(self.priceLab);
//        make.size.mas_equalTo(CGSizeMake(AUTO(62), AUTO(28)));
//    }];
    
    WeakSelf;
    [self.bgView bk_whenTapped:^{
        if (weakSelf.JCDetailBlock) {
            weakSelf.JCDetailBlock();
        }
    }];
}

- (void)setModel:(JCBigDataOrderDetailModel *)model {
    _model = model;
    self.titleInfoLab.text = model.title;//style_desc
        NSString *title = @"";
        if (model.match_name.length>0) {
            title = [NSString stringWithFormat:@"%@ | %@ | %@",NonNil(model.league_name),NonNil(model.match_name),NonNil(model.match_time)];
        }else{
            title = [NSString stringWithFormat:@"%@ | %@",NonNil(model.league_name),NonNil(model.match_time)];
        }

        if (model.league_name.length>0) {
            NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
            NSRange range = [title rangeOfString:model.league_name];
            [attrTitle addAttributes:@{NSForegroundColorAttributeName:COLOR_0091FF} range:range];
            self.titleLab.attributedText = attrTitle;
        }else{
            self.titleLab.text = title;
        }
    
        
        self.homeNameLab.text = model.home_name;
        self.awayNameLab.text = model.away_name;
        
        self.statusLab.text = model.type_desc;

    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.homo_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    if ([model.matchStatus intValue]>1) {
        self.scoreLab.text = [NSString stringWithFormat:@"%@ : %@",model.full_home,model.full_away];
//        self.vsImgView.hidden = YES;
    }else{
//        self.vsImgView.hidden = NO;
        self.scoreLab.text = @"VS";
    }
    

    self.priceLab.text = [NSString stringWithFormat:@"实付：%@红币",model.total];
    

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
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _homeImgView.layer.borderWidth = 0.5;
        _homeImgView.layer.borderColor = COLOR_DDDDDD.CGColor;
        _homeImgView.layer.masksToBounds = YES;
        _homeImgView.layer.cornerRadius = AUTO(20);
    }
    return _homeImgView;
}

- (UIImageView *)awayImgView {
    if (!_awayImgView) {
        _awayImgView = [UIImageView new];
        _awayImgView.layer.borderWidth = 0.5;
        _awayImgView.layer.borderColor = COLOR_DDDDDD.CGColor;
        _awayImgView.layer.masksToBounds = YES;
        _awayImgView.layer.cornerRadius = AUTO(20);
    }
    return _awayImgView;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"" andFont:AUTO(17) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
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
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_B3B3B3 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
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
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(13) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _orderDetailLab.layer.borderColor= COLOR_DDDDDD.CGColor;
        _orderDetailLab.layer.borderWidth = 0.5;
        _orderDetailLab.layer.cornerRadius = 2;
        _orderDetailLab.layer.masksToBounds = YES;
    }
    return _orderDetailLab;
}

@end
