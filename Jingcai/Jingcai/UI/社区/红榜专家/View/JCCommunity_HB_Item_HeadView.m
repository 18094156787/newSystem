//
//  JCCommunity_HB_Item_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/29.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunity_HB_Item_HeadView.h"
#import "JCCommunityExpertCollectionCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCExpertWMViewController.h"
#import "JCHongbangWMstckyVC.h"
#import "JCTopRankListWMVC.h"
@implementation JCCommunity_HB_Item_HeadView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIView *bgView = [UIView new];
    [self    addSubview:bgView];
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

    float width = SCREEN_WIDTH/4.0f;
    return CGSizeMake(width-AUTO(8), AUTO(100));
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 0.001f;
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return AUTO(5);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCCommunityExpertCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCCommunityExpertCollectionCell" forIndexPath:indexPath];
    cell.isHongbang = self.isHongbang;
    cell.type = self.type;
    cell.model = self.dataSource[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

//    JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
//    JCWExpertBall *model = self.dataSource[indexPath.row];
//    vc.autherID = model.id;
//    [[self getViewController].navigationController pushViewController:vc animated:YES];
    if (self.isHongbang) {
        
        //红榜专家
        JCHongbangWMstckyVC *vc = [JCHongbangWMstckyVC new];
        JCWExpertBall *model = self.dataSource[indexPath.row];
        if (model.localImage) {
            JCTopRankListWMVC *vc = [JCTopRankListWMVC new];
            vc.selectIndex  = [model.type intValue]-1;
            [[self getViewController].navigationController pushViewController:vc animated:YES];
            return;
            
        }
        vc.autherID = model.user_id;
        [[self getViewController].navigationController pushViewController:vc animated:YES];
        return;
    }
    //公众号专家
    JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
    JCWExpertBall *model = self.dataSource[indexPath.row];
    vc.autherID = model.id;
    [[self getViewController].navigationController pushViewController:vc animated:YES];
//    JCWExpertBall *model = self.dataSource[indexPath.row];
//    if (model.localImage) {
//        JCExpertWMViewController * vc = [JCExpertWMViewController new];
//        [[self getViewController].navigationController pushViewController:vc animated:YES];
//    }else{
//        JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
//        JCWExpertBall *model = self.dataSource[indexPath.row];
//        vc.autherID = model.id;
//        [[self getViewController].navigationController pushViewController:vc animated:YES];
//    }
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
        
        [_collectionView registerClass:[JCCommunityExpertCollectionCell class]
            forCellWithReuseIdentifier:@"JCCommunityExpertCollectionCell"];
//        [_collectionView registerClass:[JCCommunityMoreTopicCell class]
//            forCellWithReuseIdentifier:@"JCCommunityMoreTopicCell"];
        
    }
    return _collectionView;
}

@end
