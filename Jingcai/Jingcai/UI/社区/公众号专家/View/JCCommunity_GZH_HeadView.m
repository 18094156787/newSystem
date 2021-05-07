//
//  JCCommunity_GZH_HeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCCommunity_GZH_HeadView.h"
#import "JCCommunityExpertCollectionCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCExpertWMViewController.h"
@implementation JCCommunity_GZH_HeadView

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
        make.edges.insets(UIEdgeInsetsMake(0, 0, 20, 0));
    }];
    
//    [bgView addSubview:self.moreView];
//    [self.moreView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.bottom.right.equalTo(bgView);
//        make.height.mas_equalTo(AUTO(40));
//    }];
    
    UILabel *label = [UILabel initWithTitle:@"查看全部达人" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.moreView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(10));
        make.centerX.equalTo(self.moreView);
    }];
    
    UIImageView *indicateImgView = [UIImageView new];
    indicateImgView.image = JCIMAGE(@"icon_more_right");
    [self.moreView addSubview:indicateImgView];
    [indicateImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(label);
        make.left.equalTo(label.mas_right).offset(3);
        make.size.mas_equalTo(CGSizeMake(8, 8));
    }];
    
//    WeakSelf;
//    [self.moreView bk_whenTapped:^{
//        JCExpertWMViewController * vc = [JCExpertWMViewController new];
//         [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
//    }];
    
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
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

//    JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
//    JCWExpertBall *model = self.dataSource[indexPath.row];
//    vc.autherID = model.id;
//    [[self getViewController].navigationController pushViewController:vc animated:YES];
    
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
    JCWExpertBall *moreModel = [JCWExpertBall new];
    moreModel.user_name = @"更多";
    moreModel.localImage = JCIMAGE(@"more_pp");
    [dataSource addObject:moreModel];
    if (dataSource.count>4) {
        self.moreView.hidden = NO;
        
    }
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

- (UIView *)moreView {
    if (!_moreView) {
        _moreView = [UIView new];
        _moreView.hidden = YES;
    }
    return _moreView;
}

@end
