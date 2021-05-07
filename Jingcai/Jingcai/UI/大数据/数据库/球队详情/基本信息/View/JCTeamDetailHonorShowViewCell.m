//
//  JCTeamDetailHonorShowViewCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/7/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCTeamDetailHonorShowViewCell.h"
#import "JCTeamDetailHonorShowYearCell.h"
@implementation JCTeamDetailHonorShowViewCell

- (void)initViews {
    self.backgroundColor = JCWhiteColor;
    [self addSubview:self.headImgView];
    [self.headImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(20));
        make.top.offset(AUTO(8));
        make.size.mas_equalTo(CGSizeMake(AUTO(42), AUTO(42)));
    }];
    
    [self addSubview:self.nameLab];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headImgView);
        make.left.equalTo(self.headImgView.mas_right).offset(AUTO(17));
        make.height.mas_equalTo(AUTO(18));
    }];
    
    [self addSubview:self.numberLab];
    [self.numberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.nameLab);
        make.left.equalTo(self.nameLab.mas_right);
    }];
    
    [self addSubview:self.infoView];
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab);
        make.width.mas_equalTo(AUTO(67)*3);
        make.top.equalTo(self.nameLab.mas_bottom).offset(2);
        make.bottom.offset(0);
    }];
    
    [self.infoView addSubview:self.collectionView];
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

    return self.model.times.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    return CGSizeMake(AUTO(65), AUTO(15));
    
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

    JCTeamDetailHonorShowYearCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCTeamDetailHonorShowYearCell" forIndexPath:indexPath];
    NSString *time = self.model.times[indexPath.row];
    cell.titleLab.text = [NSString stringWithFormat:@"%@",time];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {


}

- (void)setDataSource:(NSMutableArray *)dataSource {
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
        
        [_collectionView registerClass:[JCTeamDetailHonorShowYearCell class]
            forCellWithReuseIdentifier:@"JCTeamDetailHonorShowYearCell"];
        [_collectionView registerClass:[UICollectionViewCell class]
            forCellWithReuseIdentifier:@"UICollectionViewCell"];
        
    }
    return _collectionView;
}

- (void)setModel:(JCTeamDetailInfoHonorModel *)model {
    _model = model;
    [self.headImgView sd_setImageWithURL:[NSURL URLWithString:model.logo] placeholderImage:JCIMAGE(@"default_icon_cp_mr")];
    self.nameLab.text = model.title_zh;
    self.numberLab.text = [NSString stringWithFormat:@"(%@)",model.num];
    [self.collectionView reloadData];
}





- (UIImageView *)headImgView {
    if (!_headImgView) {
        _headImgView = [UIImageView new];
        _headImgView.contentMode = UIViewContentModeScaleAspectFit;
    }
    return _headImgView;
}

- (UILabel *)nameLab {
    if (!_nameLab) {
        _nameLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _nameLab;
}


- (UILabel *)numberLab {
    if (!_numberLab) {
        _numberLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _numberLab;
}

- (UIView *)infoView {
    if (!_infoView) {
        _infoView = [UIView new];
    }
    return _infoView;
}

@end
