//
//  JCFootBallBuyPlaneUserCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFootBallBuyPlaneUserCell.h"

@implementation JCFootBallBuyPlaneUserCell

- (void)initViews {
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(30));
    }];
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    if (!self.collectionView) {
        self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, AUTO(135)) collectionViewLayout:flowLayout];
    }

    self.collectionView.contentInset = UIEdgeInsetsMake(AUTO(15), AUTO(15), 0, AUTO(15));
    self.collectionView.dataSource=self;
    self.collectionView.delegate=self;
    [self.collectionView setBackgroundColor:JCWhiteColor];
    self.collectionView.scrollEnabled = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    //    注册Cell，必须要有
    [self.collectionView registerClass:[JCFootBallNormalHeadCell class] forCellWithReuseIdentifier:@"JCFootBallNormalHeadCell"];
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self.contentView addSubview:self.moreBtn];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.collectionView.mas_bottom);
        make.height.mas_equalTo(AUTO(45));
    }];
//    self.moreBtn.hidden = YES;
}
#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(AUTO(10), AUTO(10));
    
}


//////列间距
//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//
//    if (self.dataArray.count>=8) {
//        float length = (SCREEN_WIDTH-AUTO(30)-AUTO(30)*8)/7.0f;
//        return length;
//    }
//    return AUTO(5);
//}
//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
// r
    return AUTO(5);
}

//定义每个UICollectionView 的 margin
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    JCFootBallNormalHeadCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCFootBallNormalHeadCell" forIndexPath:indexPath];
    JCPlanBuyPersonModel *model = self.dataArray[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.user_img]];
//    cell.model = self.daVArray[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    JCFootBallAuthorDetailWMViewController *vc = [JCFootBallAuthorDetailWMViewController new];
//    JCWExpertBall *model = self.daVArray[indexPath.row];
//    vc.autherID = model.id;
//    [[self getViewController].navigationController pushViewController:vc animated:YES];
    
}

- (void)setDataArray:(NSArray *)dataArray {
    _dataArray = dataArray;

    NSInteger count = dataArray.count;
//    if (dataArray.count>24) {
//        count = 24;
//    }
    if (dataArray.count>8) {
        float height = ceil(count/8.0)*AUTO(40)+AUTO(15);
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
//            make.edges.insets(UIEdgeInsetsMake(AUTO(40), 0, AUTO(40), 0));
            make.left.offset(0);
            make.right.offset(0);
            make.top.offset(AUTO(40));
            make.height.mas_equalTo(height);
            
        }];
    }else {
        [self.collectionView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self);
            make.top.offset(AUTO(40));
            make.height.mas_equalTo(AUTO(50));
            make.width.mas_equalTo(AUTO(40)*count+AUTO(20));
        }];
    }
    [self.collectionView reloadData];
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel labelTitle:@"该文章已有1888人查看" andFont:AUTO(12) andWeight:0 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn = [UIButton initWithText:@"查看更多>" FontSize:AUTO(15) BackGroundColor:JCClearColor TextColors:COLOR_999999];
        [_moreBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 0, AUTO(15), 0)];
    }
    return _moreBtn;
}

@end
