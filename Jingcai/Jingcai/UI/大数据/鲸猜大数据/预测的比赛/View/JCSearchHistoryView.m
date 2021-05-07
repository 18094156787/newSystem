//
//  JCSearchHistoryView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCSearchHistoryView.h"
#import "JCSearchHistoryItemCell.h"
#import "ZQSearchNormalLayout.h"
#import "JCHistorySeachTitleView.h"
@implementation JCSearchHistoryView

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    
    UIView *colorView = [UIView new];
    colorView.frame = CGRectMake(0, 0, SCREEN_WIDTH, AUTO(8));
    colorView.backgroundColor = COLOR_F0F0F0;
    [self addSubview:colorView];
//
//    UILabel *titleLab = [UILabel initWithTitle:@"最近搜索" andFont:AUTO(16) andWeight:2 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.8] andBackgroundColor:JCClearColor andTextAlignment:0];
//    [self addSubview:titleLab];
//    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.left.offset(AUTO(15));
//    }];
    
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    bgView.backgroundColor = COLOR_F0F0F0;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(colorView.mas_bottom);
        make.bottom.offset(0);
    }];
    
    
//
    [bgView addSubview:self.collectionView];
    self.collectionView.backgroundColor = JCWhiteColor;
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];


}

- (void)setType:(NSInteger)type {
    _type = type;
//    id object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCSearch_BF];
//    if (self.type==1) {
//        object_data = [[NSUserDefaults standardUserDefaults] objectForKey:JCSearch_BigData];
//    }
//    if (object_data) {
//        NSArray *dataArray =  [NSJSONSerialization JSONObjectWithData:object_data options:NSJSONReadingAllowFragments error:nil];
//        self.historyArray = [NSMutableArray arrayWithArray:dataArray];
//        [self.collectionView reloadData];
//        if (self.historyArray.count==0) {
//            self.hidden = YES;
//        }
//    }else {
//        self.hidden = YES;
//    }

}

#pragma mark -- UICollectionViewhistoryArray
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (section==0) {
        return self.historyArray.count;
    }
    return self.hotArray.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSString *string = @"";
    if (indexPath.section==0) {
        string = self.historyArray[indexPath.row];
    }else{
        
        string = self.hotArray[indexPath.row];
    }

    CGSize size = [string boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-20, MAXFLOAT) options: NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)]} context:nil].size;
    CGSize rSize = CGSizeMake(size.width + 15, size.height+15);
    
    return rSize;
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsMake(5, 5, 0, 5);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 10.f;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 10.f;
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCSearchHistoryItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCSearchHistoryItemCell" forIndexPath:indexPath];
//    cell.model = self.historyArray[indexPath.row];
    if (indexPath.section==0) {
        cell.titleLab.text = self.historyArray[indexPath.row];
        
    }else{
        cell.titleLab.text = self.hotArray[indexPath.row];
    }
    
    return cell;
}
//头部
-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader])
    {
        JCHistorySeachTitleView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"JCHistorySeachTitleView" forIndexPath:indexPath];
        if (indexPath.section==0) {
            headView.titleLab.text = self.historyArray.count>0?@"最近搜索":@"";
        }
        if (indexPath.section==1) {
            
            headView.titleLab.text = self.hotArray.count>0?@"热门搜索":@"";
        }
        return headView;

    }
    UICollectionReusableView *footView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
    footView.backgroundColor = COLOR_F6F6F6;
    return footView;
    

}
//区头的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    if (section==0) {

        if (self.historyArray.count>0) {
            return CGSizeMake(SCREEN_WIDTH, AUTO(40));
        }
       
    }
    if (section==1) {
        if (self.hotArray.count>0) {
            return CGSizeMake(SCREEN_WIDTH, AUTO(40));
        }
       
    }
    return CGSizeMake(SCREEN_WIDTH, 0.001f);
    
    
}
//区尾高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {

    return CGSizeMake(SCREEN_WIDTH, 0.001f);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section==0) {
        NSString *str = self.historyArray[indexPath.row];
        [self.historyArray removeObject:str];
        [self.historyArray insertObject:str atIndex:0];
        [self.collectionView reloadData];
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:self.historyArray options:NSJSONWritingPrettyPrinted error:nil];
        if (self.type==0) {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCSearch_Home_FootBall];
        }else if (self.type==1) {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCSearch_BF_FootBall];
        }else  if (self.type==2) {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCSearch_BF_BasketBall];
        }
        else {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCSearch_BigData];
        }
        if (self.JCSearchBlock) {
            self.JCSearchBlock(str);
        }
    }
    if (indexPath.section==1) {
        NSString *str = self.hotArray[indexPath.row];
        
//        NSMutableArray *dataSource = [NSMutableArray arrayWithArray:dataArray];
        if ([self.historyArray containsObject:str]) {
            [self.historyArray removeObject:str];
            [self.historyArray insertObject:str atIndex:0];
        }else{
            [self.historyArray insertObject:str atIndex:0];
        }
        if (self.historyArray.count>10) {
            [self.historyArray removeLastObject];
        }
        [self.collectionView reloadData];
        
        NSData *data = [NSJSONSerialization dataWithJSONObject:self.historyArray options:NSJSONWritingPrettyPrinted error:nil];
        if (self.type==0) {
            [[NSUserDefaults standardUserDefaults] setObject:data forKey:JCSearch_Home_FootBall];
        }
        
        
        
        if (self.JCSearchBlock) {
            self.JCSearchBlock(str);
        }
    }


    

}

- (void)setHistoryArray:(NSMutableArray *)historyArray {
    _historyArray = historyArray;
    [self.collectionView reloadData];
}

- (void)setHotArray:(NSArray *)hotArray {
    _hotArray = hotArray;
    [self.collectionView reloadData];
}



- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        ZQSearchNormalLayout *flowLayout=[[ZQSearchNormalLayout alloc] init];
        flowLayout.sectionInset = UIEdgeInsetsMake(0,15,0,15);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCClearColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[JCSearchHistoryItemCell class]
            forCellWithReuseIdentifier:@"JCSearchHistoryItemCell"];
        [_collectionView registerClass:[JCHistorySeachTitleView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"JCHistorySeachTitleView"];
        [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionReusableView"];

    }
    return _collectionView;
}
@end
