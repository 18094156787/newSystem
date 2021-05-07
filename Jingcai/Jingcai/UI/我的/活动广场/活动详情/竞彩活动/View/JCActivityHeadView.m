//
//  JCActivityHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/24.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCActivityHeadView.h"
#import "JCActivityGuessResultItemCell.h"
@implementation JCActivityHeadView

- (void)initViews {
    [self addSubview:self.bgImgView];
    [self.bgImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    
    [self addSubview:self.imgView];
    [self.imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(25);
        make.centerX.equalTo(self.bgImgView);
        make.size.mas_equalTo(CGSizeMake(191, 194));
    }];
    
    [self.imgView addSubview:self.whImgView];
    [self.whImgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(27);
        make.centerX.equalTo(self.imgView);
        make.size.mas_equalTo(CGSizeMake(48, 64));
    }];
    
    [self.imgView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(27);
        make.centerX.equalTo(self.imgView);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    [self addSubview:self.moreLab];
    [self.moreLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.offset(0);
        make.right.offset(AUTO(-15));
        make.height.mas_equalTo(25);
    }];
    
    WeakSelf;
    [self.imgView bk_whenTapped:^{
        if (weakSelf.dataSource.count>0) {
            weakSelf.resultView.dataArray = weakSelf.dataSource;
            [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.resultView];
        }
    }];
    [self.moreLab bk_whenTapped:^{
        if (weakSelf.dataSource.count>0) {
            weakSelf.resultView.dataArray = weakSelf.dataSource;
            [[UIApplication sharedApplication].keyWindow addSubview:weakSelf.resultView];
        }
    }];
    
    self.countDown = [[CountDown alloc] init];
    [self.countDown countDownWithNumer:3 SECBlock:^{
        if (weakSelf.dataSource.count>1) {
            weakSelf.index = weakSelf.index + 1;
            weakSelf.index = weakSelf.index >= self.dataSource.count ? 0 : weakSelf.index;
            [weakSelf.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForRow:weakSelf.index inSection:0] atScrollPosition:weakSelf.index animated:YES];
            NSLog(@"%ld",weakSelf.index);
//                    collectionView.scrollToItem(at: IndexPath.init(row: index, section: 0), at: .centeredHorizontally, animated: true)
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

    return CGSizeMake(100, 100);
    
}


//行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{

    return 0;
}
//列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{

    return 0;
}


//每个UICollectionView展示的内容
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCActivityGuessResultItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCActivityGuessResultItemCell" forIndexPath:indexPath];
    cell.model = self.dataSource[indexPath.row];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {


}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    self.whImgView.hidden = dataSource.count==0?NO:YES;
    self.moreLab.hidden = dataSource.count==0?YES:NO;
    [self.collectionView reloadData];
}

- (void)setDetailModel:(JCActivityDetailModel *)detailModel {
    if (!detailModel) {
        return;
    }
    _detailModel = detailModel;
    [self.bgImgView sd_setImageWithURL:[NSURL URLWithString:detailModel.top_image_url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        float rate = image.size.width/SCREEN_WIDTH;
        float height = image.size.height;
        if (rate>0) {
            height = height/rate;
        }
        

        [self.imgView mas_updateConstraints:^(MASConstraintMaker *make) {
            NSLog(@"图片高度%.0f",image.size.height);
          
            make.height.mas_equalTo(height);//240+25
        }];
        
        [self.imgView mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.bottom.offset(25);
            make.centerX.equalTo(self.bgImgView);
            make.size.mas_equalTo(CGSizeMake(191, 194));
        }];
        
        if (self.JCHeightBlock) {
            
            self.JCHeightBlock(height);
        }
    }];
//    self.timeLab.text = [NSString stringWithFormat:@"%@-%@",detailModel.start_time,detailModel.end_time];
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
        _collectionView.pagingEnabled = YES;
        [_collectionView setBackgroundColor:JCClearColor];
//        _collectionView.scrollEnabled = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[JCActivityGuessResultItemCell class]
            forCellWithReuseIdentifier:@"JCActivityGuessResultItemCell"];

        
    }
    return _collectionView;
}


- (UIImageView *)bgImgView {
    if (!_bgImgView) {
        _bgImgView = [UIImageView new];
        _bgImgView.userInteractionEnabled = YES;
    }
    return _bgImgView;
}

- (UIImageView *)imgView {
    if (!_imgView) {
        _imgView = [UIImageView new];
        _imgView.userInteractionEnabled = YES;
        _imgView.image = JCIMAGE(@"active_img_circle");
    }
    return _imgView;
}

- (UIImageView *)whImgView {
    if (!_whImgView) {
        _whImgView = [UIImageView new];
        _whImgView.image = JCIMAGE(@"active_ic_question");
        _whImgView.userInteractionEnabled = YES;
    }
    return _whImgView;
}

- (JCActivityGuessResultShowView *)resultView {
    if (!_resultView) {
        _resultView = [JCActivityGuessResultShowView new];
        _resultView.frame = CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    }
    return _resultView;
}
- (UILabel *)moreLab {
    if (!_moreLab) {
        _moreLab = [UILabel initWithTitle:@"点击查看更多结果" andFont:AUTO(9) andWeight:1 andTextColor:JCWhiteColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _moreLab.hidden = YES;
        _moreLab.userInteractionEnabled = YES;
    }
    return _moreLab;
}
@end
