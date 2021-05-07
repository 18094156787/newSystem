//
//  JCHongbangTopRankCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangTopRankCell.h"
#import "JCHongbangTopRankItemCell.h"
#import "JCFootBallAuthorDetailWMViewController.h"
#import "JCExpertWMViewController.h"
#import "JCHongbangWMstckyVC.h"



@interface JCHongbangTopRankCell ()

@property (nonatomic, strong) UILabel *lastLab;

@end

@implementation JCHongbangTopRankCell

- (void)initViews {
    
    self.backgroundColor = COLOR_F4F6F9;
    self.contentView.backgroundColor = COLOR_F4F6F9;
    UIView *bgView = [UIView new];
    [self addSubview:bgView];
    bgView.backgroundColor = COLOR_F4F6F9;
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(0, AUTO(13), 0, AUTO(15)));
    }];
    
    [bgView addSubview:self.titleLab];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(5));
        make.left.offset(0);
        make.size.mas_equalTo(CGSizeMake(AUTO(70), AUTO(25)));
    }];
    
    [bgView addSubview:self.lhLab];
//    [self.lhLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(bgView);
//        make.centerY.equalTo(self.titleLab);
//        make.size.mas_equalTo(CGSizeMake(AUTO(0), AUTO(30)));
//    }];
    
    [bgView addSubview:self.lineView];
//    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.lhLab.mas_left);
//        make.centerY.equalTo(self.titleLab);
//        make.size.mas_equalTo(CGSizeMake(1, 8.5));
//    }];
    
    [bgView addSubview:self.hbLab];
//    [self.hbLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.lineView.mas_left);
//        make.centerY.equalTo(self.titleLab);
//        make.size.mas_equalTo(CGSizeMake(AUTO(0), AUTO(30)));
//    }];
    
    [bgView addSubview:self.lineView1];
//    [self.lineView1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.hbLab.mas_left);
//        make.centerY.equalTo(self.titleLab);
//        make.size.mas_equalTo(CGSizeMake(1, 8.5));
//    }];
    
    [bgView addSubview:self.mzLab];
//    [self.mzLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.equalTo(self.lineView1.mas_left);
//        make.centerY.equalTo(self.titleLab);
//        make.size.mas_equalTo(CGSizeMake(AUTO(0), AUTO(30)));
//    }];
    
//
    [bgView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(bgView);
        make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(100));
    }];
    
    self.backgroundColor = COLOR_F4F6F9;
    self.collectionView.backgroundColor = COLOR_F4F6F9;
    
    [bgView addSubview:self.moreBtn];
    [self.moreBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(5));
        make.centerX.equalTo(bgView);
       make.size.mas_equalTo(CGSizeMake(AUTO(80), AUTO(25)));
    }];
    
    WeakSelf;
    [self.mzLab bk_whenTapped:^{
        [weakSelf.dataSource enumerateObjectsUsingBlock:^(JCCommunityRankInfoModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
            if ([obj.type intValue]==1) {
                weakSelf.model = obj;
                [weakSelf.collectionView reloadData];
                [weakSelf currentSelRank];
                *stop = YES;
            }
        }];
    }];
    
    [self.hbLab bk_whenTapped:^{
         [weakSelf.dataSource enumerateObjectsUsingBlock:^(JCCommunityRankInfoModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             if ([obj.type intValue]==2) {
                 weakSelf.model = obj;
                 [weakSelf.collectionView reloadData];
                 [weakSelf currentSelRank];
                 *stop = YES;
             }
         }];
     }];
    
    [self.lhLab bk_whenTapped:^{
         [weakSelf.dataSource enumerateObjectsUsingBlock:^(JCCommunityRankInfoModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
             if ([obj.type intValue]==3) {
                 weakSelf.model = obj;
                 [weakSelf.collectionView reloadData];
                 [weakSelf currentSelRank];
                 *stop = YES;
             }
         }];
     }];
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{


    return self.model.list.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(AUTO(80), AUTO(96));
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return AUTO(8);
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return AUTO(5);
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCHongbangTopRankItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCHongbangTopRankItemCell" forIndexPath:indexPath];
//    cell.isHongbang = self.isHongbang;

    cell.model = self.model.list[indexPath.row];
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    JCWExpertBall *model = self.model.list[indexPath.row];
    JCHongbangWMstckyVC * userVC = [JCHongbangWMstckyVC new];
    userVC.autherID = model.user_id;
    [[self getViewController].navigationController pushViewController:userVC animated:YES];
    
}



- (void)setDataSource:(NSArray *)dataSource{
    _dataSource = dataSource;
    if (dataSource.count>0) {
        self.model = dataSource.firstObject;
        [self currentSelRank];
    }
    NSMutableArray *dataArray = [NSMutableArray array];
    [dataSource enumerateObjectsUsingBlock:^(JCCommunityRankInfoModel *model, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([model.type intValue]==1) {
            [dataArray insertObject:self.mzLab atIndex:0];
        }
        if ([model.type intValue]==2) {
            [dataArray insertObject:self.hbLab atIndex:0];
        }
        if ([model.type intValue]==3) {
            [dataArray insertObject:self.lhLab atIndex:0];
        }
    }];

//    UILabel *lastLab;
    [dataArray enumerateObjectsUsingBlock:^(UILabel *label, NSUInteger idx, BOOL * _Nonnull stop) {
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            if (idx==0) {
                make.right.offset(0);
            }else{
                make.right.equalTo(self.lastLab.mas_left);
            }
            make.centerY.equalTo(self.titleLab);
            make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(30)));
        }];
        if (idx>0&&dataSource.count>0) {
            UIView *lineView = [UIView new];
            lineView.backgroundColor =COLOR_DDDDDD;
            [label addSubview:lineView];
            [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.left.equalTo(self.lastLab);
                make.centerY.equalTo(self.titleLab);
                make.size.mas_equalTo(CGSizeMake(1, 8.5));
            }];
        }

        self.lastLab = label;
    }];
    
    
//    [dataSource enumerateObjectsUsingBlock:^(JCCommunityRankInfoModel *obj, NSUInteger idx, BOOL * _Nonnull stop) {
//        if ([obj.type intValue]==1) {
//            [self.mzLab mas_updateConstraints:^(MASConstraintMaker *make) {
//                 make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(30)));
//             }];
//        }
//        if ([obj.type intValue]==2) {
//            [self.hbLab mas_updateConstraints:^(MASConstraintMaker *make) {
//                 make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(30)));
//             }];
//        }
//        if ([obj.type intValue]==3) {
//            [self.lhLab mas_updateConstraints:^(MASConstraintMaker *make) {
//                 make.size.mas_equalTo(CGSizeMake(AUTO(50), AUTO(30)));
//             }];
//        }
//
//    }];
    [self.collectionView reloadData];
}

- (void)currentSelRank {
    if ([self.model.type intValue]==1) {
        self.mzLab.textColor = JCBaseColor;
        self.hbLab.textColor = COLOR_999999;
        self.lhLab.textColor = COLOR_999999;
    }
    if ([self.model.type intValue]==2) {
        self.mzLab.textColor = COLOR_999999;
        self.hbLab.textColor = JCBaseColor;
        self.lhLab.textColor = COLOR_999999;
    }
    if ([self.model.type intValue]==3) {
        self.mzLab.textColor = COLOR_999999;
        self.hbLab.textColor = COLOR_999999;
        self.lhLab.textColor = JCBaseColor;
    }
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"TOP榜单" andFont:AUTO(17) andWeight:3 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _titleLab;
}

- (UILabel *)mzLab {
    if (!_mzLab) {
        _mzLab = [UILabel initWithTitle:@"命中率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _mzLab.userInteractionEnabled = YES;
    }
    return _mzLab;
}

- (UILabel *)hbLab {
    if (!_hbLab) {
        _hbLab = [UILabel initWithTitle:@"回报率" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _hbLab.userInteractionEnabled = YES;
    }
    return _hbLab;
}

- (UILabel *)lhLab {
    if (!_lhLab) {
        _lhLab = [UILabel initWithTitle:@"连红数" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _lhLab.userInteractionEnabled = YES;
    }
    return _lhLab;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView;
}

- (UIView *)lineView1 {
    if (!_lineView1) {
        _lineView1 = [UIView new];
        _lineView1.backgroundColor = COLOR_DDDDDD;
    }
    return _lineView1;
}
- (UIButton *)moreBtn {
    if (!_moreBtn) {
        _moreBtn  = [UIButton initWithText:@"查看更多" FontSize:AUTO(13) Weight:1 BackGroundColor:JCClearColor TextColors:COLOR_999999];
    }
    return _moreBtn;
}


- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(0,AUTO(20),0, AUTO(20));
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCClearColor];
        _collectionView.scrollEnabled = YES;
        _collectionView.showsHorizontalScrollIndicator = NO;
        
        [_collectionView registerClass:[JCHongbangTopRankItemCell class]
            forCellWithReuseIdentifier:@"JCHongbangTopRankItemCell"];
//        [_collectionView registerClass:[JCCommunityMoreTopicCell class]
//            forCellWithReuseIdentifier:@"JCCommunityMoreTopicCell"];
        
    }
    return _collectionView;
}
@end
