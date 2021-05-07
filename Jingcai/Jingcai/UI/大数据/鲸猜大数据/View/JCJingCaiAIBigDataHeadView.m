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
    self.bgView.frame = CGRectMake(AUTO(8),AUTO(8),SCREEN_WIDTH-AUTO(16),AUTO(180));



    [self addSubview:self.bgView];
    UIImageView *imgView = [UIImageView new];
    imgView.image = JCIMAGE(@"ic_bigdata_homeTop");
    [self.bgView addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(8);
        make.top.offset(5);
        make.size.mas_equalTo(CGSizeMake(AUTO(130), AUTO(85)));
    }];
    
    [self.bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imgView.mas_right).offset(AUTO(8));
        make.top.offset(AUTO(5));
        make.right.offset(AUTO(-8));
    }];
    
    [self addSubview:self.buyInfoView];
    [self.buyInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.titleLab.mas_bottom).offset(0);
        make.height.mas_equalTo(AUTO(20));
    }];

    

    
    [self.bgView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.buyInfoView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(20));
    }];

    [self.bgView addSubview:self.buyBgView];
    [self.buyBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.countLab);
        make.left.equalTo(self.countLab.mas_left);
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(self.countLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(92), AUTO(32)));
    }];
    
    
    [self.bgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.sureBtn);
        make.bottom.equalTo(self.sureBtn.mas_top).offset(-5);
    }];
    
    
    [self addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.countLab);
        make.top.equalTo(self.countLab.mas_bottom).offset(AUTO(10));
    }];
    
    
    

    
    [self addSubview:self.bottomView];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(36);
    }];
    
    [self addSubview:self.mzInfovView];
    [self.mzInfovView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView.mas_bottom).offset(AUTO(8));
        make.bottom.offset(AUTO(-8));
//        make.height.mas_equalTo(AUTO(160));
        
        make.left.right.offset(0);
    }];

    
    
    UILabel *ycLab = [UILabel initWithTitle:@"预测\n已出" andFont:AUTO(11) andWeight:3 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    ycLab.numberOfLines= 0;
    [self.bottomView addSubview:ycLab];
    [ycLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.bottomView);
        make.width.height.mas_equalTo(AUTO(35));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = COLOR_DBDBDB;
    [self.bottomView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(ycLab.mas_right).offset(2);
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
    
    self.titleLab.text = @"根据对阵双方的实力、状态、交战、战役、指数等数据进行分析，给出各种玩法的预测概率。可包月，也可单场订阅（单场订阅可在比分-对应比赛的数据模块中进行购买）";

    
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
        }
        self.timeLab.attributedText = attr;
        
    }else{
        self.timeLab.text = @"";
    }
    
    if ([productModel.is_buy intValue]==1) {
        [self.sureBtn setTitle:@"立即续费" forState:0];
    }else{
        [self.sureBtn setTitle:@"立即购买" forState:0];
    }
    
    
    [self layoutIfNeeded];
    NSArray *userArray = self.productModel.user_img;
    userArray = [[userArray reverseObjectEnumerator] allObjects];
        for (int i=0; i<userArray.count; i++) {
             NSString *user_img = userArray[i];
              UIImageView *imgView = [UIImageView new];
              [imgView hg_setAllCornerWithCornerRadius:AUTO(11)];
            imgView.frame = CGRectMake(self.countLab.right+AUTO(15)*i, AUTO(4), AUTO(22), AUTO(22));
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
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(12.5) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
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
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"立即购买" FontSize:AUTO(14) Weight:2 BackGroundColor:JCClearColor TextColors:JCWhiteColor];
        _sureBtn.backgroundColor = JCBaseColor;
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(16)];
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
