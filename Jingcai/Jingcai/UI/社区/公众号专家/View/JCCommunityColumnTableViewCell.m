//
//  JCCommunityColumnTableViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCCommunityColumnTableViewCell.h"
#import "JCCommunityColumnCollectionViewCell.h"
#import "JCColumnDetailWMViewController.h"
@implementation JCCommunityColumnTableViewCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIImageView *bgView = [UIImageView new];
    bgView.userInteractionEnabled = YES;
    bgView.image = JCIMAGE(@"ic_img_column");
    [self.contentView addSubview:bgView];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
        make.left.top.right.offset(0);
        make.height.mas_equalTo(AUTO(182));
        make.bottom.offset(0);
    }];
    
    UIImageView *iconImgView = [UIImageView new];
    iconImgView.image = JCIMAGE(@"ic_column");
    [bgView addSubview:iconImgView];
    [iconImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(15));
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(14)));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"专栏推荐" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_1B1B1B andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(iconImgView);
        make.left.equalTo(iconImgView.mas_right).offset(AUTO(6));
    }];
    
    UIButton *moreBtn = [UIButton initWithText:@"更多" FontSize:AUTO(12) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_9F9F9F];
    [moreBtn setImage:JCIMAGE(@"ic_column_arrow") forState:0];
    [moreBtn setImage:JCIMAGE(@"ic_column_arrow") forState:UIControlStateHighlighted];
    [moreBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 45, 0, 0)];
    [bgView addSubview:moreBtn];
    [moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-15));
        make.centerY.equalTo(iconImgView);
        make.size.mas_equalTo(CGSizeMake(50, 30));
//        make.size.mas_equalTo
    }];
    
//
    [bgView addSubview:self.collectionView];
    self.collectionView.backgroundColor = JCWhiteColor;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(30), 0, 0, 0));
    }];
    
    WeakSelf;
    [moreBtn bk_whenTapped:^{
        if (weakSelf.JCBlock) {
            weakSelf.JCBlock();
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

    float width = (SCREEN_WIDTH-AUTO(24))/3.0f;
    return CGSizeMake(width-AUTO(4), AUTO(122));
    
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

    JCCommunityColumnCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCCommunityColumnCollectionViewCell" forIndexPath:indexPath];
    JCColumnDetailModel *model = self.dataSource[indexPath.row];
    cell.model = model;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JCColumnDetailModel *model = self.dataSource[indexPath.row];
    JCColumnDetailWMViewController *vc = [JCColumnDetailWMViewController new];
    vc.column_id = model.zctj_special_column_id;
    [[self getViewController].navigationController pushViewController:vc animated:YES];


}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    [self.collectionView reloadData];
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0,AUTO(8),0, AUTO(8));
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCClearColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[JCCommunityColumnCollectionViewCell class]
            forCellWithReuseIdentifier:@"JCCommunityColumnCollectionViewCell"];
//        [_collectionView registerClass:[JCCommunityMoreTopicCell class]
//            forCellWithReuseIdentifier:@"JCCommunityMoreTopicCell"];
        
    }
    return _collectionView;
}

@end
