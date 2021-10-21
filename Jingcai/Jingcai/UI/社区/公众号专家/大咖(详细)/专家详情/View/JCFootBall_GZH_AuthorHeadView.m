//
//  JCFootBall_GZH_AuthorHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFootBall_GZH_AuthorHeadView.h"
#import "JCFootBallAuthorDetailWMViewController.h"
@implementation JCFootBall_GZH_AuthorHeadView

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
    [self addSubview:backImgView];
    [backImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.backImgView = backImgView;
    
    
    
    self.bgView = [UIView new];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.top.offset(NavigationStatusBarHeight);
        make.height.mas_equalTo(AUTO(1000));
    }];
    
    
    [self.bgView addSubview:self.headImgbgView];
    [self.headImgbgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(0);
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
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.bgView addSubview:self.tagLab];
    [self.tagLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
        make.top.equalTo(self.nameLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(14));
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
    
    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.headImgView.mas_bottom).offset(AUTO(15));
    }];
    
    [self.bgView addSubview:self.daiHongLab];
    [self.daiHongLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(10));
    }];
    
    WeakSelf;
    [self.clickInfoView bk_whenTapped:^{
        for (UIViewController *vc in [weakSelf getViewController].navigationController.viewControllers) {
            if ([vc isKindOfClass:[JCFootBallAuthorDetailWMViewController class]]) {
                [[weakSelf getViewController].navigationController popToViewController:vc animated:YES];;
                return;
            }
        }
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        vc.autherID = weakSelf.expertDetailModel.user_id;
        [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        
    }];
    

    [self.concernBtn bk_whenTapped:^{
//        [self presen]
        if (![JCWUserBall currentUser]) {
            JCBaseViewController *vc = (JCBaseViewController *)[weakSelf getViewController];
            [vc presentLogin];
            return;
        }

            [[weakSelf getViewController].view showLoading];
            JCHomeService_New * service = [JCHomeService_New service];
            [service gzUserWithId:weakSelf.expertDetailModel.user_id type:@"2" success:^(id  _Nullable object) {
                [[weakSelf getViewController].view endLoading];
                if ([JCWJsonTool isSuccessResponse:object]) {
                    //1是未关注.2是已关注
                    NSString *status = [NSString stringWithFormat:@"%@",object[@"data"][@"status"]];
                    weakSelf.expertDetailModel.is_subscribe = [status integerValue]==2?@"已关注":@"关注";
                    weakSelf.expertDetailModel.fensi = object[@"data"][@"fensi"];
                    [weakSelf configFensiCountWithModel:weakSelf.expertDetailModel];
                    [weakSelf concernStatusWithModel:weakSelf.expertDetailModel];
                    weakSelf.daiHongLab.text = [NSString stringWithFormat:@"%@粉丝 | %@方案",weakSelf.expertDetailModel.fensi,weakSelf.expertDetailModel.plan_num];

                }
            } failure:^(NSError * _Nonnull error) {
                [[weakSelf getViewController].view endLoading];
            }];
    }];

    
    [self.erCodeBtn bk_whenTapped:^{
        
        weakSelf.codeView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
        weakSelf.codeView.expertDetailModel = weakSelf.expertDetailModel;
        [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.codeView];
    }];

}

- (void)setExpertDetailModel:(JCWExpertBall *)expertDetailModel {
    if (!expertDetailModel) {
        return;
    }
    _expertDetailModel = expertDetailModel;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:expertDetailModel.user_img] placeholderImage:JCIMAGE(@"ic_gzh _default")];
    self.nameLab.text = expertDetailModel.user_name;

    self.infoLab.text = expertDetailModel.desc;
     self.daiHongLab.text = [NSString stringWithFormat:@"%@粉丝 | %@方案",expertDetailModel.fensi,expertDetailModel.plan_num];
    self.erCodeBtn.hidden = expertDetailModel.qr_code.length>0?NO:YES;
    
    
    
    
    
    
    [self configFensiCountWithModel:expertDetailModel];//专家标签
    

    [self concernStatusWithModel:expertDetailModel];//关注状态
    
 
    [self addSeeMoreButtonInLabel:self.infoLab];



    if (self.ShowAllBlock) {
          CGSize size =   [self returnTextWidth:expertDetailModel.desc size:CGSizeMake(SCREEN_WIDTH-AUTO(30), AUTO(200)) font:[UIFont systemFontOfSize:12]];
        if (self.expertDetailModel.daihong.length>0) {
            self.ShowAllBlock(size.height+AUTO(25));
        }else{
            self.ShowAllBlock(size.height+AUTO(10));
        }
    }


}
- (void)concernStatusWithModel:(JCWExpertBall *)expertDetailModel{
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


//专家标签
- (void)configFensiCountWithModel:(JCWExpertBall *)expertDetailModel {
    self.tagLab.text = [NSString stringWithFormat:@"%@",expertDetailModel.zhong];
    self.tagLab.hidden = expertDetailModel.zhong.length==0?YES:NO;
    if (expertDetailModel.zhong.length>0) {
        [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
            make.top.equalTo(self.headImgView).offset(AUTO(5));
            make.height.mas_equalTo(AUTO(20));
        }];

    }else{
        [self.nameLab mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.headImgView.mas_right).offset(AUTO(8));
            make.centerY.equalTo(self.headImgView);
            make.height.mas_equalTo(AUTO(20));
        }];

    }
}



- (void)addSeeMoreButtonInLabel:(YYLabel *)label {
    if (!self.expertDetailModel.desc) {
        self.expertDetailModel.desc = @"";
    }
    UIFont *font16 = [UIFont systemFontOfSize:12];
    NSMutableParagraphStyle * paraStyle = [[NSMutableParagraphStyle alloc] init];
      [paraStyle setLineSpacing:5];
    label.attributedText = [[NSAttributedString alloc] initWithString:self.expertDetailModel.desc attributes:@{NSFontAttributeName : font16,NSForegroundColorAttributeName : COLOR_A7A7A7,NSParagraphStyleAttributeName:paraStyle}];

    
    NSString *moreString = @" 查看更多";
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@", moreString]];

    NSRange expandRange = [text.string rangeOfString:moreString];
    [text addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:expandRange];

    
    //添加点击事件
    YYTextHighlight *hi = [YYTextHighlight new];
    [text setTextHighlight:hi range:[text.string rangeOfString:moreString]];
    
    __weak typeof(self) weakSelf = self;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //点击展开
       
        [weakSelf setLabelFrame:YES];
        if (weakSelf.ShowAllBlock) {
            if (weakSelf.expertDetailModel.daihong.length>0) {
                weakSelf.ShowAllBlock(weakSelf.infoLab.size.height+AUTO(10));
            }else{
                weakSelf.ShowAllBlock(weakSelf.infoLab.size.height+AUTO(1));
            }
            
        }

    };
    
    text.font = font16;
    
    YYLabel *seeMore = [YYLabel new];
    seeMore.attributedText = text;
    [seeMore sizeToFit];
    
    NSAttributedString *truncationToken = [NSAttributedString attachmentStringWithContent:seeMore contentMode:UIViewContentModeCenter attachmentSize:seeMore.frame.size alignToFont:text.font alignment:YYTextVerticalAlignmentBottom];
    
    label.truncationToken = truncationToken;
}

- (NSAttributedString *)appendAttriStringWithFont:(UIFont *)font {
    if (!font) {
        font = [UIFont systemFontOfSize:12];
    }
    

    NSString *appendText = @" 收起";
    NSMutableAttributedString *append = [[NSMutableAttributedString alloc] initWithString:appendText attributes:@{NSFontAttributeName : font, NSForegroundColorAttributeName : COLOR_A7A7A7}];
    
    YYTextHighlight *hi = [YYTextHighlight new];
    [append setTextHighlight:hi range:[append.string rangeOfString:appendText]];
    
    __weak typeof(self) weakSelf = self;
    hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        //点击收起
        [weakSelf setLabelFrame:NO];
        NSLog(@"%.0f",containerView.size.height);
        if (weakSelf.ShowAllBlock) {
            if (weakSelf.expertDetailModel.daihong.length>0) {
                weakSelf.ShowAllBlock(weakSelf.infoLab.size.height+AUTO(1));
            }else{
                weakSelf.ShowAllBlock(weakSelf.infoLab.size.height+1);
            }

        }
    };
    
    return append;
}

- (void)expandString {
    NSMutableAttributedString *attri = [self.infoLab.attributedText mutableCopy];
    [attri appendAttributedString:[self appendAttriStringWithFont:attri.font]];
    self.infoLab.attributedText = attri;
}

- (void)packUpString {
    NSString *appendText = @" 收起";
    NSMutableAttributedString *attri = [self.infoLab.attributedText mutableCopy];
    NSRange range = [attri.string rangeOfString:appendText options:NSBackwardsSearch];

    if (range.location != NSNotFound) {
        [attri deleteCharactersInRange:range];
    }

    self.infoLab.attributedText = attri;
}


- (void)setLabelFrame:(BOOL)isExpand {
    if (isExpand) {
        [self expandString];
        self.infoLab.numberOfLines = 0;
        [self layoutIfNeeded];
        NSLog(@"%.0f",self.infoLab.height);
    } else {
        [self packUpString];
        self.infoLab.numberOfLines = 3;
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

- (KKPaddingLabel *)tagLab {
    if (!_tagLab) {
        _tagLab = [KKPaddingLabel initWithTitle:@"" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_DADADA andBackgroundColor:JCClearColor andTextAlignment:0];
        _tagLab.layer.cornerRadius = AUTO(7);
        _tagLab.layer.masksToBounds = YES;
        _tagLab.layer.borderWidth = 0.5;
        _tagLab.layer.borderColor = COLOR_DADADA.CGColor;
        _tagLab.padding = UIEdgeInsetsMake(0, 5, 0, 5);
        _tagLab.hidden = YES;
    }
    return _tagLab;
}




- (YYLabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [YYLabel new];
        _infoLab.textColor = COLOR_A9A9A9;
        _infoLab.preferredMaxLayoutWidth = SCREEN_WIDTH-AUTO(30);
        _infoLab.font = [UIFont systemFontOfSize:12];
        _infoLab.numberOfLines = 3;
    }
    return _infoLab;
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
@end
