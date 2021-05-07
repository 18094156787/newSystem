//
//  JCParticipateJingCaiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/9/24.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCParticipateJingCaiCell.h"

@implementation JCParticipateJingCaiCell

- (void)initViews {
    self.contentView.backgroundColor = COLOR_F6F6F6;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(10), AUTO(15), 0, AUTO(15)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(5));
        make.top.offset(AUTO(5));
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
        make.width.mas_equalTo(40);
    }];
    
    [bgView addSubview:self.masterImgView];
    [self.masterImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.right.equalTo(self.infoLab.mas_left).offset(AUTO(-20));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(20)));
    }];
    
    [bgView addSubview:self.customerImgView];
    [self.customerImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.left.equalTo(self.infoLab.mas_right).offset(AUTO(20));
        make.size.mas_equalTo(CGSizeMake(AUTO(20), AUTO(20)));
    }];

    
    [bgView addSubview:self.masterNameLab];
    [self.masterNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.right.equalTo(self.masterImgView.mas_left).offset(AUTO(-20));
        make.left.offset(AUTO(15));
    }];
    
    [bgView addSubview:self.customerNameLab];
    [self.customerNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.left.equalTo(self.customerImgView.mas_right).offset(AUTO(20));
        make.right.offset(AUTO(-15));
    }];
    
    [bgView addSubview:self.masterWin_normalBtn];
    [self.masterWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.masterNameLab.mas_bottom).offset(AUTO(15));
        make.right.equalTo(self.mas_centerX).offset(AUTO(-20));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(40)));
    }];

    [bgView addSubview:self.normalInfoLab];
    [self.normalInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.right.equalTo(self.masterWin_normalBtn.mas_left).offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [self.normalInfoLab addSubview:self.danImgView];
    [self.danImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(14), AUTO(17)));
    }];
    
    [bgView addSubview:self.equal_normalBtn];
    [self.equal_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.left.equalTo(self.masterWin_normalBtn.mas_right).offset(AUTO(-1));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(40)));
    }];
    
    [bgView addSubview:self.customerWin_normalBtn];
    [self.customerWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.left.equalTo(self.equal_normalBtn.mas_right).offset(AUTO(-1));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(40)));
    }];
    
    [bgView addSubview:self.anotherView];
    [self.anotherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(50));
        make.top.equalTo(self.normalInfoLab.mas_bottom).offset(AUTO(10));
    }];
    
    [self.anotherView addSubview:self.anotherInfoLab];
    [self.anotherInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.normalInfoLab);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(40), AUTO(40)));
    }];
    
    [self.anotherInfoLab addSubview:self.dan_anotherImgView];
    [self.dan_anotherImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(14), AUTO(17)));
    }];
    
    [self.anotherView addSubview:self.masterWin_anotherBtn];
    [self.masterWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.masterWin_normalBtn);
        make.top.equalTo(self.masterWin_normalBtn.mas_bottom).offset(AUTO(10));
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(40)));
    }];
    
    [self.anotherView addSubview:self.equal_anotherBtn];
     [self.equal_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.equal_normalBtn);
         make.top.equalTo(self.equal_normalBtn.mas_bottom).offset(AUTO(10));
         make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(40)));
     }];
    
    [self.anotherView addSubview:self.customerWin_anotherBtn];
     [self.customerWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.customerWin_normalBtn);
         make.top.equalTo(self.customerWin_normalBtn.mas_bottom).offset(AUTO(10));
         make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(40)));
     }];
    
    [bgView addSubview:self.haveJingCaiView];
    [self.haveJingCaiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    UIImageView *haveJCview = [UIImageView new];
    [self.haveJingCaiView addSubview:haveJCview];
    haveJCview.image = JCIMAGE(@"jingcai_yjc");
    [haveJCview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.haveJingCaiView);
        make.centerY.equalTo(self.haveJingCaiView);
        make.size.mas_equalTo(CGSizeMake(AUTO(200), AUTO(135)));

    }];
  

    
//    [self data];
}

- (void)setModel:(JCJingCaiMatchModel *)model {
    _model = model;
    
    if(model.is_guess==1){
        self.haveJingCaiView.hidden = NO;
    }else{
        self.haveJingCaiView.hidden = YES;
    }
    
    /*重置按钮的选中状态，避免复用问题*/
    self.masterWin_normalBtn.selected = NO;
    self.equal_normalBtn.selected = NO;
    self.customerWin_normalBtn.selected = NO;

    self.masterWin_anotherBtn.selected = NO;
    self.equal_anotherBtn.selected = NO;
    self.customerWin_anotherBtn.selected = NO;

    self.masterWin_normalBtn.backgroundColor = JCWhiteColor;
    self.equal_normalBtn.backgroundColor = JCWhiteColor;
    self.customerWin_normalBtn.backgroundColor = JCWhiteColor;


    self.masterWin_anotherBtn.backgroundColor = JCWhiteColor;
    self.equal_anotherBtn.backgroundColor = JCWhiteColor;
    self.customerWin_anotherBtn.backgroundColor = JCWhiteColor;


    if (model.isSelect) {
        if ([model.select_spf integerValue]==1) {
            self.masterWin_normalBtn.selected = YES;
            self.masterWin_normalBtn.backgroundColor = JCBaseColor;
            self.currentBtn = self.masterWin_normalBtn;
        }
        if ([model.select_spf integerValue]==2) {
            self.equal_normalBtn.selected = YES;
            self.equal_normalBtn.backgroundColor = JCBaseColor;
            self.currentBtn = self.equal_normalBtn;
        }
        if ([model.select_spf integerValue]==3) {
            self.customerWin_normalBtn.selected = YES;
            self.customerWin_normalBtn.backgroundColor = JCBaseColor;
            self.currentBtn = self.customerWin_normalBtn;
        }
        if ([model.select_spf integerValue]==4) {
            self.masterWin_anotherBtn.selected = YES;
            self.masterWin_anotherBtn.backgroundColor = JCBaseColor;
            self.currentBtn = self.masterWin_anotherBtn;
        }
        if ([model.select_spf integerValue]==5) {
            self.equal_anotherBtn.selected = YES;
            self.equal_anotherBtn.backgroundColor = JCBaseColor;
            self.currentBtn = self.equal_anotherBtn;
        }
        if ([model.select_spf integerValue]==6) {
            self.customerWin_anotherBtn.selected = YES;
            self.customerWin_anotherBtn.backgroundColor = JCBaseColor;
            self.currentBtn = self.customerWin_anotherBtn;
        }
    }
    
    
    NSString *title = [NSString stringWithFormat:@"%@ | %@|%@",self.model.event_name,self.model.time,model.match_name];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:title];
    NSRange range = [title rangeOfString:self.model.event_name];
    [attrString addAttribute:NSForegroundColorAttributeName value:COLOR_4A90E2 range:range];
    self.titleLab.attributedText = attrString;
    
    self.masterNameLab.text = self.model.homeName;
    self.customerNameLab.text = self.model.awayName;
    [self.masterImgView sd_setImageWithURL:[NSURL URLWithString:self.model.homoLogo]];
    [self.customerImgView sd_setImageWithURL:[NSURL URLWithString:self.model.awayLogo]];
    
    
    if ([self.model.noRq.rq intValue]>0) {
        self.normalInfoLab.textColor = COLOR_FE1F19;
        self.normalInfoLab.text = [NSString stringWithFormat:@"+%@",self.model.noRq.rq];
    }else{
        self.normalInfoLab.text = self.model.noRq.rq;
        self.normalInfoLab.textColor = COLOR_666666;
    }
    
    [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"主胜 %@",self.model.noRq.win] forState:0];
    [self.equal_normalBtn setTitle:[NSString stringWithFormat:@"平 %@",self.model.noRq.equal] forState:0];
    [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"客胜 %@",self.model.noRq.lose] forState:0];
    
     
    if ([self.model.Rq.rq intValue]>0) {
        self.anotherInfoLab.textColor = COLOR_FE1F19;
        self.anotherInfoLab.text = [NSString stringWithFormat:@"+%@",self.model.Rq.rq];
    }else{
        self.anotherInfoLab.text = self.model.Rq.rq;
        self.anotherInfoLab.textColor = COLOR_666666;
    }
    [self.masterWin_anotherBtn setTitle:[NSString stringWithFormat:@"主胜 %@",self.model.Rq.win] forState:0];
    [self.equal_anotherBtn setTitle:[NSString stringWithFormat:@"平 %@",self.model.Rq.equal] forState:0];
    [self.customerWin_anotherBtn setTitle:[NSString stringWithFormat:@"客胜 %@",self.model.Rq.lose] forState:0];
    
    self.masterWin_normalBtn.value = self.model.noRq.win;
    self.equal_normalBtn.value = self.model.noRq.equal;
    self.customerWin_normalBtn.value = self.model.noRq.lose;
    
    self.masterWin_anotherBtn.value = self.model.Rq.win;
    self.equal_anotherBtn.value = self.model.Rq.equal;
    self.customerWin_anotherBtn.value = self.model.Rq.lose;
    
    //每个按钮是属于单关还是多串。type=1是单关 type=2是多串
    self.masterWin_normalBtn.type = model.single.is_norq==1 ? 1:2;
    self.equal_normalBtn.type = model.single.is_norq==1 ? 1:2;
    self.customerWin_normalBtn.type = model.single.is_norq==1 ? 1:2;
    
    self.masterWin_anotherBtn.type = model.single.is_rq==1 ? 1:2;
    self.equal_anotherBtn.type = model.single.is_rq==1 ? 1:2;
    self.customerWin_anotherBtn.type = model.single.is_rq==1 ? 1:2;
  
    self.danImgView.hidden = self.model.single.is_norq==1?NO:YES;
    self.dan_anotherImgView.hidden = self.model.single.is_rq==1?NO:YES;

    
    /**/
    self.model.requestModel.match_id = self.model.match_id;
    self.model.requestModel.op_id = self.model.noRq.id;
    self.model.requestModel.rop_id = self.model.Rq.id;
    self.model.requestModel.match_time = self.model.match_time;
  
    
    
    self.masterWin_normalBtn.userInteractionEnabled = YES;
    self.equal_normalBtn.userInteractionEnabled = YES;
    self.customerWin_normalBtn.userInteractionEnabled = YES;
    
    self.masterWin_anotherBtn.userInteractionEnabled = YES;
    self.equal_anotherBtn.userInteractionEnabled = YES;
    self.customerWin_anotherBtn.userInteractionEnabled = YES;
    
    if (!self.model.noRq.win) {
        [self.masterWin_normalBtn setTitle:@"-" forState:0];
        self.masterWin_normalBtn.userInteractionEnabled = NO;
    }
    if (!self.model.noRq.equal) {
        [self.equal_normalBtn setTitle:@"-" forState:0];
        self.equal_normalBtn.userInteractionEnabled = NO;
    }
    if (!self.model.noRq.lose) {
        [self.customerWin_normalBtn setTitle:@"-" forState:0];
        self.customerWin_normalBtn.userInteractionEnabled = NO;
    }
    if (!self.model.Rq.win) {
        [self.masterWin_anotherBtn setTitle:@"-" forState:0];
        self.masterWin_anotherBtn.userInteractionEnabled = NO;
    }
    if (!self.model.Rq.equal) {
        [self.equal_anotherBtn setTitle:@"-" forState:0];
        self.equal_anotherBtn.userInteractionEnabled = NO;
    }
    if (!self.model.Rq.lose) {
        [self.customerWin_anotherBtn setTitle:@"-" forState:0];
        self.customerWin_anotherBtn.userInteractionEnabled = NO;
    }
    
}


- (void)btnClick:(JCJingCaiBtn *)sender {
    
    
        self.count =0;
        [self.dataArray enumerateObjectsUsingBlock:^(JCJingCaiMatchModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
    //        @strongify(index);
            if (obj.isSelect) {
                self.count++;
               
            }
        }];
     //大于2个则不能新增
    if (self.count>=2&&!sender.selected&&!self.model.isSelect) {
        
        self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.tipView.infoLab.text = @"最多选2组哟～";
        [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
        return;
    }

//    self.model.isSelect = NO;
    NSLog(@"%@",sender.value);
    sender.selected = !sender.selected;
    
   

    
    if (sender==self.currentBtn) {
        
        if (sender.selected) {
          sender.backgroundColor = JCBaseColor;
            
        }else{
         sender.backgroundColor = JCWhiteColor;
            self.model.select_spf = @"0";

        }
    }else{
 

         self.currentBtn.selected = !sender.selected;
        if (sender.selected) {
            sender.backgroundColor = JCBaseColor;
            self.currentBtn.backgroundColor = JCWhiteColor;

            
        }else{
            sender.backgroundColor = JCWhiteColor;
           self.currentBtn.backgroundColor = JCWhiteColor;
            self.model.select_spf = @"0";
        }
    
    }
    
    self.currentBtn = sender;
    self.model.isSelect = self.currentBtn.selected;
    
    if (self.currentBtn.selected) {
        self.model.select_spf = self.currentBtn.spf;
    }

    
    
    self.model.requestModel.spf = self.currentBtn.spf;
    self.model.requestModel.type = self.currentBtn.type;
    self.model.requestModel.value = self.currentBtn.value;
    
    if (self.JCJingcaiBlock) {
        self.JCJingcaiBlock();
    }
    

}



- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel labelTitle:@"VS" andFont:AUTO(14) andWeight:UIFontWeightSemibold andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _infoLab.font = [UIFont boldSystemFontOfSize:AUTO(14)];
    }
    return _infoLab;
}

-  (UIImageView *)masterImgView {
    if (!_masterImgView) {
        _masterImgView = [UIImageView new];
        _masterImgView.backgroundColor = COLOR_F6F6F6;
        _masterImgView.contentMode = UIViewContentModeScaleAspectFill;
        _masterImgView.clipsToBounds = YES;
    }
    return _masterImgView;
}

-  (UIImageView *)customerImgView {
    if (!_customerImgView) {
        _customerImgView = [UIImageView new];
         _customerImgView.backgroundColor = COLOR_F6F6F6;
        _customerImgView.contentMode = UIViewContentModeScaleAspectFill;
        _customerImgView.clipsToBounds = YES;
    }
    return _customerImgView;
}

- (UILabel *)masterNameLab {
    if (!_masterNameLab) {
        _masterNameLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _masterNameLab.numberOfLines = 2;
         _masterNameLab.font = [UIFont boldSystemFontOfSize:AUTO(13)];
    }
    return _masterNameLab;
}

- (UILabel *)customerNameLab {
    if (!_customerNameLab) {
        _customerNameLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _customerNameLab.numberOfLines = 2;
         _customerNameLab.font = [UIFont boldSystemFontOfSize:AUTO(13)];
    }
    return _customerNameLab;
}

- (UILabel *)normalInfoLab {
    if (!_normalInfoLab) {
        _normalInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_666666 andBackgroundColor:COLOR_F8F8F8 andTextAlignment:NSTextAlignmentCenter];
        _normalInfoLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _normalInfoLab.layer.borderWidth = 1;
    }
    return _normalInfoLab;
}

- (JCJingCaiBtn *)masterWin_normalBtn {
    if (!_masterWin_normalBtn) {
        _masterWin_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _masterWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _masterWin_normalBtn.layer.borderWidth = 1;
        [_masterWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_masterWin_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        _masterWin_normalBtn.spf = @"1";
        
    }
    return _masterWin_normalBtn;
}



- (JCJingCaiBtn *)equal_normalBtn {
    if (!_equal_normalBtn) {
        _equal_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _equal_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _equal_normalBtn.layer.borderWidth = 1;
        [_equal_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_equal_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        _equal_normalBtn.spf = @"2";
    }
    return _equal_normalBtn;
}

- (JCJingCaiBtn *)customerWin_normalBtn {
    if (!_customerWin_normalBtn) {
        _customerWin_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _customerWin_normalBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _customerWin_normalBtn.layer.borderWidth = 1;
        [_customerWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_customerWin_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
         _customerWin_normalBtn.spf = @"3";
    }
    return _customerWin_normalBtn;
}

- (UILabel *)anotherInfoLab {
    if (!_anotherInfoLab) {
        _anotherInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_666666 andBackgroundColor:COLOR_F8F8F8 andTextAlignment:NSTextAlignmentCenter];
        _anotherInfoLab.layer.borderColor = COLOR_DDDDDD.CGColor;
        _anotherInfoLab.layer.borderWidth = 1;
    }
    return _anotherInfoLab;
}

- (JCJingCaiBtn *)masterWin_anotherBtn {
    if (!_masterWin_anotherBtn) {
        _masterWin_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _masterWin_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _masterWin_anotherBtn.layer.borderWidth = 1;
         [_masterWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
         [_masterWin_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        _masterWin_anotherBtn.isRQ = YES;
        _masterWin_anotherBtn.spf = @"4";
    }
    return _masterWin_anotherBtn;
}

- (JCJingCaiBtn *)equal_anotherBtn {
    if (!_equal_anotherBtn) {
        _equal_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _equal_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _equal_anotherBtn.layer.borderWidth = 1;
        [_equal_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
          [_equal_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
         _equal_anotherBtn.isRQ = YES;
        _equal_anotherBtn.spf = @"5";
    }
    return _equal_anotherBtn;
}

- (JCJingCaiBtn *)customerWin_anotherBtn {
    if (!_customerWin_anotherBtn) {
        _customerWin_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _customerWin_anotherBtn.layer.borderColor = COLOR_DDDDDD.CGColor;
        _customerWin_anotherBtn.layer.borderWidth = 1;
        [_customerWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [_customerWin_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
         _customerWin_anotherBtn.isRQ = YES;
        _customerWin_anotherBtn.spf = @"6";
    }
    return _customerWin_anotherBtn;
}

-  (UIImageView *)danImgView {
    if (!_danImgView) {
        _danImgView = [UIImageView new];
        _danImgView.image = JCIMAGE(@"bg_danguan");
    }
    return _danImgView;
}

-  (UIImageView *)dan_anotherImgView {
    if (!_dan_anotherImgView) {
        _dan_anotherImgView = [UIImageView new];
        _dan_anotherImgView.image = JCIMAGE(@"bg_danguan");
    }
    return _dan_anotherImgView;
}

- (UIView *)anotherView {
    if (!_anotherView) {
        _anotherView = [UIView new];
        _anotherView.backgroundColor = JCClearColor;
    }
    return _anotherView;
}
- (NSMutableArray *)btnArray {
    if (!_btnArray) {
        _btnArray = [NSMutableArray array];
    }
    return _btnArray;
}
- (JCParticipateJingCaiTipView *)tipView {
    if (!_tipView) {
        _tipView = [JCParticipateJingCaiTipView new];
    }
    return _tipView;
}
- (UIView *)haveJingCaiView {
    if (!_haveJingCaiView) {
        _haveJingCaiView = [UIView new];
        _haveJingCaiView.hidden = YES;
    }
    return _haveJingCaiView;
}
@end
