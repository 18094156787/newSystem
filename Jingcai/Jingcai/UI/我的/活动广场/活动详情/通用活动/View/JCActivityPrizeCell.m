//
//  JCActivityPrizeCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityPrizeCell.h"
#import "JCActivityPrizeItemCell.h"
@implementation JCActivityPrizeCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, AUTO(15), 0, AUTO(15)));
    }];
    
    self.timeBgView = [UIImageView new];
    self.timeBgView.image = JCIMAGE(@"jc_activity_titleBg");
    [bgView addSubview:self.timeBgView];
    [self.timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(98, 16));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"活动奖励" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.timeBgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    self.titleLab = titleLab;
    
    [bgView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeBgView.mas_bottom).offset(AUTO(15));
        make.centerX.equalTo(bgView);
    }];
    
    
//
    [bgView addSubview:self.collectionView];
    self.collectionView.backgroundColor = JCWhiteColor;

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

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count==0) {
        return;
    }
    if (dataSource.count<=4) {
        float width = (SCREEN_WIDTH-AUTO(30)-AUTO(72)*dataSource.count)/2.0f;
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            
            if ([self.detailModel.count integerValue]>0) {
                make.top.equalTo(self.infoLab.mas_bottom).offset(15);
            }else{
                make.top.equalTo(self.infoLab.mas_bottom).offset(0);
            }
//            make.centerX.equalTo(self.contentView);
            make.left.offset(width);
            make.height.mas_equalTo(64);
            make.width.mas_equalTo(80*dataSource.count);
        }];
    }else{
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            if ([self.detailModel.count integerValue]>0) {
                make.top.equalTo(self.infoLab.mas_bottom).offset(15);
            }else{
                make.top.equalTo(self.infoLab.mas_bottom).offset(0);
            }
            make.height.mas_equalTo(64);
            make.left.offset(AUTO(15));
            make.right.offset(AUTO(-15));
        }];
    }
    [self.collectionView reloadData];
    
    
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    _detailModel = detailModel;
    if ([self.detailModel.count integerValue]>0) {
        self.infoLab.text = [NSString stringWithFormat:@" 剩余奖品数量：%@ | 奖品总数：%@",self.detailModel.remaining_quantity,self.detailModel.count];
                }
}

- (void)setKindImageView:(UIImage *)kindImageView {
    _kindImageView = kindImageView;
    self.titleLab.textColor = COLOR_FB5835;
    self.timeBgView.backgroundColor = UIColorFromRGB(0xFFFDFA);
    self.timeBgView.image = kindImageView;
    [self.timeBgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(119, 22));
    }];
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
- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_9F9F9F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _infoLab;
}
@end
