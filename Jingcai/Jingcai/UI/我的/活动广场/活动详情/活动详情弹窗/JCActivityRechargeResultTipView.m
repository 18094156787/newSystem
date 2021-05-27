//
//  JCActivityRechargeResultTipView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityRechargeResultTipView.h"
#import "JCActivityPrizeItemCell.h"
@implementation JCActivityRechargeResultTipView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    [self addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(kNavigationBarHeight+AUTO(80));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(AUTO(315), AUTO(393)));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"恭喜您达成活动条件" andFont:AUTO(20) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(185));
        make.centerX.equalTo(self);
    }];
    

    
    [self.bgView addSubview:self.collectionView];
    
    UIImageView *titleBgView = [UIImageView new];
    titleBgView.image = JCIMAGE(@"jc_activity_title");
    [self.bgView addSubview:titleBgView];
    [titleBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.bottom.equalTo(self.collectionView.mas_top).offset(-15);
        make.size.mas_equalTo(CGSizeMake(AUTO(105), AUTO(15)));
    }];
    
    UILabel *tipLab = [UILabel initWithTitle:@"获得如下奖励" andFont:AUTO(13) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [titleBgView addSubview:tipLab];
    [tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.bgView addSubview:self.moneyLab];
    [self.moneyLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(8));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self.bgView addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.moneyLab.mas_bottom);
        make.height.mas_equalTo(AUTO(30));
    }];
    
    [self addSubview:self.closeBtn];
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(22));
        make.centerX.equalTo(self);
        make.size.mas_equalTo(CGSizeMake(50, 50));
    }];
    
    
    
    WeakSelf;
    [self.closeBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{

    return self.dataSource.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(AUTO(64), AUTO(64));
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 8;
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 8;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCActivityPrizeItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCActivityPrizeItemCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.JCClickBlock) {
        self.JCClickBlock();
    }
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    if ([detailModel.pay_type integerValue]==1||[detailModel.pay_type integerValue]==2) {
        self.typeLab.text = @"我的累计充值";
    }else{
        self.typeLab.text = @"我的首充";
    }
    self.moneyLab.text = detailModel.recharge_amount;

}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count==0) {
        return;
    }
    if (dataSource.count<=3) {
        float width = (AUTO(315)-AUTO(72)*dataSource.count)/2.0f;
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            make.bottom.offset(-15);
//            make.centerX.equalTo(self.contentView);
            make.left.offset(width);
            make.height.mas_equalTo(64);
            make.width.mas_equalTo(80*dataSource.count);
        }];
    }else{
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(-15);
            make.height.mas_equalTo(64);
            make.left.offset(AUTO(50));
            make.right.offset(AUTO(-50));
        }];
    }
    [self.collectionView reloadData];
    
    
}

- (UIImageView *)bgView {
    if (!_bgView) {
        _bgView = [UIImageView new];
        _bgView.image = JCIMAGE(@"ic_huodong_recharge");
        _bgView.userInteractionEnabled = YES;
    }
    return _bgView;
}
- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [UIButton new];
        [_closeBtn setImage:JCIMAGE(@"icon_activity_close") forState:0];
        [_closeBtn setImage:JCIMAGE(@"icon_activity_close") forState:UIControlStateSelected];
    }
    return _closeBtn;
}
- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(0,AUTO(20),0, AUTO(20));
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCClearColor];
//        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
//        _collectionView.userInteractionEnabled = NO;
        [_collectionView registerClass:[JCActivityPrizeItemCell class]
            forCellWithReuseIdentifier:@"JCActivityPrizeItemCell"];

        
    }
    return _collectionView;
}

- (UILabel *)moneyLab {
    if (!_moneyLab) {
        _moneyLab = [UILabel initWithTitle:@"" andFont:AUTO(20) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _moneyLab;
}

- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:[JCWhiteColor colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _typeLab;
}
@end
