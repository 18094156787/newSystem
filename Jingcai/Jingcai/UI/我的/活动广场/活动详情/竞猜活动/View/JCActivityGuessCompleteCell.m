//
//  JCActivityGuessCompleteCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/26.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityGuessCompleteCell.h"
#import "JCActivityGuessChooseItemCell.h"
@implementation JCActivityGuessCompleteCell

- (void)initViews {
    self.backgroundColor = JCClearColor;
    
    UIView *bgView = [UIView new];
    [self.contentView addSubview:bgView];
//    [bgView hg_setAllCornerWithCornerRadius:16];
    bgView.backgroundColor = JCWhiteColor;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    self.timeBgView = [UIImageView new];
    self.timeBgView.image = JCIMAGE(@"jc_activity_titleBg");
    [bgView addSubview:self.timeBgView];
    [self.timeBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(20);
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(132, 16));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"我提交的选项" andFont:16 andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [self.timeBgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    
//
    [bgView addSubview:self.collectionView];
    self.collectionView.backgroundColor = JCWhiteColor;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.timeBgView.mas_bottom).offset(15);
        make.centerX.equalTo(self.contentView);
        make.height.mas_equalTo(378);
        make.left.offset(0);
        make.right.offset(0);

    }];
    
//    [bgView addSubview:self.resultImgView];
//    [self.resultImgView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.top.offset(0);
//        make.size.mas_equalTo(CGSizeMake(110, 92));
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

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    if (dataSource.count<=10) {
        NSInteger count = ceil(self.dataSource.count/2.0f);
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeBgView.mas_bottom).offset(15);
            make.centerX.equalTo(self.contentView);
            make.height.mas_equalTo(62*count+50);
            make.left.offset(0);
            make.right.offset(0);
        }];
    }else{
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.timeBgView.mas_bottom).offset(15);
            make.centerX.equalTo(self.contentView);
            make.height.mas_equalTo(312+32);
            make.left.offset(0);
            make.right.offset(0);

        }];
    }
    [self.collectionView reloadData];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    [super scrollViewDidScroll:scrollView];
//    if (scrollView.contentOffset.y < 0) {
////        [self.view setNeedsLayout];
//        scrollView.contentOffset = CGPointZero;
//    }
//    CGFloat offsetY = self.collectionView.contentOffset.y;
//
//
//    CGFloat height = scrollView.frame.size.height;
//    CGFloat contentOffsetY = scrollView.contentOffset.y;
//    CGFloat bottomOffset = scrollView.contentSize.height - contentOffsetY;
////    NSLog(@"%.2f-----%.2f",offsetY,self.collectionView.contentSize.height);
//    if (bottomOffset <= height)
//    {
//        //在最底部
//        NSLog(@"在底部");
//        CGPoint offset = self.collectionView.contentOffset;
////        [self.collectionView setContentOffset:CGPointMake(0, scrollView.contentSize.height)];
////        [self.collectionView setContentOffset:offset animated:NO];
//
//        [self.collectionView scrollToBottomAnimated:YES];
//
////        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//////                        [scrollView setContentOffset:CGPointMake(0, 0) animated:NO];
//////            [self.collectionView setContentOffset:CGPointMake(0, 0) animated:NO];
////            [self.collectionView scrollToBottomAnimated:NO];
////          });
//    }
//    else
//    {
////        self.currentIsInBottom = NO;
//        NSLog(@"不在");
//    }
  
}

//- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
//    _detailModel = detailModel;
//    self.selCount = 0;
//
//    
//}


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

@end
