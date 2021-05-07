//
//  JCHongbangDetailTopView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/2.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDetailTopView.h"
#import "JCWDateTool.h"
#import "JCHongbangWMstckyVC.h"
@implementation JCHongbangDetailTopView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    self.backgroundColor = COLOR_F0F0F0;
    UIImageView *backImgView = [UIImageView new];
    backImgView.image = JCIMAGE(@"autherBg_hb");
    [self addSubview:backImgView];
    [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.backImgView = backImgView;
    
    
    
    self.bgView = [UIView new];
//    self.bgView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self);
        make.top.offset(NavigationStatusBarHeight);
    }];
    
    self.userView = [UIView new];
    [self.bgView addSubview:self.userView];
    [self.userView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.bgView);
        make.height.mas_equalTo(AUTO(85));
    }];
    
    
    
    [self.userView addSubview:self.headImgbgView];
    [self.headImgbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.width.height.mas_equalTo(AUTO(50));
    }];
    
    [self.headImgbgView addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(1, 1, 1, 1));
    }];
    
    [self.userView addSubview:self.qyImgView];
    [self.qyImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.headImgView);
        make.bottom.equalTo(self.headImgView).offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(35), AUTO(14)));
    }];
    
    [self.userView addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.top.equalTo(self.headImgView).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    [self.userView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(8));
        
    }];


    [self.userView addSubview:self.concernBtn];
    [self.concernBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.headImgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(30)));
    }];
    
    self.infoView = [UIView new];
    self.infoView.backgroundColor = JCWhiteColor;
    [self.infoView hg_setCornerOnTopWithRadius:AUTO(5)];
    [self.bgView addSubview:self.infoView];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self.bgView);
        make.top.equalTo(self.userView.mas_bottom);
        make.bottom.offset(0);
    }];
    
    [self.infoView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(12));
        make.right.offset(AUTO(-15));
    }];
    
    [self.infoView addSubview:self.refundLab];
     [self.refundLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.offset(AUTO(15));
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
         make.height.mas_equalTo(AUTO(16));
     }];
    
    [self.infoView addSubview:self.infoLab];
     [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.refundLab.mas_right).offset(AUTO(5));
         make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
         make.height.mas_equalTo(AUTO(16));
     }];
    
    [self.infoView addSubview:self.typeLab];
     [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.centerY.equalTo(self.infoLab);
         make.right.offset(AUTO(-15));
         make.height.mas_equalTo(AUTO(16));
     }];
    
    [self.infoView addSubview:self.orderDetailView];
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
    
    [self addSubview:self.resImageView];
    [self.resImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLab);
        make.right.offset(AUTO(-15));
        make.width.height.mas_equalTo(60);
    }];

    UIView *bottomView = [UIView new];
    bottomView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:bottomView];
    [bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.offset(0);
        make.height.mas_equalTo(1);
    }];
    
    WeakSelf;
    [self.concernBtn bk_whenTapped:^{
//        [self presen]
        if (![JCWUserBall currentUser]) {
            JCBaseViewController *vc = (JCBaseViewController *)[weakSelf getViewController];
            [vc presentLogin];
            return;
        }
        [[weakSelf getViewController].view showLoading];
        JCHomeService_New * service = [JCHomeService_New service];
        [service gzUserWithId:weakSelf.tjInfoDetailBall.user_id type:@"1" success:^(id  _Nullable object) {
            [[weakSelf getViewController].view endLoading];
            if ([JCWJsonTool isSuccessResponse:object]) {
                //1是未关注.2是已关注
                NSString *status = [NSString stringWithFormat:@"%@",object[@"data"][@"status"]];
                weakSelf.tjInfoDetailBall.is_subscribe = [status integerValue]==2?@"已关注":@"关注";
                weakSelf.tjInfoDetailBall.fensi = object[@"data"][@"fensi"];
//                [self configFensiCountWithModel:self.expertDetailModel];
                [weakSelf concernStatusWithModel:weakSelf.tjInfoDetailBall];
                weakSelf.tagLab.text = [NSString stringWithFormat:@"%@粉丝 | %@方案",weakSelf.tjInfoDetailBall.fensi,weakSelf.tjInfoDetailBall.plan_num];

            }
        } failure:^(NSError * _Nonnull error) {
            [[weakSelf getViewController].view endLoading];
        }];

    }];

    [self.orderDetailView bk_whenTapped:^{
        if (weakSelf.JCOrderDetailBlock) {
            weakSelf.JCOrderDetailBlock();
        }
    }];
    
    [self.headImgView bk_whenTapped:^{
        if (!weakSelf.tjInfoDetailBall) {
            return;
        }
        for (UIViewController *vc in [weakSelf getViewController].navigationController.viewControllers) {
            if ([vc isKindOfClass:[JCHongbangWMstckyVC class]]) {
                [[weakSelf getViewController].navigationController popToViewController:vc animated:YES];;
                return;
            }
        }
        JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
        vc.autherID = weakSelf.tjInfoDetailBall.user_id;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        if (weakSelf.JCPushBlock) {
            weakSelf.JCPushBlock();
        }
        
    }];


}

- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
    _tjInfoDetailBall = tjInfoDetailBall;
    
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:tjInfoDetailBall.user_img] placeholderImage:JCIMAGE(@"ic_hb_default")];
    self.nameLab.text = tjInfoDetailBall.user_name;
    self.qyImgView.hidden = NO;
//     self.daiHongLab.text = [NSString stringWithFormat:@"%@带红",expertDetailModel.daihong];

    [self concernStatusWithDetailModel:tjInfoDetailBall];
    self.tagLab.text = [NSString stringWithFormat:@"%@粉丝 | %@方案",tjInfoDetailBall.fensi,tjInfoDetailBall.plan_num];
    
    self.titleLab.text = tjInfoDetailBall.title;
    self.infoLab.text = [NSString stringWithFormat:@"%@发布· %@人浏览",tjInfoDetailBall.created_at,tjInfoDetailBall.click];
    if ([tjInfoDetailBall.click integerValue]==0) {
        self.infoLab.text = [NSString stringWithFormat:@"%@发布",tjInfoDetailBall.created_at];
    }
    if (tjInfoDetailBall.refund.length>0) {
        self.refundLab.text = [NSString stringWithFormat:@"  %@  ",tjInfoDetailBall.refund];
        [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.refundLab.mas_right).offset(AUTO(8));
        }];
    }else{
        [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.refundLab.mas_left);
        }];
        self.refundLab.text = @"";
    }
    self.orderDetailView.hidden = tjInfoDetailBall.order_id.length>0?NO:YES;
    
    self.typeLab.text = [NSString stringWithFormat:@"  %@  ",tjInfoDetailBall.classfly_desc];
//    self.typeLab.text = @"43";
    
    if (tjInfoDetailBall.classfly==2) {
        self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_002868.CGColor;
        self.typeLab.textColor = COLOR_002868;
    }else if(tjInfoDetailBall.classfly==3){
        self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.typeLab.textColor = COLOR_30B27A;
    }else{
        self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = JCBaseColor.CGColor;
        self.typeLab.textColor = JCBaseColor;
    }
    
    self.resImageView.hidden = !self.showResult;
    if (self.showResult) {
        if (self.tjInfoDetailBall.isResultWin) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hong"];
            return ;
        }
        if (self.tjInfoDetailBall.isResultLose) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_hei"];
            return ;
        }
        if (self.tjInfoDetailBall.isResultWater) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_zou"];
            return ;
        }
        if (self.tjInfoDetailBall.isYanqi) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_yq"];
            return ;
        }
        if (self.tjInfoDetailBall.isQuXiao) {
            self.resImageView.hidden = NO;
            self.resImageView.image = [UIImage imageNamed:@"tuijian_detail_qx"];
            return ;
        }
    }
    

}
- (void)concernStatusWithDetailModel:(JCWTjInfoDetailBall *)detailModel{

    
    if ([detailModel.is_subscribe isEqualToString:@"关注"]||[detailModel.is_subscribe isEqualToString:@"0"]) {
        //未关注
        self.isAdd = YES;
        self.concernBtn.backgroundColor = JCWhiteColor;
        [self.concernBtn setTitleColor:JCBaseColor forState:0];
        
        [self.concernBtn setTitle:@"+关注" forState:0];
        self.concernBtn.layer.borderColor = JCClearColor.CGColor;
    }
    else if ([detailModel.is_subscribe isEqualToString:@"已关注"]||[detailModel.is_subscribe isEqualToString:@"1"]){
        //已关注
        self.concernBtn.backgroundColor = JCClearColor;
        [self.concernBtn setTitleColor:JCWhiteColor forState:0];
        [self.concernBtn setTitle:@"已关注" forState:0];
        self.concernBtn.layer.borderColor = JCWhiteColor.CGColor;
         self.isAdd = NO;
    }
    

}


- (void)concernStatusWithModel:(JCWTjInfoDetailBall *)expertDetailModel{

    
    if ([expertDetailModel.is_subscribe isEqualToString:@"关注"]||[expertDetailModel.is_subscribe isEqualToString:@"0"]) {
        //未关注
        self.isAdd = YES;
        self.concernBtn.backgroundColor = JCWhiteColor;
        [self.concernBtn setTitleColor:JCBaseColor forState:0];
        
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



- (CGSize)returnTextWidth:(NSString *)text size:(CGSize)size font:(UIFont *)font{
    CGSize textSize = [text boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName : font} context:nil].size;
    return textSize;
}


- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.layer.cornerRadius = AUTO(24);
        _headImgView.layer.masksToBounds = YES;
        _headImgView.userInteractionEnabled = YES;
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
        _headImgbgView.userInteractionEnabled = YES;

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
        _tagLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
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
    }
    return _concernBtn;
}

- (UILabel *)daiHongLab {
    if (!_daiHongLab) {
        _daiHongLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _daiHongLab;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 2;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)refundLab {
    if (!_refundLab) {
        _refundLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _refundLab.layer.cornerRadius = AUTO(8);
        _refundLab.layer.masksToBounds = YES;
        _refundLab.layer.borderWidth = 0.5;
        _refundLab.layer.borderColor = JCBaseColor.CGColor;
    }
    return _refundLab;
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

- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:[JCBaseColor colorWithAlphaComponent:0.1] andTextAlignment:0];
        _typeLab.layer.borderWidth = 0.5;
        _typeLab.layer.cornerRadius = AUTO(8);
        _typeLab.layer.masksToBounds = YES;
    }
    return _typeLab;
}

- (UIImageView *)resImageView {
    if (!_resImageView) {
        _resImageView = [UIImageView new];
        _resImageView.hidden = YES;
    }
    return _resImageView;
}
-(UIImageView *)qyImgView {
    if (!_qyImgView) {
        _qyImgView = [UIImageView new];
        _qyImgView.image = JCIMAGE(@"ic_qy");
        _qyImgView.hidden  = YES;
    }
    return _qyImgView;
}

@end
