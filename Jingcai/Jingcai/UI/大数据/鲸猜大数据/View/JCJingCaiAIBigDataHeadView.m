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
    self.bgView = [[UIView alloc] init];
    self.bgView.backgroundColor = JCWhiteColor;
    [self.bgView hg_setAllCornerWithCornerRadius:AUTO(5)];
    self.bgView.frame = CGRectMake(0,0,SCREEN_WIDTH,AUTO(235));
    [self addSubview:self.bgView];
    UILabel *titleLab = [UILabel initWithTitle:@"鲸猜大数据服务" andFont:18 andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.offset(0);
    }];

    
    
    
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"ic_bigdata_homeTop");
    [self.bgView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.offset(8);
        make.size.mas_equalTo(CGSizeMake(AUTO(163), AUTO(118)));
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(titleLab.mas_bottom).offset(4);
        make.right.equalTo(imgView.mas_left).offset(15);
    }];
    
    [self.bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(15);
        make.top.equalTo(self.titleLab.mas_bottom).offset(8);
    }];
    


    

    
    [self.bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(-15);
        make.top.equalTo(self.infoLab.mas_bottom).offset(12);
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
    
    [self.bgView addSubview:self.sureBgView];
    [self.sureBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.buyInfoView.mas_bottom).offset(25);
        make.left.offset(15);
        make.right.offset(-15);
        make.height.mas_equalTo(32);
    }];
    
    [self.sureBgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.bottom.offset(0);
        make.width.mas_equalTo(0);
    }];
    
    [self.sureBgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.equalTo(self.sureBgView);
        make.left.equalTo(self.timeLab.mas_right);
        make.right.offset(0);
        make.height.mas_equalTo(32);
    }];
    
    

    
    

    
    
    

    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.bgView.mas_bottom).offset(0);
        make.height.mas_equalTo(36);
    }];
    
    [self addSubview:self.mzInfovView];
    [self.mzInfovView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView.mas_bottom).offset(AUTO(8));
        make.bottom.offset(AUTO(-8));
//        make.height.mas_equalTo(AUTO(160));
        
        make.left.right.offset(0);
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
    
    self.noticeCycleScrollView = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(AUTO(60), 0, SCREEN_WIDTH-AUTO(40), 36) delegate:self placeholderImage:[UIImage imageNamed:@"placeholder"]];
    self.noticeCycleScrollView.clipsToBounds = YES;
    self.noticeCycleScrollView.showPageControl = NO;
    self.noticeCycleScrollView.autoScrollTimeInterval = 3;
    self.noticeCycleScrollView.backgroundColor = JCClearColor;
    self.noticeCycleScrollView.scrollDirection = UICollectionViewScrollDirectionVertical;
    [self.bottomView addSubview:self.noticeCycleScrollView];
    
    self.titleLab.text = @"根据对阵双方的实力、状态、交战、战绩、指数等数据进行分析，给出各种玩法的预测概率。可包月，也可单场订阅（单场订阅可在比分-对应比赛的数据模块中进行购买）";

    
    WeakSelf;

    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCBuyClickBlock) {
            weakSelf.JCBuyClickBlock();
        }
    }];

}



- (void)setProductModel:(JCBigDataMonthProduceModel *)productModel {
    _productModel = productModel;
    [self.buyBgView removeAllSubviews];
    self.buyInfoView.productModel = self.productModel;

    if ([productModel.user_count integerValue]>0) {
        NSString *buyCount = [NSString stringWithFormat:@"%@人购买",productModel.user_count];
        self.countLab.text = buyCount;

    }else{
        self.countLab.text = @"";
    }
    if (productModel.distance_day.length>0&&[productModel.is_buy integerValue]==1) {
        
        NSString *endDay = [NSString stringWithFormat:@"当前到期时间 %@ 天",productModel.distance_day];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:endDay];
        NSRange range = [endDay rangeOfString:productModel.distance_day];
        if (range.location!=NSNotFound) {
            [attr addAttributes:@{NSForegroundColorAttributeName:JCBaseColor} range:range];
            [attr addAttributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:16]} range:range];
        }
        self.timeLab.attributedText = attr;
        
        [self.timeLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(164);
        }];
        
    }else{
        self.timeLab.text = @"";
        [self.timeLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.width.mas_equalTo(0);
        }];
    }
    
    if ([productModel.is_buy intValue]==1) {
        [self.sureBtn setTitle:@"立即续费" forState:0];
    }else{
        [self.sureBtn setTitle:@"立即开通" forState:0];
    }
    
    
    [self layoutIfNeeded];
    NSArray *userArray = self.productModel.user_img;
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
        }];
    }else{
        self.bottomView.hidden = NO;
        [self.bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(36));
        }];
    }
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;
    self.mzInfovView.dataArray = dataArray;
    self.mzInfovView.hidden = dataArray.count==0?YES:NO;
}


- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
}

- (UIView *)sureBgView {
    if (!_sureBgView) {
        _sureBgView = [UIView new];
        _sureBgView.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        [_sureBgView hg_setAllCornerWithCornerRadius:16];
    }
    return _sureBgView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即购买" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        _sureBtn.backgroundColor = JCBaseColor;
        [_sureBtn hg_setAllCornerWithCornerRadius:16];
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
@end
