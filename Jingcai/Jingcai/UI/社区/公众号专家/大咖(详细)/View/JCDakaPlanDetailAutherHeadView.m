//
//  JCDakaPlanDetailAutherHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/11.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCDakaPlanDetailAutherHeadView.h"
#import "JCFootBallAuthorDetailWMViewController.h"
@implementation JCDakaPlanDetailAutherHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    UIImageView *backImgView = [UIImageView new];
    backImgView.image = JCIMAGE(@"autherBg_gzh");
    backImgView.userInteractionEnabled = YES;
    [self addSubview:backImgView];
    [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.backImgView = backImgView;
    
    
    
    self.bgView = [UIView new];
//    self.bgView.backgroundColor = JCBaseColor;
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.offset(NavigationStatusBarHeight);
        make.height.mas_equalTo(AUTO(90));
    }];
    
    
    [self.bgView addSubview:self.headImgbgView];
    [self.headImgbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.bgView);
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
    [self.headImgbgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(1, 1, 1, 1));
    }];
    
    [self.bgView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.top.equalTo(self.headImgView).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.bgView addSubview:self.daiHongLab];
    [self.daiHongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(8));
        
    }];
    
    [self.bgView addSubview:self.clickInfoView];
    [self.clickInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.equalTo(self.headImgView);
        make.right.equalTo(self.nameLab);
    }];

    [self.bgView addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.headImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(30)));
    }];
    
    [self.bgView addSubview:self.erCodeBtn];
    [self.erCodeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.concernBtn.mas_left).offset(AUTO(-8));
        make.centerY.equalTo(self.concernBtn);
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
    }];
    
    
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = JCWhiteColor;
    [self addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.top.equalTo(self.bgView.mas_bottom);
        make.left.right.bottom.equalTo(self);
    }];
    self.infoView = bgView;

    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(AUTO(5));
    }];
    
    [bgView addSubview:self.ysLab];
     [self.ysLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.offset(AUTO(15));
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
         make.height.mas_equalTo(AUTO(16));
         make.bottom.offset(-AUTO(15));
     }];

    [bgView addSubview:self.refundLab];
     [self.refundLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.ysLab.mas_right).offset(AUTO(8));
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
         make.height.mas_equalTo(AUTO(16));
         make.bottom.offset(-AUTO(15));
     }];

    [bgView addSubview:self.infoLab];
     [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
         make.centerY.equalTo(self.refundLab);
     }];

    [bgView addSubview:self.orderDetailView];
    [self.orderDetailView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.infoLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(25)));
    }];



    [self.orderDetailView addSubview:self.indicateImgView];
    [self.indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.orderDetailView);
        make.size.mas_equalTo(CGSizeMake(AUTO(5), AUTO(10)));
    }];

    [self.orderDetailView addSubview:self.orderDetailLab];
    [self.orderDetailLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.indicateImgView.mas_left).offset(-3);
        make.centerY.equalTo(self.orderDetailView);
    }];

    WeakSelf;
    [self.orderDetailView bk_whenTapped:^{
        if (weakSelf.JCOrderDetailBlock) {
            weakSelf.JCOrderDetailBlock();
        }
    }];
//
    [self.concernBtn bk_whenTapped:^{
//        [self presen]
        if (![JCWUserBall currentUser]) {
            JCBaseViewController *vc = (JCBaseViewController *)[weakSelf getViewController];
            [vc presentLogin];
            return;
        }

            [[weakSelf getViewController].view showLoading];
            JCHomeService_New * service = [JCHomeService_New service];
            [service gzUserWithId:weakSelf.infoModel.user_id type:@"2" success:^(id  _Nullable object) {
                [[weakSelf getViewController].view endLoading];
                if ([JCWJsonTool isSuccessResponse:object]) {
                    //1是未关注.2是已关注
                    NSString *status = [NSString stringWithFormat:@"%@",object[@"data"][@"status"]];
                    weakSelf.infoModel.is_subscribe = [status integerValue]==2?@"已关注":@"关注";
                    weakSelf.infoModel.fensi = object[@"data"][@"fensi"];
//                    [self configFensiCountWithModel:self.expertDetailModel];
                    [weakSelf concernStatusWithModel:weakSelf.infoModel];
                    weakSelf.daiHongLab.text = [NSString stringWithFormat:@"%@粉丝 | %@方案",weakSelf.infoModel.fensi,weakSelf.infoModel.plan_num];

                }
            } failure:^(NSError * _Nonnull error) {
                [[weakSelf getViewController].view endLoading];
            }];
    }];

    
    [self.erCodeBtn bk_whenTapped:^{
        
        weakSelf.codeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        weakSelf.codeView.infoModel = weakSelf.infoModel;
        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.codeView];
    }];
    
    [self.clickInfoView bk_whenTapped:^{
        for (UIViewController *vc in [weakSelf getViewController].navigationController.viewControllers) {
            if ([vc isKindOfClass:[JCFootBallAuthorDetailWMViewController class]]) {
                [[weakSelf getViewController].navigationController popToViewController:vc animated:YES];;
                return;
            }
        }
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        vc.autherID = weakSelf.infoModel.user_id;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        if (weakSelf.JCPushBlock) {
            weakSelf.JCPushBlock();
        }

        
        
    }];

}

- (void)setInfoModel:(JCWTjInfoBall *)infoModel {
    _infoModel = infoModel;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:infoModel.user_img] placeholderImage:JCIMAGE(@"ic_gzh_default")];
    self.nameLab.text = infoModel.user_name;
     self.daiHongLab.text = [NSString stringWithFormat:@"%@粉丝 | %@方案",infoModel.fensi,infoModel.plan_num];
    self.tagLab.text = [NSString stringWithFormat:@"  %@  ",infoModel.zhong];
    self.erCodeBtn.hidden = infoModel.qr_code.length>0?NO:YES;
//    [self configFensiCountWithModel:infoModel];
    

    [self concernStatusWithModel:infoModel];
    
    
//    self.titleLab.text = infoModel.title;
    NSString *title = [NSString stringWithFormat:@"%@",infoModel.title];
        if ([infoModel.bill_id intValue]>0) {
            title = [NSString stringWithFormat:@"(补)%@",infoModel.title];
        }

        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:title];
        NSRange range = [title rangeOfString:@"(补)"];
        if (range.location!=NSNotFound) {
            [attrTitle addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
        }

         self.titleLab.attributedText = attrTitle;
    
    
    
    self.infoLab.text = [NSString stringWithFormat:@"%@发布  %@人浏览",infoModel.created_at,infoModel.click];
    if ([infoModel.click integerValue]==0) {
        self.infoLab.text = [NSString stringWithFormat:@"%@发布",infoModel.created_at];
    }
    BOOL isRefund = NO;//不中返还
    BOOL isBudan = NO;//不中补单
    BOOL isYushow = NO;//预售
    
    if ([infoModel.refund integerValue]==1) {
        isRefund = YES;
    }
    if ([infoModel.refund integerValue]==2) {
        isBudan = YES;
    }
    isYushow = [infoModel.pre_sale integerValue]==1?YES:NO;
    
    NSMutableArray *view_array = [NSMutableArray array];
    if (isYushow) {
        [view_array addObject:self.ysLab];
    }
    if (isRefund||isBudan) {
        [view_array addObject:self.ysLab];
    }

    if (view_array.count==2) {
        self.ysLab.text =  [NSString stringWithFormat:@"  预售  "];
        if (isRefund) {
            self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中返还"];
            self.refundLab.textColor = JCBaseColor;          self.refundLab.layer.borderColor = JCBaseColor.CGColor;
            self.refundLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        }
        if (isBudan) {
            self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中补单"];
            self.refundLab.textColor = COLOR_F37E22;
            self.refundLab.layer.borderColor = COLOR_F37E22.CGColor;
            self.refundLab.backgroundColor = [COLOR_F37E22 colorWithAlphaComponent:0.1];
        }

         [self.ysLab mas_updateConstraints:^(MASConstraintMaker *make) {
             make.left.offset(AUTO(15));
         }];

         [self.refundLab mas_updateConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(self.ysLab.mas_right).offset(AUTO(8));

         }];

         [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
             make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
             make.centerY.equalTo(self.refundLab);
         }];
    }
    if (view_array.count==1) {
        if (isYushow) {
            [self.infoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.ysLab.mas_right).offset(AUTO(8));
                make.centerY.equalTo(self.ysLab);
            }];
            
            self.ysLab.text = [NSString stringWithFormat:@"  预售  "];
        }else{
            [self.refundLab mas_remakeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.titleLab);
                make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(5));
                make.height.mas_equalTo(AUTO(16));
                make.bottom.offset(-AUTO(15));
            }];
            
            if (isRefund) {
                self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中返还"];
                self.refundLab.textColor = JCBaseColor;          self.refundLab.layer.borderColor = JCBaseColor.CGColor;
                self.refundLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
            }
            if (isBudan) {
                self.refundLab.text = [NSString stringWithFormat:@"  %@  ",@"不中补单"];
                self.refundLab.textColor = COLOR_F37E22;
                self.refundLab.layer.borderColor = COLOR_F37E22.CGColor;
                self.refundLab.backgroundColor = [COLOR_F37E22 colorWithAlphaComponent:0.1];
            }
        }
    }
    if (view_array.count==0) {
        [self.infoLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.titleLab);
            make.centerY.equalTo(self.ysLab);
        }];
        self.ysLab.text = @"";
    }
    
//    if (infoModel.refund.length>0) {
//        self.ysLab.text = @"  预售  ";
//        self.refundLab.text = [NSString stringWithFormat:@"  %@  ",infoModel.refund];
//        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
//        }];
//    }else{
//        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.left.equalTo(self.refundLab.mas_left);
//        }];
//        self.refundLab.text = @"";
//    }
    self.orderDetailView.hidden = infoModel.order_id.length>0?NO:YES;

}

- (void)concernStatusWithModel:(JCWTjInfoBall *)expertDetailModel{
    self.concernBtn.hidden = self.isMine;
    
    if ([expertDetailModel.is_subscribe isEqualToString:@"关注"]||[expertDetailModel.is_subscribe isEqualToString:@"0"]) {
        //未关注
        self.isAdd = YES;
        self.concernBtn.backgroundColor = JCBaseColor;
        [self.concernBtn setTitleColor:JCWhiteColor forState:0];
        
        [self.concernBtn setTitle:@"+关注" forState:0];
        self.concernBtn.layer.borderColor = JCClearColor.CGColor;
    }
    else if ([expertDetailModel.is_subscribe isEqualToString:@"已关注"]||[expertDetailModel.is_subscribe isEqualToString:@"1"]){
        //已关注
        self.concernBtn.backgroundColor = JCClearColor;
        [self.concernBtn setTitleColor:JCWhiteColor forState:0];
        [self.concernBtn setTitle:@"已关注" forState:0];
        
        self.concernBtn.layer.borderColor = JCWhiteColor.CGColor;
         self.isAdd = NO;
    }

}




- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.layer.cornerRadius = AUTO(24);
        _headImgView.layer.masksToBounds = YES;
    }
    return _headImgView;
}

-(UIView *)headImgbgView {
    if (!_headImgbgView) {
        _headImgbgView = [UIView new];
//        _headImgbgView.backgroundColor = [UIColor greenColor];
        _headImgbgView.layer.borderColor = COLOR_A9A9A9.CGColor;
        _headImgbgView.layer.cornerRadius = AUTO(25);
        _headImgbgView.layer.borderWidth = AUTO(1);

    }
    return _headImgbgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}

- (UILabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.layer.cornerRadius = AUTO(8);
        _tagLab.layer.masksToBounds = YES;
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.borderColor = COLOR_DADADA.CGColor;
    }
    return _tagLab;
}






- (UIButton *)concernBtn {
    if (!_concernBtn) {
        _concernBtn = [UIButton initWithText:@"" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        _concernBtn.layer.masksToBounds = YES;
        _concernBtn.layer.cornerRadius = AUTO(15);
        _concernBtn.layer.borderColor = JCClearColor.CGColor;
        _concernBtn.layer.borderWidth = 0.5;
        _concernBtn.userInteractionEnabled = YES;
    }
    return _concernBtn;
}

- (UILabel *)daiHongLab {
    if (!_daiHongLab) {
        _daiHongLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _daiHongLab;
}

- (UIButton *)erCodeBtn {
    if (!_erCodeBtn) {
        _erCodeBtn = [UIButton new];
        [_erCodeBtn setImage:JCIMAGE(@"ercode_expert") forState:0];
        [_erCodeBtn setImage:JCIMAGE(@"ercode_expert") forState:UIControlStateHighlighted];
        _erCodeBtn.hidden = YES;
    }
    return _erCodeBtn;
}

- (JCFootBall_GZH_AuthorErCodeView *)codeView {
    if (!_codeView) {
        _codeView = [JCFootBall_GZH_AuthorErCodeView new];
    }
    return _codeView;
}

-(UIView *)clickInfoView {
    if (!_clickInfoView) {
        _clickInfoView = [UIView new];
    }
    return _clickInfoView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 9;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
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

- (UILabel *)ysLab {
    if (!_ysLab) {
        _ysLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_812BF1 andBackgroundColor:[COLOR_812BF1 colorWithAlphaComponent:0.1] andTextAlignment:0];
        _ysLab.layer.cornerRadius = AUTO(8);
        _ysLab.layer.masksToBounds = YES;
        _ysLab.layer.borderWidth = 0.5;
        _ysLab.layer.borderColor = COLOR_812BF1.CGColor;
    }
    return _ysLab;
}


- (UIView *)orderDetailView {
    if (!_orderDetailView) {
        _orderDetailView = [UIView new];
        _orderDetailView.hidden = YES;
    }
    return _orderDetailView;
}

- (UILabel *)orderDetailLab {
    if (!_orderDetailLab) {
        _orderDetailLab = [UILabel initWithTitle:@"订单详情" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _orderDetailLab;
}

- (UIImageView *)indicateImgView {
    if (!_indicateImgView) {
        _indicateImgView = [UIImageView new];
        _indicateImgView.image = JCIMAGE(@"common_arrow_right");
    }
    return _indicateImgView;
}


@end
