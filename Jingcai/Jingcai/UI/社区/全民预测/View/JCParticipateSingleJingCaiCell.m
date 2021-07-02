//
//  JCParticipateSingleJingCaiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2019/11/6.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCParticipateSingleJingCaiCell.h"

@implementation JCParticipateSingleJingCaiCell

- (void)initViews {
    self.contentView.backgroundColor = JCWhiteColor;
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self.contentView addSubview:bgView];
//    [bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(10), 0, 0, 0));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
    }];
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(12));
        make.centerX.equalTo(bgView);
        make.width.mas_equalTo(AUTO(50));
    }];
    
    [bgView addSubview:self.masterNameLab];
    [self.masterNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.right.equalTo(self.infoLab.mas_left);
        make.width.mas_equalTo(AUTO(100));
        make.left.offset(15);
    }];
    
    [bgView addSubview:self.customerNameLab];
    [self.customerNameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.infoLab);
        make.left.equalTo(self.infoLab.mas_right);
        make.right.offset(-15);
    }];
    
    
    [bgView addSubview:self.masterView];
    [self.masterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(30));
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(12));
//        make.bottom.offset(0);
    }];
    
    [self.masterView addSubview:self.masterWin_normalBtn];
    [self.masterWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(0);
        make.right.equalTo(self.mas_centerX).offset(AUTO(-35));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];

    [self.masterView addSubview:self.normalInfoLab];
    [self.normalInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.right.equalTo(self.masterWin_normalBtn.mas_left).offset(AUTO(-5));
        make.size.mas_equalTo(CGSizeMake(AUTO(28), AUTO(28)));
    }];

    
    [self.masterView addSubview:self.equal_normalBtn];
    [self.equal_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.left.equalTo(self.masterWin_normalBtn.mas_right).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.masterView addSubview:self.customerWin_normalBtn];
    [self.customerWin_normalBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.masterWin_normalBtn);
        make.left.equalTo(self.equal_normalBtn.mas_right).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [bgView addSubview:self.anotherView];
    [self.anotherView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(30));
        make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
        make.bottom.offset(AUTO(-10));
    }];
    
    [self.anotherView addSubview:self.anotherInfoLab];
    [self.anotherInfoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.normalInfoLab);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(28), AUTO(28)));
    }];

    
    [self.anotherView addSubview:self.masterWin_anotherBtn];
    [self.masterWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.masterWin_normalBtn);
        make.top.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
    }];
    
    [self.anotherView addSubview:self.equal_anotherBtn];
     [self.equal_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.equal_normalBtn);
         make.top.offset(0);
         make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
     }];
    
    [self.anotherView addSubview:self.customerWin_anotherBtn];
     [self.customerWin_anotherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerX.equalTo(self.customerWin_normalBtn);
         make.top.offset(0);
         make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(28)));
//         make.bottom.offset(AUTO(-15));
     }];
  

    [bgView addSubview:self.haveJingCaiView];
    [self.haveJingCaiView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab);
        make.right.offset(AUTO(-10));
        make.size.mas_equalTo(CGSizeMake(AUTO(90), AUTO(72)));
    }];
    
    UIImageView *haveJCview = [UIImageView new];
    [self.haveJingCaiView addSubview:haveJCview];
    haveJCview.image = JCIMAGE(@"yuce_yjc");
    [haveJCview mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);

    }];
    
//    [self data];
}

- (void)setModel:(JCJingCaiMatchModel *)model {
    _model = model;
//    model.is_reverse = 1;
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
    
    self.masterWin_normalBtn.userInteractionEnabled = YES;
    self.equal_normalBtn.userInteractionEnabled = YES;
    self.customerWin_normalBtn.userInteractionEnabled = YES;
    
    self.masterWin_anotherBtn.userInteractionEnabled = YES;
    self.equal_anotherBtn.userInteractionEnabled = YES;
    self.customerWin_anotherBtn.userInteractionEnabled = YES;

    self.masterWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.equal_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.customerWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.masterWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.equal_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    self.customerWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
    
    
    if (([self.model.noRq.win floatValue]<=1.4&&self.model.noRq.win)||self.model.is_future==1) {
        self.masterWin_normalBtn.backgroundColor = COLOR_F2F2F2;
         self.masterWin_normalBtn.userInteractionEnabled = NO;
        [self.masterWin_normalBtn setTitleColor:COLOR_A9A9A9 forState:0];
    }else{
        self.masterWin_normalBtn.backgroundColor = JCWhiteColor;
         [self.masterWin_normalBtn setTitleColor:COLOR_333333 forState:0];
    }
     if (([self.model.noRq.equal floatValue]<=1.4&&self.model.noRq.equal)||self.model.is_future==1) {
         self.equal_normalBtn.backgroundColor = COLOR_F2F2F2;
         self.equal_normalBtn.userInteractionEnabled = NO;
         [self.equal_normalBtn setTitleColor:COLOR_A9A9A9 forState:0];
     }else{
         self.equal_normalBtn.backgroundColor = JCWhiteColor;
          [self.equal_normalBtn setTitleColor:COLOR_333333 forState:0];
     }
     if (([self.model.noRq.lose floatValue]<=1.4&&self.model.noRq.lose)||self.model.is_future==1) {
         self.customerWin_normalBtn.backgroundColor = COLOR_F2F2F2;
         self.customerWin_normalBtn.userInteractionEnabled = NO;
         [self.customerWin_normalBtn setTitleColor:COLOR_A9A9A9 forState:0];
     }else{
         self.customerWin_normalBtn.backgroundColor = JCWhiteColor;
          [self.customerWin_normalBtn setTitleColor:COLOR_333333 forState:0];
     }
     if (([self.model.Rq.win floatValue]<=1.4&&self.model.Rq.win)||self.model.is_future==1) {
         self.masterWin_anotherBtn.backgroundColor = COLOR_F2F2F2;
         self.masterWin_anotherBtn.userInteractionEnabled = NO;
         [self.masterWin_anotherBtn setTitleColor:COLOR_A9A9A9 forState:0];
     }else{
         self.masterWin_anotherBtn.backgroundColor = JCWhiteColor;
          [self.masterWin_anotherBtn setTitleColor:COLOR_333333 forState:0];
     }
     if (([self.model.Rq.equal floatValue]<=1.4&&self.model.Rq.equal)||self.model.is_future==1) {
         self.equal_anotherBtn.backgroundColor = COLOR_F2F2F2;
         self.equal_anotherBtn.userInteractionEnabled = NO;
         [self.equal_anotherBtn setTitleColor:COLOR_A9A9A9 forState:0];
     }else{
         self.equal_anotherBtn.backgroundColor = JCWhiteColor;
          [self.equal_anotherBtn setTitleColor:COLOR_333333 forState:0];
     }
     if (([self.model.Rq.lose floatValue]<=1.4&&self.model.Rq.lose)||self.model.is_future==1) {
         self.customerWin_anotherBtn.backgroundColor = COLOR_F2F2F2;
         self.customerWin_anotherBtn.userInteractionEnabled = NO;
         [self.customerWin_anotherBtn setTitleColor:COLOR_A9A9A9 forState:0];
     }else{
         self.customerWin_anotherBtn.backgroundColor = JCWhiteColor;
          [self.customerWin_anotherBtn setTitleColor:COLOR_333333 forState:0];
     }
    
    if(model.is_future==1){
        self.haveJingCaiView.hidden = NO;
        
        self.masterWin_normalBtn.userInteractionEnabled = NO;
        self.equal_normalBtn.userInteractionEnabled = NO;
        self.customerWin_normalBtn.userInteractionEnabled = NO;
        
        self.masterWin_anotherBtn.userInteractionEnabled = NO;
        self.equal_anotherBtn.userInteractionEnabled = NO;
        self.customerWin_anotherBtn.userInteractionEnabled = NO;
    }else{
        self.haveJingCaiView.hidden = YES;
    }


    if (model.isSelect) {
        NSArray *array = self.model.requestModel.btnArray;
        if (array.count==1) {
            JCJingCaiBtn *btn = array[0];
            if ([btn.spf integerValue]==1) {
                self.masterWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                self.masterWin_normalBtn.selected = YES;
             }
             if ([btn.spf integerValue]==2) {
                 self.equal_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.equal_normalBtn.selected = YES;
             }
             if ([btn.spf integerValue]==3) {
                 self.customerWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.customerWin_normalBtn.selected = YES;
             }
             if ([btn.spf integerValue]==4) {
                 self.masterWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.masterWin_anotherBtn.selected = YES;
             }
             if ([btn.spf integerValue]==5) {
                 self.equal_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.equal_anotherBtn.selected = YES;
             }
             if ([btn.spf integerValue]==6) {
                 self.customerWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.customerWin_anotherBtn.selected = YES;
             }
            
        }else if (array.count==2){
            JCJingCaiBtn *btn = array[0];
            JCJingCaiBtn *btn1 = array[1];
            if ([btn.spf integerValue]==1||[btn1.spf integerValue]==1) {
                 self.masterWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                self.masterWin_normalBtn.selected = YES;
             }
             if ([btn.spf integerValue]==2||[btn1.spf integerValue]==2) {
                 self.equal_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.equal_normalBtn.selected = YES;
             }
             if ([btn.spf integerValue]==3||[btn1.spf integerValue]==3) {
                 self.customerWin_normalBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.customerWin_normalBtn.selected = YES;
             }
             if ([btn.spf integerValue]==4||[btn1.spf integerValue]==4) {
                 self.masterWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.masterWin_anotherBtn.selected = YES;
             }
             if ([btn.spf integerValue]==5||[btn1.spf integerValue]==5) {
                 self.equal_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.equal_anotherBtn.selected = YES;
             }
             if ([btn.spf integerValue]==6||[btn1.spf integerValue]==6) {
                 self.customerWin_anotherBtn.layer.borderColor = JCBaseColor.CGColor;
                 self.customerWin_anotherBtn.selected = YES;
             }
        }

    }
    
    //已预测的选项,改变边框颜色
    if (self.model.select_index.length>0) {
        NSArray *resultArray  = [self.model.select_index componentsSeparatedByString:@","];
        for (NSString *str in resultArray) {
            NSInteger value = [str intValue];
            if (value==1) {
                value=3;
            }
            if (value==3) {
                value=1;
            }
            if (value==4) {
                value=6;
            }
            if (value==6) {
                value=4;
            }
            if (value==1) {
                  self.masterWin_normalBtn.layer.borderColor = COLOR_9F9F9F.CGColor;
              }
              if (value==2) {
                  self.equal_normalBtn.layer.borderColor = COLOR_9F9F9F.CGColor;
              }
              if (value==3) {
                  self.customerWin_normalBtn.layer.borderColor = COLOR_9F9F9F.CGColor;
              }
              if (value==4) {
                  self.masterWin_anotherBtn.layer.borderColor = COLOR_9F9F9F.CGColor;
              }
              if (value==5) {
                  self.equal_anotherBtn.layer.borderColor = COLOR_9F9F9F.CGColor;
              }
              if (value==6) {
                  self.customerWin_anotherBtn.layer.borderColor = COLOR_9F9F9F.CGColor;
              }
            

        }
    }
    
    
    
    NSString *title = [NSString stringWithFormat:@"%@ | %@ ",self.model.competition_name,self.model.match_time];
    if (self.model.issue_num.length>0) {
     title = [NSString stringWithFormat:@"%@ | %@ | %@ ",self.model.competition_name,NonNil(self.model.issue_num),self.model.match_time];
    }
    self.titleLab.text = title;

    self.masterNameLab.text = self.model.home_team_name;
    self.customerNameLab.text = self.model.away_team_name;
    

    
    [self.masterImgView sd_setImageWithURL:[NSURL URLWithString:self.model.home_team_logo]];
    [self.customerImgView sd_setImageWithURL:[NSURL URLWithString:self.model.away_team_logo]];
    
    
    self.normalInfoLab.text = self.model.noRq.rq;
    if ([self.model.noRq.rq intValue]>0) {
        self.normalInfoLab.textColor = JCBaseColor;
    }else{
        self.normalInfoLab.textColor = COLOR_666666;
    }
    
    [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"主胜 %@",self.model.noRq.win] forState:0];
    [self.equal_normalBtn setTitle:[NSString stringWithFormat:@"平 %@",self.model.noRq.equal] forState:0];
    [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"客胜 %@",self.model.noRq.lose] forState:0];

    
     
    if ([self.model.Rq.rq intValue]>0) {
        self.anotherInfoLab.textColor = JCBaseColor;
        self.anotherInfoLab.text = [NSString stringWithFormat:@"%@",self.model.Rq.rq];
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

    self.model.requestModel.match_id = self.model.match_id;
    
#pragma mark//相反
    if (model.is_reverse==1) {
        self.masterNameLab.text = self.model.away_team_name;
        self.customerNameLab.text = self.model.home_team_name;
        
        
        [self.masterWin_normalBtn setTitle:[NSString stringWithFormat:@"主胜 %@",self.model.noRq.lose] forState:0];
        [self.customerWin_normalBtn setTitle:[NSString stringWithFormat:@"客胜 %@",self.model.noRq.win] forState:0];
        
        [self.masterWin_anotherBtn setTitle:[NSString stringWithFormat:@"主胜 %@",self.model.Rq.lose] forState:0];
        [self.customerWin_anotherBtn setTitle:[NSString stringWithFormat:@"客胜 %@",self.model.Rq.win] forState:0];
        
        self.masterWin_normalBtn.value = self.model.noRq.lose;
        self.customerWin_normalBtn.value = self.model.noRq.win;
        
        self.masterWin_anotherBtn.value = self.model.Rq.lose;
        self.customerWin_anotherBtn.value = self.model.Rq.win;
        
        NSString *noRq_rq = self.model.noRq.rq;
        if ([noRq_rq integerValue]!=0) {
            noRq_rq = [NSString stringWithFormat:@"%ld",[noRq_rq integerValue]*-1];
            if ([noRq_rq integerValue]>0) {
                noRq_rq = [NSString stringWithFormat:@"+%@",noRq_rq];
            }
            self.normalInfoLab.text = noRq_rq;
        }
       
        if ([noRq_rq integerValue]>0) {
            self.normalInfoLab.textColor = JCBaseColor;
        }else{
            self.normalInfoLab.textColor = COLOR_666666;
        }
        
        NSString *rq_rq = self.model.Rq.rq;
        if ([rq_rq integerValue]!=0) {
            rq_rq = [NSString stringWithFormat:@"%ld",[rq_rq integerValue]*-1];
            if ([rq_rq integerValue]>0) {
                rq_rq = [NSString stringWithFormat:@"+%@",rq_rq];
            }
            self.anotherInfoLab.text = rq_rq;
        }
        
        if ([rq_rq integerValue]>0) {
            self.anotherInfoLab.textColor = JCBaseColor;
        }else{
            self.anotherInfoLab.textColor = COLOR_666666;
        }
    }

    
    if (!self.model.noRq.win) {
        [self.masterWin_normalBtn setTitle:@"-" forState:0];
        self.masterWin_normalBtn.userInteractionEnabled = NO;
        [self.masterWin_normalBtn setImage:JCIMAGE(@"blank") forState:0];
    }
    if (!self.model.noRq.equal) {
        [self.equal_normalBtn setTitle:@"-" forState:0];
        self.equal_normalBtn.userInteractionEnabled = NO;
        [self.equal_normalBtn setImage:JCIMAGE(@"blank") forState:0];
    }
    if (!self.model.noRq.lose) {
        [self.customerWin_normalBtn setTitle:@"-" forState:0];
        self.customerWin_normalBtn.userInteractionEnabled = NO;
         [self.customerWin_normalBtn setImage:JCIMAGE(@"blank") forState:0];
    }
    if (!self.model.Rq.win) {
        [self.masterWin_anotherBtn setTitle:@"-" forState:0];
        self.masterWin_anotherBtn.userInteractionEnabled = NO;
         [self.masterWin_anotherBtn setImage:JCIMAGE(@"blank") forState:0];
    }
    if (!self.model.Rq.equal) {
        [self.equal_anotherBtn setTitle:@"-" forState:0];
        self.equal_anotherBtn.userInteractionEnabled = NO;
         [self.equal_anotherBtn setImage:JCIMAGE(@"blank") forState:0];
    }
    if (!self.model.Rq.lose) {
        [self.customerWin_anotherBtn setTitle:@"-" forState:0];
        self.customerWin_anotherBtn.userInteractionEnabled = NO;
         [self.customerWin_anotherBtn setImage:JCIMAGE(@"blank") forState:0];
    }
    
    
    self.masterView.hidden = self.model.noRq?NO:YES;
    self.anotherView.hidden = self.model.Rq?NO:YES;
    
    if (self.model.noRq&&self.model.Rq) {
        [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
            
            make.height.mas_equalTo(AUTO(30));
        }];
        [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
            make.height.mas_equalTo(AUTO(30));
            make.bottom.offset(AUTO(-10));
        }];
    }
    if (self.model.noRq&&!self.model.Rq) {
        [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
             make.top.equalTo(self.masterView.mas_bottom).offset(AUTO(10));
            make.height.mas_equalTo(AUTO(30));
            
        }];
        [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
            make.bottom.offset(0);
        }];
    }
    if (!self.model.noRq&&self.model.Rq) {
        [self.masterView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.masterView.mas_bottom).offset(0);
            make.height.mas_equalTo(0);
        }];
        [self.anotherView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.masterView.mas_bottom).offset(0);
            make.height.mas_equalTo(AUTO(30));
            make.bottom.offset(AUTO(-10));
            
        }];
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
    if (self.count>=1&&!sender.selected&&!self.model.isSelect) {

        self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        self.tipView.infoLab.text = @"最多只能选择一组数据哦！";
        [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
        return;
    }

//    self.model.isSelect = NO;
    NSLog(@"%@",sender.value);
    sender.selected = !sender.selected;
    if (sender.selected) {
        sender.layer.borderColor = JCBaseColor.CGColor;
    }else{
        sender.layer.borderColor = COLOR_E4E4E4.CGColor;
    }
    
    
    
    
    
    if (self.btnArray.count>1) {
        if (sender.selected) {
            self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
            self.tipView.infoLab.text = @"单场每组只能选2个哟～";
            [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
            sender.selected = NO;
            sender.layer.borderColor = COLOR_E4E4E4.CGColor;
//            [self.btnArray removeObject:sender];
            
        }else{
//            sender.backgroundColor = JCWhiteColor;
//            self.tipView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
//            self.tipView.infoLab.text = @"单场每组只能选2个哟～";
//            [[UIApplication sharedApplication].keyWindow addSubview:self.tipView];
//            sender.selected = NO;
            sender.layer.borderColor = COLOR_E4E4E4.CGColor;
//            sender.layer.borderColor = COLOR_E4E4E4.CGColor;
            if ([self.btnArray containsObject:sender]) {
                [self.btnArray removeObject:sender];
            }
        }

    }else{
        if (sender.selected) {
//            sender.backgroundColor = JCBaseColor;
            if (![self.btnArray containsObject:sender]) {
                [self.btnArray addObject:sender];
            }
        }else{
            sender.backgroundColor = JCWhiteColor;
            if ([self.btnArray containsObject:sender]) {
                [self.btnArray removeObject:sender];
            }
        }

    }

    if (self.btnArray.count>0) {
        self.model.isSelect = YES;
    }else{
        self.model.isSelect = NO;
        
    }

    self.model.requestModel.btnArray = self.btnArray;
    if (self.JCJingcaiBlock) {
        self.JCJingcaiBlock(self.btnArray);
    }
    

}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.font =  [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"VS" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
//        _infoLab.font = [UIFont boldSystemFontOfSize:AUTO(14)];
        
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
//        COLOR_333333
        _masterNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentRight];
        _masterNameLab.numberOfLines = 2;
        _masterNameLab.font = [UIFont boldSystemFontOfSize:AUTO(13)];
    }
    return _masterNameLab;
}

- (UILabel *)customerNameLab {
    if (!_customerNameLab) {
        _customerNameLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentLeft];
        _customerNameLab.font = [UIFont boldSystemFontOfSize:AUTO(13)];
        _customerNameLab.numberOfLines = 2;
    }
    return _customerNameLab;
}

- (UILabel *)normalInfoLab {
    if (!_normalInfoLab) {
        _normalInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_666666 andBackgroundColor:COLOR_F2F2F2 andTextAlignment:NSTextAlignmentCenter];
        _normalInfoLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _normalInfoLab.layer.borderWidth = 1;
        _normalInfoLab.layer.cornerRadius = AUTO(14);
        _normalInfoLab.layer.masksToBounds= YES;
    }
    return _normalInfoLab;
}

- (JCJingCaiBtn *)masterWin_normalBtn {
    if (!_masterWin_normalBtn) {
        _masterWin_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _masterWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _masterWin_normalBtn.layer.borderWidth = 1;
        _masterWin_normalBtn.layer.cornerRadius = AUTO(14);
        _masterWin_normalBtn.layer.masksToBounds= YES;
        [_masterWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_masterWin_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_masterWin_normalBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_masterWin_normalBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
//        [_masterWin_normalBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
        _masterWin_normalBtn.spf = @"1";
        
    }
    return _masterWin_normalBtn;
}



- (JCJingCaiBtn *)equal_normalBtn {
    if (!_equal_normalBtn) {
        _equal_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _equal_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _equal_normalBtn.layer.borderWidth = 1;
        _equal_normalBtn.layer.cornerRadius = AUTO(14);
        _equal_normalBtn.layer.masksToBounds= YES;
        [_equal_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_equal_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_equal_normalBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_equal_normalBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
//        [_equal_normalBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
        _equal_normalBtn.spf = @"2";
    }
    return _equal_normalBtn;
}

- (JCJingCaiBtn *)customerWin_normalBtn {
    if (!_customerWin_normalBtn) {
        _customerWin_normalBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _customerWin_normalBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _customerWin_normalBtn.layer.borderWidth = 1;
        _customerWin_normalBtn.layer.cornerRadius = AUTO(14);
        _customerWin_normalBtn.layer.masksToBounds= YES;
        [_customerWin_normalBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_customerWin_normalBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_customerWin_normalBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_customerWin_normalBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
//        [_customerWin_normalBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
         _customerWin_normalBtn.spf = @"3";
    }
    return _customerWin_normalBtn;
}

- (UILabel *)anotherInfoLab {
    if (!_anotherInfoLab) {
        _anotherInfoLab = [UILabel labelTitle:@"" andFont:AUTO(12) andWeight:UIFontWeightSemibold andTextColor:COLOR_666666 andBackgroundColor:COLOR_F2F2F2 andTextAlignment:NSTextAlignmentCenter];
        _anotherInfoLab.layer.borderColor = COLOR_E4E4E4.CGColor;
        _anotherInfoLab.layer.borderWidth = 1;
        _anotherInfoLab.layer.cornerRadius = AUTO(14);
        _anotherInfoLab.layer.masksToBounds= YES;
    }
    return _anotherInfoLab;
}

- (JCJingCaiBtn *)masterWin_anotherBtn {
    if (!_masterWin_anotherBtn) {
        _masterWin_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _masterWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _masterWin_anotherBtn.layer.borderWidth = 1;
        _masterWin_anotherBtn.layer.cornerRadius = AUTO(14);
        _masterWin_anotherBtn.layer.masksToBounds= YES;
         [_masterWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//         [_masterWin_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_masterWin_anotherBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_masterWin_anotherBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
//        [_masterWin_anotherBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
        _masterWin_anotherBtn.isRQ = YES;
        _masterWin_anotherBtn.spf = @"4";
    }
    return _masterWin_anotherBtn;
}

- (JCJingCaiBtn *)equal_anotherBtn {
    if (!_equal_anotherBtn) {
        _equal_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _equal_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _equal_anotherBtn.layer.borderWidth = 1;
        _equal_anotherBtn.layer.cornerRadius = AUTO(14);
        _equal_anotherBtn.layer.masksToBounds= YES;
        [_equal_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//          [_equal_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_equal_anotherBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_equal_anotherBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
//        [_equal_anotherBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
         _equal_anotherBtn.isRQ = YES;
        _equal_anotherBtn.spf = @"5";
    }
    return _equal_anotherBtn;
}

- (JCJingCaiBtn *)customerWin_anotherBtn {
    if (!_customerWin_anotherBtn) {
        _customerWin_anotherBtn = [JCJingCaiBtn initWithText:@"" FontSize:AUTO(12) BackGroundColor:JCWhiteColor TextColor:COLOR_333333];
        _customerWin_anotherBtn.layer.borderColor = COLOR_E4E4E4.CGColor;
        _customerWin_anotherBtn.layer.borderWidth = 1;
        _customerWin_anotherBtn.layer.cornerRadius = AUTO(14);
        _customerWin_anotherBtn.layer.masksToBounds= YES;
        [_customerWin_anotherBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
//        [_customerWin_anotherBtn setTitleColor:JCWhiteColor forState:UIControlStateSelected];
        [_customerWin_anotherBtn setImageEdgeInsets:UIEdgeInsetsMake(0, AUTO(-5), 0, 0)];
//        [_customerWin_anotherBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
//        [_customerWin_anotherBtn setImage:JCIMAGE(@"yuce_select_selected") forState:UIControlStateSelected];
         _customerWin_anotherBtn.isRQ = YES;
        _customerWin_anotherBtn.spf = @"6";
    }
    return _customerWin_anotherBtn;
}

//-  (UIImageView *)danImgView {
//    if (!_danImgView) {
//        _danImgView = [UIImageView new];
//        _danImgView.image = JCIMAGE(@"bg_danguan");
//    }
//    return _danImgView;
//}
//
//-  (UIImageView *)dan_anotherImgView {
//    if (!_dan_anotherImgView) {
//        _dan_anotherImgView = [UIImageView new];
//        _dan_anotherImgView.image = JCIMAGE(@"bg_danguan");
//    }
//    return _dan_anotherImgView;
//}

- (UIView *)masterView {
    if (!_masterView) {
        _masterView = [UIView new];
        _masterView.backgroundColor = JCClearColor;
//        _masterView.backgroundColor = [UIColor redColor];
    }
    return _masterView;
}

- (UIView *)anotherView {
    if (!_anotherView) {
        _anotherView = [UIView new];
        _anotherView.backgroundColor = JCClearColor;
//        _anotherView.backgroundColor = [UIColor yellowColor];
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
