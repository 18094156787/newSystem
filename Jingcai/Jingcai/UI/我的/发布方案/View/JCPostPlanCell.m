//
//  JCPostPlanCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/26.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCPostPlanCell.h"

@implementation JCPostPlanCell

- (void)initViews {
    self.contentView.backgroundColor = JCWhiteColor;

    
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
        make.width.mas_equalTo(AUTO(150));
        make.height.mas_equalTo(AUTO(21));
    }];
    
    [self.contentView addSubview:self.awayNameLab];
    [self.awayNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeImgView.mas_bottom).offset(AUTO(3));
        make.centerX.equalTo(self.awayImgView);
        make.width.mas_equalTo(AUTO(150));
        make.height.mas_equalTo(AUTO(21));
    }];
    

    


//
    [self.contentView addSubview:self.equal_normalBtn];
    [self.equal_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeNameLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(self.contentView);
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.masterWin_normalBtn];
    [self.masterWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.equal_normalBtn);
        make.right.equalTo(self.equal_normalBtn.mas_left).offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];

    [self.contentView addSubview:self.customerWin_normalBtn];
    [self.customerWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.equal_normalBtn);
        make.left.equalTo(self.equal_normalBtn.mas_right).offset(AUTO(10));
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(30)));
    }];


    
//    [self.contentView addSubview:self.deleteBtn];
//    [self.deleteBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.customerWin_normalBtn);
//        make.top.equalTo(self.customerWin_normalBtn.mas_bottom).offset(AUTO(5));
//        make.width.mas_equalTo(AUTO(70));
//        make.height.mas_equalTo(AUTO(40));
//    }];
    WeakSelf;
    [self.titleLab bk_whenTapped:^{
        if (weakSelf.JCTitleSelectBlock) {
            weakSelf.JCTitleSelectBlock();
        }
    }];
    

    
}


- (void)setModel:(JCPostPlanMathInfoModel *)model {
    _model = model;
//    model.is_reverse = 1;
    self.titleLab.text = [NSString stringWithFormat:@"%@ %@",model.competition_name,model.match_long_time];
    if (model.issue_num.length>0) {
        self.titleLab.text = [NSString stringWithFormat:@"%@ %@ %@",model.competition_name,model.issue_num,model.match_long_time];
    }


    [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
    [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
    self.homeNameLab.text = model.home_team_name;
    self.awayNameLab.text = model.away_team_name;
    //默认是让球,如果是3,则是大小球
//    JCPostPlanMathInfoSPFModel *sfpModel = model.odds_yp_model;
    JCPostPlanMathInfoSPFModel *sfpModel = model.odds_dxq_model;
    if ([self.type integerValue]==2) {
        sfpModel = model.odds_yp_model;
    }
    
    if (!sfpModel.win) {
        [self.masterWin_normalBtn setTitle:@"-" forState:0];
        self.masterWin_normalBtn.userInteractionEnabled = NO;
    }else{
        NSString *title = @"主胜";
        if ([self.type integerValue]==3) {
            title = @"高";
        }
        [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"%@%@",title,sfpModel.win] forState:0];
        self.masterWin_normalBtn.userInteractionEnabled = YES;
    }
    
    if (!sfpModel.draw) {
        [self.equal_normalBtn setTitle:@"-" forState:0];
        self.equal_normalBtn.userInteractionEnabled = NO;
        self.equal_normalBtn.backgroundColor = JCWhiteColor;
        [self.equal_normalBtn setTitleColor:COLOR_333333 forState:0];
    }else{
        self.equal_normalBtn.backgroundColor = COLOR_DDDDDD;
        [self.equal_normalBtn setTitleColor:COLOR_999999 forState:0];
        [self.equal_normalBtn setTitle:[NSString stringWithFormat:@"盘口%@",sfpModel.draw] forState:0];
        self.equal_normalBtn.userInteractionEnabled = YES;
    }
    if (!sfpModel.lost) {
        [self.customerWin_normalBtn setTitle:@"-" forState:0];
        self.customerWin_normalBtn.userInteractionEnabled = NO;
    }else{
        NSString *title = @"客胜";
        if ([self.type integerValue]==3) {
            title = @"低";
        }
        [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"%@%@",title,sfpModel.lost] forState:0];
        self.customerWin_normalBtn.userInteractionEnabled = YES;
    }

    
    self.masterWin_normalBtn.selected = NO;
    self.equal_normalBtn.selected = NO;
    self.customerWin_normalBtn.selected = NO;


    self.masterWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    self.equal_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
    self.customerWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;

    
    if ([self.model.selectBtn.spf integerValue]==[self.masterWin_normalBtn.spf integerValue]) {
        self.masterWin_normalBtn.selected = YES;
        self.masterWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
        self.selectBtn = self.masterWin_normalBtn;
    }
    if ([self.model.selectBtn.spf integerValue]==[self.customerWin_normalBtn.spf integerValue]) {
        self.customerWin_normalBtn.selected = YES;
        self.customerWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
        self.selectBtn = self.customerWin_normalBtn;
    }
    
#pragma mark//相反
    if (model.is_reverse==1&&!self.is_qy) {
        [self.homeImgView sd_setImageWithURL:[NSURL URLWithString:model.away_team_logo] placeholderImage:JCIMAGE(@"away_placeholder")];
        [self.awayImgView sd_setImageWithURL:[NSURL URLWithString:model.home_team_logo] placeholderImage:JCIMAGE(@"home_placeholder")];
        self.homeNameLab.text = model.away_team_name;
        self.awayNameLab.text = model.home_team_name;
        
        if ([self.type integerValue]==2) {
            sfpModel = model.odds_yp_model;
        }
        
        if (!sfpModel.win) {
            [self.masterWin_normalBtn setTitle:@"-" forState:0];
            self.masterWin_normalBtn.userInteractionEnabled = NO;
        }else{
            NSString *title = @"主胜";
            if ([self.type integerValue]==3) {
                title = @"大球";
            }
            [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"%@%@",title,sfpModel.lost] forState:0];
            self.masterWin_normalBtn.userInteractionEnabled = YES;
        }
        
        if (!sfpModel.draw) {
            [self.equal_normalBtn setTitle:@"-" forState:0];
            self.equal_normalBtn.userInteractionEnabled = NO;
            self.equal_normalBtn.backgroundColor = JCWhiteColor;
            [self.equal_normalBtn setTitleColor:COLOR_333333 forState:0];
        }else{
            self.equal_normalBtn.backgroundColor = COLOR_DDDDDD;
            [self.equal_normalBtn setTitleColor:COLOR_999999 forState:0];
            
//            NSString *draw = sfpModel.draw
            NSString *draw = sfpModel.draw;
            
            

            [self.equal_normalBtn setTitle:draw forState:0];
            self.equal_normalBtn.userInteractionEnabled = YES;
        }
        if (!sfpModel.win) {
            [self.customerWin_normalBtn setTitle:@"-" forState:0];
            self.customerWin_normalBtn.userInteractionEnabled = NO;
        }else{
            NSString *title = @"客胜";
            if ([self.type integerValue]==3) {
                title = @"小球";
            }
            [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"%@%@",title,sfpModel.win] forState:0];
            self.customerWin_normalBtn.userInteractionEnabled = YES;
        }

        
        self.masterWin_normalBtn.selected = NO;
        self.equal_normalBtn.selected = NO;
        self.customerWin_normalBtn.selected = NO;


        self.masterWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        self.equal_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        self.customerWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;

        
        if ([self.model.selectBtn.spf integerValue]==[self.masterWin_normalBtn.spf integerValue]) {
            self.masterWin_normalBtn.selected = YES;
            self.masterWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            self.selectBtn = self.masterWin_normalBtn;
        }
        if ([self.model.selectBtn.spf integerValue]==[self.customerWin_normalBtn.spf integerValue]) {
            self.customerWin_normalBtn.selected = YES;
            self.customerWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
            self.selectBtn = self.customerWin_normalBtn;
        }
    }

}

- (void)btnClick:(JCPostButton *)sender {


    

    if (self.selectBtn!=sender) {
         sender.selected = !sender.selected;
         self.selectBtn.selected = !self.selectBtn.selected;
        if (sender.selected) {
            self.selectBtn.selected = NO;
            self.selectBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
            sender.layer.borderColor = JCBaseColor.CGColor;
        }else{
            sender.layer.borderColor = COLOR_DDDDDD.CGColor;

        }
    }else{
        sender.selected = YES;
        sender.layer.borderColor = JCBaseColor.CGColor;
    }
    
    

    self.selectBtn = sender;

    self.model.selectBtn = self.selectBtn;
    if (self.JCMatchSelectBlock) {
        self.JCMatchSelectBlock();
    }
    
    
    
}

- (UILabel *)matchLabel {
    if (!_matchLabel) {
        _matchLabel = [UILabel initWithTitle:@"筛选比赛" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _matchLabel.font = [UIFont boldSystemFontOfSize:AUTO(15)];
    }
    return _matchLabel;
}

- (UITextField *)matchTF {
    if (!_matchTF) {
        _matchTF = [UITextField new];
        _matchTF.font = [UIFont systemFontOfSize:AUTO(14)];
        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"例如：欧冠 皇马" attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:AUTO(14) weight:UIFontWeightRegular],NSForegroundColorAttributeName:COLOR_999999}];
        _matchTF.attributedPlaceholder = string;
        _matchTF.textColor = COLOR_999999;
        _matchTF.textAlignment = NSTextAlignmentRight;
    }
    return _matchTF;;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLabel.font = [UIFont boldSystemFontOfSize:AUTO(15)];
        
    }
    return _titleLabel;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _equal_normalBtn.userInteractionEnabled = NO;
        _equal_normalBtn.layer.masksToBounds = YES;
        _equal_normalBtn.layer.cornerRadius = AUTO(15);
//        [_equal_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_equal_normalBtn setTitleColor:JCBaseColor forState:UIControlStateSelected];
//        _equal_normalBtn.spf = @"2";
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
        _homeImgView.image = JCIMAGE(@"home_placeholder");
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
        _awayImgView.image = JCIMAGE(@"away_placeholder");
    }
    return _awayImgView;
}

- (UILabel *)homeNameLab {
    if (!_homeNameLab) {
        _homeNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _homeNameLab;
}

- (UILabel *)awayNameLab {
    if (!_awayNameLab) {
        _awayNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _awayNameLab;
}

- (UILabel *)scoreLab {
    if (!_scoreLab) {
        _scoreLab = [UILabel initWithTitle:@"vs" andFont:AUTO(20) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _scoreLab;
}

@end
