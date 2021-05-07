//
//  JCFamousExpertHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFamousExpertHeadView.h"
#import "JCDakaTopExpertCollectionCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCExpertWMViewController.h"
#import "JCHongbangWMstckyVC.h"
@implementation JCFamousExpertHeadView

- (void)initViews {
    
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    bgView.backgroundColor = JCWhiteColor;
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

    return self.dataSource.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(AUTO(60), AUTO(88));
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return AUTO(22);
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return AUTO(5);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCDakaTopExpertCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCDakaTopExpertCollectionCell" forIndexPath:indexPath];
    cell.isHongbang = self.isHongbang;
    cell.model = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JCWExpertBall *model = self.dataSource[indexPath.row];
    if (model.localImage) {
        JCExpertWMViewController * vc = [JCExpertWMViewController new];
        if (self.isHongbang) {
            vc.selectIndex = 1;
        }
        [[self getViewController].navigationController pushViewController:vc animated:YES];
    }else{
        if (self.isHongbang) {
            
            JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
            JCWExpertBall *model = self.dataSource[indexPath.row];
            userVC.autherID = model.id;
            [[self getViewController].navigationController pushViewController:userVC animated:YES];
        }else{
            JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
            JCWExpertBall *model = self.dataSource[indexPath.row];
            vc.autherID = model.user_id;
            [[self getViewController].navigationController pushViewController:vc animated:YES];
        }
        
        

    }

}

- (void)setDataSource:(NSMutableArray *)dataSource {
    _dataSource = dataSource;
    self.backgroundColor = COLOR_F4F6F9;
    self.collectionView.backgroundColor = COLOR_F4F6F9;
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
        [_collectionView setBackgroundColor:JCWhiteColor];
        _collectionView.scrollEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[JCDakaTopExpertCollectionCell class]
            forCellWithReuseIdentifier:@"JCDakaTopExpertCollectionCell"];
//        [_collectionView registerClass:[JCCommunityMoreTopicCell class]
//            forCellWithReuseIdentifier:@"JCCommunityMoreTopicCell"];
        
    }
    return _collectionView;
}
@end
