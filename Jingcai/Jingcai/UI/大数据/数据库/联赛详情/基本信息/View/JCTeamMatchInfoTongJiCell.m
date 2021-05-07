//
//  JCTeamMatchInfoTongJiCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamMatchInfoTongJiCell.h"
#import "JCTeamMatchInfoTongJiItemCell.h"
#import "JCTeamMatchTongjiModel.h"
#import "JCTeamDetailWMStickVC.h"
@implementation JCTeamMatchInfoTongJiCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
//    bgView.backgroundColor = COLOR_DDDDDD;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
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
//    if (self.dataSource.count>=3) {
//        NSInteger count = ceil(self.dataSource.count/3.0f);
//        return count*3;
//    }else{
//        return self.dataSource.count;
//    }

    return self.dataSource.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    if (self.dataSource.count>=3) {
//        return CGSizeMake((SCREEN_WIDTH-0.9f)/3.0f, 104.7);
//    }
    
    return CGSizeMake((SCREEN_WIDTH-0.9f)/2, 70);
    
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

    JCTeamMatchInfoTongJiItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCTeamMatchInfoTongJiItemCell" forIndexPath:indexPath];
    if (indexPath.row<self.dataSource.count) {
        cell.model = self.dataSource[indexPath.row];
    }
    
    
//    if (self.dataSource.count>=2&&indexPath.row>self.dataSource.count-1) {
//        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
//        cell.backgroundColor = JCWhiteColor;
//        cell.contentView.backgroundColor = JCWhiteColor;
//        return cell;
//    }
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row<self.dataSource.count) {
        JCTeamMatchTongjiModel *model = self.dataSource[indexPath.row];
        JCTeamDetailWMStickVC *vc = [JCTeamDetailWMStickVC new];
        vc.team_id = model.team_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
    
    

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
        
        [_collectionView registerClass:[JCTeamMatchInfoTongJiItemCell class]
            forCellWithReuseIdentifier:@"JCTeamMatchInfoTongJiItemCell"];
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"UICollectionViewCell"];
        
    }
    return _collectionView;
}

@end
