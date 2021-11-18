//
//  JCJingCaiAIBigDataHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCJingCaiAIBigDataHeadView.h"
#import "JCAIHomeNoticeCollectionViewCell.h"
@implementation JCJingCaiAIBigDataHeadView

- (void)initViews {
    self.backgroundColor = COLOR_F4F6F9;
    
    self.bgView = [[UIImageView alloc] init];
    self.bgView.userInteractionEnabled = YES;
    self.bgView.image = JCIMAGE(@"bg_img_bigdata");
//    self.bgView.backgroundColor = JCWhiteColor;
//    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(208)+kNavigationBarHeight);
    [self addSubview:self.bgView];
    
    UIView *cornerView = [UIView new];
    cornerView.backgroundColor = COLOR_F4F6F9;
    [cornerView hg_setCornerOnTopWithRadius:12];
    [self.bgView addSubview:cornerView];
    [cornerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.bgView);
        make.height.mas_equalTo(AUTO(16));
    }];
    
    UIButton *backBtn = [UIButton new];
    [self.bgView addSubview:backBtn];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:0];
    [backBtn setImage:JCIMAGE(@"common_title_back_white_bold") forState:UIControlStateHighlighted];
    [backBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(5);
        make.top.offset(StatusBar_HEIGHT);
        make.width.height.mas_equalTo(44);
    }];
    
    
    UILabel *titleLab = [UILabel initWithTitle:@"鲸猜大数据服务" andFont:AUTO(16) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(backBtn.mas_right).offset(0);
        make.centerY.equalTo(backBtn);
    }];


    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(kNavigationBarHeight+AUTO(12));
        make.right.offset(AUTO(-115));
    }];
    

//    [self.bgView addSubview:self.countLab];
//    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.offset(-15);
//        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(20));
//        make.height.mas_equalTo(AUTO(20));
//    }];
//
//    [self.bgView addSubview:self.buyBgView];
//    [self.buyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.countLab.mas_left).offset(0);
//        make.width.mas_equalTo(120);
//        make.centerY.equalTo(self.countLab);
//        make.height.mas_equalTo(AUTO(30));
//    }];
//
//    [self.bgView addSubview:self.buyInfoView];
//    [self.buyInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(0);
//        make.centerY.equalTo(self.buyBgView).offset(-5);
//        make.height.mas_equalTo(AUTO(20));
//    }];
//
    [self.bgView addSubview:self.sureBgView];
    [self.sureBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(AUTO(-30));
        make.left.offset(15);
        make.right.offset(-15);
        make.height.mas_equalTo(AUTO(40));
    }];

    
    [self.sureBgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
    [self.sureBgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.bottom.offset(0);
        make.right.mas_equalTo(self.sureBgView.mas_centerX);
    }];
    
    [self.sureBgView addSubview:self.statusBtn];
    [self.statusBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.top.bottom.offset(0);
        make.left.mas_equalTo(self.sureBgView.mas_centerX);
    }];
    
    [self.bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.bottom.equalTo(self.sureBgView.mas_top).offset(AUTO(-25));
        make.height.mas_equalTo(AUTO(20));
    }];

    [self.bgView addSubview:self.buyBgView];
    [self.buyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.countLab.mas_left).offset(0);
        make.width.mas_equalTo(120);
        make.centerY.equalTo(self.countLab);
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.bgView addSubview:self.buyInfoView];
    [self.buyInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.buyBgView).offset(-5);
        make.height.mas_equalTo(AUTO(20));
    }];
    
    


    //放置轮播
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.bgView.mas_bottom).offset(0);
        make.height.mas_equalTo(AUTO(36));
    }];
    
    UIImageView *ycImgView = [UIImageView new];
    ycImgView.image = JCIMAGE(@"jc_bigdata_yc");
    [self.bottomView addSubview:ycImgView];
    [ycImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(27, 29));
    }];

    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DBDBDB;
    [self.bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ycImgView.mas_right).offset(10);
        make.centerY.equalTo(self.bottomView);
        make.size.mas_equalTo(CGSizeMake(0.5, 28));
    }];
    
    self.noticeCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(AUTO(60), 0, SCREEN_WIDTH-AUTO(40), AUTO(36)) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.noticeCycleScrollView.clipsToBounds = YES;
    self.noticeCycleScrollView.showPageControl = NO;
    self.noticeCycleScrollView.autoScrollTimeInterval = 3;
    self.noticeCycleScrollView.backgroundColor = JCClearColor;
    self.noticeCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.bottomView addSubview:self.noticeCycleScrollView];
    
    //大数据命中统计
    [self addSubview:self.mzInfovView];
    [self.mzInfovView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(28)*5+AUTO(80));
        make.left.right.offset(0);
    }];

    //日期标题
    UIView *timeTitleView = [UIView new];
    timeTitleView.backgroundColor = JCWhiteColor;
    [self addSubview:timeTitleView];
    [timeTitleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mzInfovView.mas_bottom).offset(AUTO(8));
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(44));
    }];
    
    UIView *redLine = [UIView new];
    redLine.backgroundColor = JCBaseColor;
    [timeTitleView addSubview:redLine];
    [redLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.bottom.offset(-8);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    UILabel *matchTimeLab = [UILabel initWithTitle:@"比赛列表" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_000000 andBackgroundColor:JCClearColor andTextAlignment:0];
    [timeTitleView addSubview:matchTimeLab];
    [matchTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(redLine.mas_right).offset(AUTO(10));
        make.centerY.equalTo(redLine);
    }];
    
    [self addSubview:self.dateHeadView];
    [self.dateHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.height.mas_equalTo(AUTO(72));
        make.top.equalTo(timeTitleView.mas_bottom);
    }];
    
    

    
//    self.titleLab.text = @"根据对阵双方的实力、状态、交战、战绩、指数等数据进行分析，给出各种玩法的概率。可包月，也可单场订阅（单场订阅可在比分-对应比赛的数据模块中进行购买）";

    
    WeakSelf;

    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCBuyClickBlock) {
            weakSelf.JCBuyClickBlock();
        }
    }];
    
    [backBtn bk_whenTapped:^{
        [[weakSelf getViewController].navigationController popViewControllerAnimated:YES];
    }];
    
    self.dateHeadView.JCTimeBlock = ^(NSString * _Nonnull time) {
        if (weakSelf.JCTimeBlock) {
            weakSelf.JCTimeBlock(time);
        }
        
    };

}



- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
//    [self.buyBgView removeAllSubviews];
//    self.buyInfoView.productModel = self.productModel;
//
//    if ([productModel.user_count integerValue]>0) {
//        NSString *buyCount = [NSString stringWithFormat:@"%@人购买",productModel.user_count];
//        self.countLab.text = buyCount;
//
//    }else{
//        self.countLab.text = @"";
//    }
//    if (productModel.distance_day.length>0&&[productModel.is_buy integerValue]==1) {
//        
//        NSString *endDay = [NSString stringWithFormat:@"当前到期时间 %@ 天",productModel.distance_day];
//        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:endDay];
//        NSRange range = [endDay rangeOfString:productModel.distance_day];
//        if (range.location!=NSNotFound) {
//            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
//            [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:16]} range:range];
//        }
//        self.timeLab.attributedText = attr;
//        
//        [self.timeLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(164);
//        }];
//        
//    }else{
//        self.timeLab.text = @"";
//        [self.timeLab mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.width.mas_equalTo(0);
//        }];
//    }
//    
//    if ([productModel.is_buy intValue]==1) {
//        [self.sureBtn setTitle:@"立即续费" forState:0];
//    }else{
//        [self.sureBtn setTitle:@"立即开通" forState:0];
//    }
////    {
////        [self.sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new") forState:0];
////        self.statusBtn.hidden = YES;
////        self.timeLab.hidden = YES;
////    }
//    self.statusBtn.hidden = YES;
//    self.timeLab.hidden = YES;


    
}
- (void)setModel:(JCKellyDataModelPayInfoModel *)model {
    _model = model;
    self.titleLab.text  = model.introduce;
    self.buyInfoView.dataModel = model;
    self.buyBgView.hidden= model.big_data_price==0?YES:NO;
    if (model.show_status==1||model.show_status==3) {
        //免费体验,立即续费
        self.statusBtn.hidden = YES;
        self.timeLab.hidden = YES;
        [self.sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new_cor") forState:0];
        [self.sureBtn setTitle:[NSString stringWithFormat:@"免费体验%@天，点击开通",NonNil(model.free_day)] forState:0];
        if (model.show_status==3) {
            [self.sureBtn setTitle:@"立即开通" forState:0];
        }
        
    }
    if (model.show_status==2) {
        self.statusBtn.hidden = NO;
        self.timeLab.hidden = NO;
        NSString *time = [NSString stringWithFormat:@"当前到期时间%ld天%@小时",model.distance_day,model.distance_hour];
        NSRange range = [time rangeOfString:[NSString stringWithFormat:@"%ld",model.distance_day]];
        if (model.distance_hour.length==0) {
            model.distance_hour = @"";
        }

        NSRange hour_range = [time rangeOfString:model.distance_hour];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:time];

        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)]} range:range];
        }
        if (hour_range.location!=NSNotFound) {
            [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)]} range:hour_range];
        }
        self.timeLab.attributedText = attr;
        [self.sureBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button") forState:0];
        if (model.model_status==1) {
            //免费体验
            [self.sureBtn setTitle:@"" forState:0];
            [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_red") forState:0];
            [self.statusBtn setTitle:@"免费体验中" forState:0];
        }
        if (model.model_status==2) {
            //体验中续费

            [self.sureBtn setTitle:@"" forState:0];
            [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_red") forState:0];
            [self.statusBtn setTitle:@"立即续费" forState:0];
        }
        if (model.model_status==3) {
            //体验中下架

            [self.sureBtn setTitle:@"" forState:0];
            [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_gray") forState:0];
            [self.statusBtn setTitle:@"已下架" forState:0];
        }
        if (model.model_status==4) {
            //免费
            self.statusBtn.hidden = YES;
            self.timeLab.hidden = YES;
//            [self.sureBtn setTitle:@"" forState:0];
 
            [self.sureBtn setBackgroundImage:JCIMAGE(@"blank") forState:0];

            [self.sureBtn setTitle:@"免费查看「鲸猜大数据」" forState:0];
        }


        
    }
    //未订阅下架
    if (model.show_status==4) {
        self.statusBtn.hidden = NO;
        self.timeLab.hidden = NO;
        NSString *time = [NSString stringWithFormat:@"当前到期时间 %ld 天",model.distance_day];
        NSRange range = [time rangeOfString:[NSString stringWithFormat:@"%ld",model.distance_day]];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:time];

        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(16)]} range:range];
        }
        self.timeLab.attributedText = attr;
        
        [self.sureBtn setTitle:@"" forState:0];
        [self.statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_gray") forState:0];
        [self.statusBtn setTitle:@"已下架" forState:0];
        
    }
    
    if (model.show_status==2&&model.model_status==4) {
        self.sureBtn.layer.borderColor = JCWhiteColor.CGColor;
    }else{
        self.sureBtn.layer.borderColor = JCClearColor.CGColor;
    }

    if (model.big_data_price>0) {
        if (model.current_count>0) {
            NSString *buyCount = [NSString stringWithFormat:@"%ld人购买",model.current_count];
            self.countLab.text = buyCount;

        }else{
            self.countLab.text = @"";
        }
    }else{
        self.countLab.text = @"";
    }


    [self layoutIfNeeded];
    NSArray *userArray = model.user_img;
    userArray = [[userArray reverseObjectEnumerator] allObjects];
        for (int i=0; i<userArray.count; i++) {
             NSString *user_img = userArray[i];
              UIImageView *imgView = [UIImageView new];
              [imgView hg_setAllCornerWithCornerRadius:AUTO(11)];
            imgView.frame = CGRectMake(90-AUTO(15)*i, AUTO(4), AUTO(22), AUTO(22));
            imgView.image = JCIMAGE(@"userImg_default");
             [imgView sd_setImageWithURL:[NSURL URLWithString:user_img] placeholderImage:JCIMAGE(@"userImg_default")];
//              [self.buyBgView addSubview:imgView];
            [self.buyBgView insertSubview:imgView atIndex:0];
            [imgView bringSubviewToFront:self.buyBgView];
      }
}


- (Class)customCollectionViewCellClassForCycleScrollView:(SDCycleScrollView *)view {
    return [JCAIHomeNoticeCollectionViewCell class];
}


- (void)setupCustomCell:(UICollectionViewCell *)cell forIndex:(NSInteger)index cycleScrollView:(SDCycleScrollView *)view {
    JCAIHomeNoticeCollectionViewCell *myCell = (JCAIHomeNoticeCollectionViewCell *)cell;
    myCell.aModel = self.titleArray[index];

}


- (void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didSelectItemAtIndex:(NSInteger)index {
    JCJingCaiAINoticeModel *model = self.titleArray[index];
    JCMatchDetailWMStickVC *vc = [JCMatchDetailWMStickVC new];
    vc.matchNum = model.id;
    vc.is_bigData = YES;
    [[self getViewController].navigationController pushViewController:vc animated:YES];
}

- (void)setTitleArray:(NSArray *)titleArray {
    _titleArray = titleArray;
    NSMutableArray *array = [NSMutableArray array];
    [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [array addObject:@""];
    }];
    self.noticeCycleScrollView.imageURLStringsGroup = array;
    if (array.count==0) {
        self.bottomView.hidden = YES;
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
//            make.bottom.offset(0);
        }];
        
        [self.mzInfovView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomView.mas_bottom).offset(0);
        }];
        
    }else{
        self.bottomView.hidden = NO;
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(36));
//            make.bottom.offset(AUTO(-8));
        }];
        
        [self.mzInfovView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.bottomView.mas_bottom).offset(AUTO(8));
        }];
    }
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    self.mzInfovView.dataArray = dataArray;
    self.mzInfovView.hidden = dataArray.count==0?YES:NO;
    [self.mzInfovView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(AUTO(28)*dataArray.count+AUTO(80));
    }];
    
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"注：本服务为数据订阅服务，不包含方案！" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _infoLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(10) andWeight:2 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UIView *)buyBgView {
    if (!_buyBgView) {
        _buyBgView = [UIView new];
    }
    return _buyBgView;
}

- (JCJingCaiAIBigDataBuyInfoView *)buyInfoView {
    if (!_buyInfoView) {
        _buyInfoView = [JCJingCaiAIBigDataBuyInfoView new];
//        _buyInfoView.hidden = YES;
    }
    return _buyInfoView;
}

- (UIView *)bottomView {
    if (!_bottomView) {
        _bottomView = [UIView new];
        _bottomView.backgroundColor = JCWhiteColor;
    }
    return _bottomView;
}

- (UIImageView *)iconImgView {
    if (!_iconImgView) {
        _iconImgView = [UIImageView new];
        _iconImgView.image = JCIMAGE(@"ic_data_ycjg");
    }
    return _iconImgView;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _timeLab.hidden = YES;
    }
    return _timeLab;
}

- (UIButton *)statusBtn {
    if (!_statusBtn) {
        _statusBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_statusBtn setBackgroundImage:JCIMAGE(@"ic_dataModel_button_red") forState:0];
        _statusBtn.hidden = YES;
//        [_statusBtn hg_setAllCornerWithCornerRadius:16];
    }
    return _statusBtn;
}

- (UIView *)sureBgView {
    if (!_sureBgView) {
        _sureBgView = [UIView new];
//        _sureBgView.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
//        [_sureBgView hg_setAllCornerWithCornerRadius:16];
    }
    return _sureBgView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即开通" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        [_sureBtn setBackgroundImage:JCIMAGE(@"button_bg_new_cor") forState:0];
        _sureBtn.layer.borderWidth = 1;
        _sureBtn.layer.cornerRadius = AUTO(22);
        _sureBtn.layer.masksToBounds = YES;
//        _sureBtn.backgroundColor = JCBaseColor;
//        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _sureBtn;
}

- (JCJingCaiAIBigDataMZInfoView *)mzInfovView {
    if (!_mzInfovView) {
        _mzInfovView = [JCJingCaiAIBigDataMZInfoView new];
        _mzInfovView.backgroundColor = JCWhiteColor;
    }
    return _mzInfovView;
}
- (JCDataModelDateView *)dateHeadView {
    if (!_dateHeadView) {
        _dateHeadView = [JCDataModelDateView new];
//        _dateHeadView.hidden = YES;
    }
    return _dateHeadView;
}
@end
