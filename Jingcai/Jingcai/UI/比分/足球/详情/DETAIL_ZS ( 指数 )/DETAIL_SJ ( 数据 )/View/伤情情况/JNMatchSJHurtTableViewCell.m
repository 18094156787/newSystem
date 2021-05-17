//
//  JNMatchSJHurtTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JNMatchSJHurtTableViewCell.h"
#import "JNMatchSJHurtCell.h"
@implementation JNMatchSJHurtTableViewCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0,AUTO(15), AUTO(12), AUTO(15)));
    }];
    

    
    
//
    [bgView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
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

    return CGSizeMake((SCREEN_WIDTH-30)/2-10, AUTO(64));
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 3;

}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 0.3;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JNMatchSJHurtCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JNMatchSJHurtCell" forIndexPath:indexPath];
    cell.injuryBall = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {


}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [self.collectionView reloadData];
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0,0,0, 0);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCClearColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[JNMatchSJHurtCell class]
            forCellWithReuseIdentifier:@"JNMatchSJHurtCell"];
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"UICollectionViewCell"];
        
    }
    return _collectionView;
}

@end
