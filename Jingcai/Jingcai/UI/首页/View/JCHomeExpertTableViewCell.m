    //
//  JCHomeExpertTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHomeExpertTableViewCell.h"
#import "JCHomeExpertCollectionCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCExpertWMViewController.h"
@implementation JCHomeExpertTableViewCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
    bgView.backgroundColor = COLOR_F0F0F0;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    
//
    [bgView addSubview:self.collectionView];
    self.collectionView.backgroundColor = JCWhiteColor;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, AUTO(8), 0));
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

    float width = (SCREEN_WIDTH-AUTO(40))/4.0f;
    return CGSizeMake(width-AUTO(8), AUTO(102));
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return AUTO(10);
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return AUTO(5);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCHomeExpertCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCHomeExpertCollectionCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (self.clickEnable==2) {
        return;
    }
    
    JCWExpertBall *model = self.dataSource[indexPath.row];
    if (model.localImage) {
        JCExpertWMViewController * vc = [JCExpertWMViewController new];
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }else{
        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
        JCWExpertBall *model = self.dataSource[indexPath.row];
        vc.autherID = model.user_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }
}

- (void)setDataSource:(NSMutableArray *)dataSource {
    _dataSource = dataSource;
    [self.collectionView reloadData];
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0,AUTO(20),0, AUTO(20));
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCClearColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[JCHomeExpertCollectionCell class]
            forCellWithReuseIdentifier:@"JCHomeExpertCollectionCell"];
//        [_collectionView registerClass:[JCCommunityMoreTopicCell class]
//            forCellWithReuseIdentifier:@"JCCommunityMoreTopicCell"];
        
    }
    return _collectionView;
}

@end
