//
//  JCPostPlanOPCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/8.
//  Copyright © 2020 jingcai. All rights reserved.
//

#import "JCPostPlanOPCell.h"

@implementation JCPostPlanOPCell
- (void)initViews {

    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"post_back");
    [self.contentView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.size.mas_equalTo(CGSizeMake(AUTO(7), AUTO(14)));
    }];
    
    [self.contentView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(imgView);
        make.left.offset(AUTO(15));
        make.right.equalTo(imgView.mas_left).offset(AUTO(-5));
        
        
    }];
    
    [self.contentView addSubview:self.homeImgView];
    [self.homeImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(75));
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
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


    
    [self.contentView addSubview:self.homeNameLab];
    [self.homeNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.homeImgView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_equalTo(AUTO(21));
    }];
    
    [self.contentView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.awayImgView);
        make.width.mas_equalTo(AUTO(110));
        make.height.mas_equalTo(AUTO(21));
    }];
    
    
    
    [self.contentView addSubview:self.masterWin_normalBtn];
    [self.masterWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(10));
        make.right.equalTo(self.mas_centerX).offset(AUTO(-35));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.normalInfoLab];
    [self.normalInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.right.equalTo(self.masterWin_normalBtn.mas_left).offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
    }];

//
    [self.contentView addSubview:self.equal_normalBtn];
    [self.equal_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.left.equalTo(self.masterWin_normalBtn.mas_right).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];

    [self.contentView addSubview:self.customerWin_normalBtn];
    [self.customerWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.left.equalTo(self.equal_normalBtn.mas_right).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];

    [self.contentView addSubview:self.anotherView];
    [self.anotherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(50));
        make.top.equalTo(self.normalInfoLab.mas_bottom).offset(AUTO(10));
    }];

    [self.anotherView addSubview:self.anotherInfoLab];
    [self.anotherInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.normalInfoLab);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
    }];


    [self.anotherView addSubview:self.masterWin_anotherBtn];
    [self.masterWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.masterWin_normalBtn);
        make.top.equalTo(self.masterWin_normalBtn.mas_bottom).offset(AUTO(10));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];

    [self.anotherView addSubview:self.equal_anotherBtn];
     [self.equal_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.equal_normalBtn);
         make.top.equalTo(self.equal_normalBtn.mas_bottom).offset(AUTO(10));
         make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
     }];

    [self.anotherView addSubview:self.customerWin_anotherBtn];
     [self.customerWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.customerWin_normalBtn);
         make.top.equalTo(self.customerWin_normalBtn.mas_bottom).offset(AUTO(10));
         make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
     }];
    
    [self.contentView addSubview:self.deleteBtn];
    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.customerWin_normalBtn);
        make.top.equalTo(self.customerWin_anotherBtn.mas_bottom);
        make.width.mas_equalTo(AUTO(70));
        make.bottom.equalTo(self);
    }];
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(1);
        make.bottom.equalTo(self);
    }];
    WeakSelf;
    [self.titleLab bk_whenTapped:^{
        if (weakSelf.JCTitleSelectBlock) {
            weakSelf.JCTitleSelectBlock();
        }
    }];
    
}


- (void)setModel:(JCPostPlanMathInfoModel *)model {
    _model = model;

//    if (!model.title) {
//        self.titleLab.text = @"选择比赛";
//    }else{
//        self.titleLab.text = model.title;
//    }
    
    self.titleLab.text = [NSString stringWithFormat:@"%@ %@",model.competition_name,model.match_long_time];
    if (model.issue_num.length>0) {
        self.titleLab.text = [NSString stringWithFormat:@"%@ %@ %@",model.competition_name,model.issue_num,model.match_long_time];
    }


    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeNameLab.text = model.home_team_name;
    self.awayNameLab.text = model.away_team_name;
    
    if (!self.model.odds_spf_model.rq){
        self.normalInfoLab.text = @"-";
    }else{
        self.normalInfoLab.text = self.model.odds_spf_model.rq;
    }
    
    if (!self.model.odds_rq_model.rq){
        self.anotherInfoLab.text = @"-";
    }else{
        self.anotherInfoLab.text = self.model.odds_rq_model.rq;
    }
    
    self.masterWin_normalBtn.selected = NO;
    self.equal_normalBtn.selected = NO;
    self.customerWin_normalBtn.selected = NO;
    self.masterWin_anotherBtn.selected = NO;
    self.equal_anotherBtn.selected = NO;
    self.customerWin_anotherBtn.selected = NO;

    self.masterWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    self.equal_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    self.customerWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    self.masterWin_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    self.equal_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    self.customerWin_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    
    self.masterWin_normalBtn.backgroundColor = JCWhiteColor;
    self.equal_normalBtn.backgroundColor = JCWhiteColor;
    self.customerWin_normalBtn.backgroundColor = JCWhiteColor;
    self.masterWin_anotherBtn.backgroundColor = JCWhiteColor;
    self.equal_anotherBtn.backgroundColor = JCWhiteColor;
    self.customerWin_anotherBtn.backgroundColor = JCWhiteColor;

    
    if (!self.model.odds_spf_model.win) {
        [self.masterWin_normalBtn setTitle:@"-" forState:0];
        self.masterWin_normalBtn.userInteractionEnabled = NO;
    }else{
        if ([self.model.odds_spf_model.win floatValue]<1.40&&self.dataArray.count
            <=1) {
            self.masterWin_normalBtn.backgroundColor = COLOR_E4E4E4;
            self.masterWin_normalBtn.userInteractionEnabled = NO;
        }else{
            
           self.masterWin_normalBtn.userInteractionEnabled = YES;
        }
        [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"主胜%@",self.model.odds_spf_model.win] forState:0];
        self.masterWin_normalBtn.value = self.model.odds_spf_model.win;
    }
    
    if (!self.model.odds_spf_model.draw) {
        [self.equal_normalBtn setTitle:@"-" forState:0];
        self.equal_normalBtn.userInteractionEnabled = NO;
    }else{
        if ([self.model.odds_spf_model.draw floatValue]<1.40&&self.dataArray.count
            <=1) {
             self.equal_normalBtn.backgroundColor = COLOR_E4E4E4;
            self.equal_normalBtn.userInteractionEnabled = NO;
        }else {
           
            self.equal_normalBtn.userInteractionEnabled = YES;
        }
        [self.equal_normalBtn setTitle:[NSString stringWithFormat:@"平%@",self.model.odds_spf_model.draw] forState:0];
        self.equal_normalBtn.value = self.model.odds_spf_model.draw;
        
    }
    if (!self.model.odds_spf_model.lost) {
        [self.customerWin_normalBtn setTitle:@"-" forState:0];
        self.customerWin_normalBtn.userInteractionEnabled = NO;
    }else{
        if ([self.model.odds_spf_model.lost floatValue]<1.40&&self.dataArray.count
            <=1) {
            self.customerWin_normalBtn.backgroundColor = COLOR_E4E4E4;
            self.customerWin_normalBtn.userInteractionEnabled = NO;
        }else {
            
            self.customerWin_normalBtn.userInteractionEnabled = YES;
        }
        
        [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"客胜%@",self.model.odds_spf_model.lost] forState:0];
        self.customerWin_normalBtn.value = self.model.odds_spf_model.lost;

    }
    if (!self.model.odds_rq_model.win) {
        [self.masterWin_anotherBtn setTitle:@"-" forState:0];
        self.masterWin_anotherBtn.userInteractionEnabled = NO;
    }else{
        if ([self.model.odds_rq_model.win floatValue]<1.40&&self.dataArray.count
            <=1) {
             self.masterWin_anotherBtn.backgroundColor = COLOR_E4E4E4;
            self.masterWin_anotherBtn.userInteractionEnabled = NO;
        }else {
           
            self.masterWin_anotherBtn.userInteractionEnabled = YES;
        }
        
        [self.masterWin_anotherBtn setTitle:[NSString stringWithFormat:@"主胜%@",self.model.odds_rq_model.win] forState:0];
        self.masterWin_anotherBtn.value = self.model.odds_rq_model.win;

    }
    if (!self.model.odds_rq_model.draw) {
        [self.equal_anotherBtn setTitle:@"-" forState:0];
        self.equal_anotherBtn.userInteractionEnabled = NO;
    }else{
        if ([self.model.odds_rq_model.draw floatValue]<1.40&&self.dataArray.count
            <=1) {
            self.equal_anotherBtn.backgroundColor = COLOR_E4E4E4;
            self.equal_anotherBtn.userInteractionEnabled = NO;
        }else {
            
            self.equal_anotherBtn.userInteractionEnabled = YES;
        }
        
        [self.equal_anotherBtn setTitle:[NSString stringWithFormat:@"平%@",self.model.odds_rq_model.draw] forState:0];
         self.equal_anotherBtn.value = self.model.odds_rq_model.draw;

    }
    if (!self.model.odds_rq_model.lost) {
        [self.customerWin_anotherBtn setTitle:@"-" forState:0];
        self.customerWin_anotherBtn.userInteractionEnabled = NO;
    }else{
        
        if ([self.model.odds_rq_model.lost floatValue]<1.40&&self.dataArray.count
            <=1) {
            self.customerWin_anotherBtn.userInteractionEnabled = NO;
            self.customerWin_anotherBtn.backgroundColor = COLOR_E4E4E4;
        }else {
            
            self.customerWin_anotherBtn.userInteractionEnabled = YES;
        }
         [self.customerWin_anotherBtn setTitle:[NSString stringWithFormat:@"客胜%@",self.model.odds_rq_model.lost] forState:0];
        self.customerWin_anotherBtn.value = self.model.odds_rq_model.lost;
    }
    

    
    NSMutableArray *newBtnArray = [NSMutableArray array];
    for (JCPostButton *btn in self.model.btnArray) {
        if ([btn.spf integerValue]==1) {
            self.masterWin_normalBtn.selected = YES;
            self.masterWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            [newBtnArray addObject:self.masterWin_normalBtn];
//            self.
            
        }
        if ([btn.spf integerValue]==2) {
            self.equal_normalBtn.selected = YES;
            self.equal_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            [newBtnArray addObject:self.equal_normalBtn];
        }
        if ([btn.spf integerValue]==3) {
            self.customerWin_normalBtn.selected = YES;
            self.customerWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            [newBtnArray addObject:self.customerWin_normalBtn];
        }
        if ([btn.spf integerValue]==4) {
            self.masterWin_anotherBtn.selected = YES;
            self.masterWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
             [newBtnArray addObject:self.masterWin_anotherBtn];
        }
        if ([btn.spf integerValue]==5) {
            self.equal_anotherBtn.selected = YES;
            self.equal_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
             [newBtnArray addObject:self.equal_anotherBtn];
        }
        if ([btn.spf integerValue]==6) {
            self.customerWin_anotherBtn.selected = YES;
            self.customerWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
             [newBtnArray addObject:self.customerWin_anotherBtn];
        }
    }
    self.model.btnArray = [NSMutableArray arrayWithArray:newBtnArray];
    self.btnArray = [NSMutableArray arrayWithArray:self.model.btnArray];
}

- (void)btnClick:(JCPostButton *)sender {
    
    sender.selected = !sender.selected;
    
    //竞彩多串,只能有一场是双选,其他场只能单选
    BOOL haveTwo = NO;
    for (JCPostPlanMathInfoModel *mathModel in self.dataArray) {

        if (mathModel.btnArray.count>1) {
            //存在双选
            haveTwo = YES;
        }
    }
    //已经有一个双选
    if (sender.selected&&haveTwo&&self.btnArray.count>0) {
        sender.selected = NO;
        if (self.btnArray.count>=2) {
            return;
        }
        [JCWToastTool showHint:@"该模式,只有一场可多选~~"];
        return;
    }
//    &&self.dataArray.count==1
    if (self.model.btnArray.count==1&&self.dataArray.count
        <=1) {
        JCPostButton *btn = self.model.btnArray.firstObject;
        BOOL xiayu2 = [btn.value floatValue]<=2||[sender.value floatValue]<=2;
        if (xiayu2&&sender.selected) {
            sender.selected = NO;
            [JCWToastTool showHint:@"双选两个选项都需要大于2.0~~"];
            return;
        }
        if (sender.selected&&(xiayu2||[btn.value floatValue]+[sender.value floatValue]<=5.6)) {
            sender.selected = NO;
            [JCWToastTool showHint:@"双选两个选项相加需要大于5.6~~"];
            return;
        }
    }
    
    
    if (self.btnArray.count>1) {
        if (sender.selected) {
            sender.selected = NO;
        }else{
//            sender.backgroundColor = JCWhiteColor;
            sender.layer.borderColor = COLOR_DDDDDD.CGColor;
            if ([self.btnArray containsObject:sender]) {
                [self.btnArray removeObject:sender];
            }
        }

    }else{
        if (sender.selected) {
            sender.layer.borderColor = JCBaseColor.CGColor;
            if (![self.btnArray containsObject:sender]) {
                [self.btnArray addObject:sender];
            }
        }else{
//            sender.backgroundColor = JCWhiteColor;
            sender.layer.borderColor = COLOR_DDDDDD.CGColor;
            if ([self.btnArray containsObject:sender]) {
                [self.btnArray removeObject:sender];
            }
        }

    }
    self.model.btnArray = [NSMutableArray arrayWithArray:self.btnArray];
    if (self.JCMatchSelectBlock) {
        self.JCMatchSelectBlock();
    }
    
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel initWithTitle:@"选择比赛" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLabel.font = [UIFont boldSystemFontOfSize:AUTO(15)];
    }
    return _titleLabel;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.userInteractionEnabled = YES;
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (JCPostButton *)masterWin_normalBtn {
    if (!_masterWin_normalBtn) {
        _masterWin_normalBtn = [JCPostButton initWithTexts:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _masterWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _masterWin_normalBtn.layer.borderWidth = 0.5;
        _masterWin_normalBtn.layer.masksToBounds = YES;
        _masterWin_normalBtn.layer.cornerRadius = AUTO(15);
        [_masterWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_masterWin_normalBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
        _masterWin_normalBtn.spf = @"1";
        
    }
    return _masterWin_normalBtn;
}



- (JCPostButton *)equal_normalBtn {
    if (!_equal_normalBtn) {
        _equal_normalBtn = [JCPostButton initWithTexts:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _equal_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _equal_normalBtn.layer.borderWidth = 0.5;
        _equal_normalBtn.layer.masksToBounds = YES;
        _equal_normalBtn.layer.cornerRadius = AUTO(15);
        [_equal_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_equal_normalBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
        _equal_normalBtn.spf = @"2";
    }
    return _equal_normalBtn;
}

- (JCPostButton *)customerWin_normalBtn {
    if (!_customerWin_normalBtn) {
        _customerWin_normalBtn = [JCPostButton initWithTexts:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _customerWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _customerWin_normalBtn.layer.borderWidth = 0.5;
        _customerWin_normalBtn.layer.masksToBounds = YES;
        _customerWin_normalBtn.layer.cornerRadius = AUTO(15);
        [_customerWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_customerWin_normalBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
         _customerWin_normalBtn.spf = @"3";
        
    }
    return _customerWin_normalBtn;
}



- (JCPostButton *)masterWin_anotherBtn {
    if (!_masterWin_anotherBtn) {
        _masterWin_anotherBtn = [JCPostButton initWithTexts:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _masterWin_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _masterWin_anotherBtn.layer.borderWidth = 0.5;
         [_masterWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//         [_masterWin_anotherBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
        _masterWin_anotherBtn.layer.masksToBounds = YES;
        _masterWin_anotherBtn.layer.cornerRadius = AUTO(15);
        _masterWin_anotherBtn.isRQ = YES;
        _masterWin_anotherBtn.spf = @"4";
    }
    return _masterWin_anotherBtn;
}

- (JCPostButton *)equal_anotherBtn {
    if (!_equal_anotherBtn) {
        _equal_anotherBtn = [JCPostButton initWithTexts:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _equal_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _equal_anotherBtn.layer.borderWidth =0.5;
        [_equal_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        _equal_anotherBtn.layer.masksToBounds = YES;
        _equal_anotherBtn.layer.cornerRadius = AUTO(15);
//          [_equal_anotherBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
         _equal_anotherBtn.isRQ = YES;
        _equal_anotherBtn.spf = @"5";
    }
    return _equal_anotherBtn;
}

- (JCPostButton *)customerWin_anotherBtn {
    if (!_customerWin_anotherBtn) {
        _customerWin_anotherBtn = [JCPostButton initWithTexts:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_2F2F2F];
        _customerWin_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _customerWin_anotherBtn.layer.borderWidth = 0.5;
        _customerWin_anotherBtn.layer.masksToBounds = YES;
        _customerWin_anotherBtn.layer.cornerRadius = AUTO(15);
        [_customerWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_customerWin_anotherBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
         _customerWin_anotherBtn.isRQ = YES;
        _customerWin_anotherBtn.spf = @"6";
    }
    return _customerWin_anotherBtn;
}

- (UILabel *)normalInfoLab {
    if (!_normalInfoLab) {
        _normalInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _normalInfoLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _normalInfoLab.layer.borderWidth = 0.5;
        _normalInfoLab.layer.masksToBounds = YES;
        _normalInfoLab.layer.cornerRadius = AUTO(15);
    }
    return _normalInfoLab;
}
- (UILabel *)anotherInfoLab {
    if (!_anotherInfoLab) {
        _anotherInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _anotherInfoLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _anotherInfoLab.layer.borderWidth = 0.5;
        _anotherInfoLab.layer.masksToBounds = YES;
        _anotherInfoLab.layer.cornerRadius = AUTO(15);
    }
    return _anotherInfoLab;
}

- (UIView *)anotherView {
    if (!_anotherView) {
        _anotherView = [UIView new];
        _anotherView.backgroundColor = JCClearColor;
    }
    return _anotherView;
}

- (UIButton *)deleteBtn {
    if (!_deleteBtn) {
        _deleteBtn = [UIButton initWithText:@"删除比赛" FontSize:AUTO(12) BackGroundColor:JCClearColor TextColors:COLOR_369DEB];
        _deleteBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    }
    return _deleteBtn;
}

- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
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

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"vs" andFont:AUTO(20) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_F0F0F0;
    }
    return _lineView;
}

@end
