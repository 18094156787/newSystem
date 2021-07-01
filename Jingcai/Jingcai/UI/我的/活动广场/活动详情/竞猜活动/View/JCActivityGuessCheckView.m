//
//  JCActivityGuessCheckView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/29.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessCheckView.h"
#import "JCActivityGuessChooseItemCell.h"
@implementation JCActivityGuessCheckView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(400);
    }];
    self.bgView = bgView;
    
    UILabel *titleLab = [UILabel initWithTitle:@"提交竞猜选项确认" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.equalTo(bgView);
        make.height.mas_equalTo(20);
    }];
    self.titleLab = titleLab;
    
//
    [bgView addSubview:self.collectionView];
    self.collectionView.backgroundColor = JCWhiteColor;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(15);
        make.centerX.equalTo(self);
        make.height.mas_equalTo(378);
        make.left.offset(0);
        make.right.offset(0);

    }];
    
    float width = (SCREEN_WIDTH-AUTO(100))/2.0f;
    
    [bgView addSubview:self.cancelBtn];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_centerX).offset(-4);
        make.bottom.offset(-24);
        make.size.mas_equalTo(CGSizeMake(width, 44));
    }];
    
    [bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_centerX).offset(4);
        make.bottom.offset(-24);
        make.size.mas_equalTo(CGSizeMake(width, 44));
    }];
    
    WeakSelf;
    [self.cancelBtn bk_whenTapped:^{
        [weakSelf removeFromSuperview];
    }];
    
    [self.sureBtn bk_whenTapped:^{
        if (weakSelf.JCSureBlock) {
            weakSelf.JCSureBlock();
        }
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

    float width =  SCREEN_WIDTH - 56-8;
    return CGSizeMake(width/2.0f, 56);
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 8;
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 4;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCActivityGuessChooseItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCActivityGuessChooseItemCell" forIndexPath:indexPath];
    cell.detailModel = self.detailModel;
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
 
}

- (void)setDataSource:(NSMutableArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count<=8) {
        NSInteger count = ceil(self.dataSource.count/2.0f);
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(15);
            make.centerX.equalTo(self);
            make.height.mas_equalTo(62*count);
            make.left.offset(0);
            make.right.offset(0);
        }];
        
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {

            make.height.mas_equalTo(62*count+140);
        }];
    }else{
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.titleLab.mas_bottom).offset(15);
            make.centerX.equalTo(self);
            make.height.mas_equalTo(248);
            make.left.offset(0);
            make.right.offset(0);

        }];
        
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(400);
        }];
    }
    [self.collectionView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {

  
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0,12,0, 12);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        _collectionView.bounces = NO;
        [_collectionView setBackgroundColor:JCClearColor];
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[JCActivityGuessChooseItemCell class]
            forCellWithReuseIdentifier:@"JCActivityGuessChooseItemCell"];

        
    }
    return _collectionView;
}
- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton initWithText:@"我再想想" FontSize:16 BackGroundColor:JCClearColor TextColors:JCBaseColor];
        _cancelBtn.layer.borderColor = JCBaseColor.CGColor;
        _cancelBtn.layer.borderWidth = 1;
        _cancelBtn.layer.cornerRadius = 22;
        _cancelBtn.layer.masksToBounds = YES;
    }
    return _cancelBtn;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"确认提交" FontSize:16 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        _sureBtn.layer.borderColor = JCBaseColor.CGColor;
        _sureBtn.layer.borderWidth = 1;
        _sureBtn.layer.cornerRadius = 22;
        _sureBtn.layer.masksToBounds = YES;
    }
    return _sureBtn;
}
@end
