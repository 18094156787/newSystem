//
//  JCPlaneDetailQRcodeCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCPlaneDetailQRcodeCell.h"
#import "YBImageBrowser.h"
#import "JCQR_CollectionViewCell.h"
@implementation JCPlaneDetailQRcodeCell

- (void)initViews {
    
//    [COLOR_000000 colorWithAlphaComponent:0.05]
    
    [self.contentView addSubview:self.lineView];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.offset(0);
        make.height.mas_equalTo(1);
    }];

    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(10));
        make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
        make.height.mas_equalTo(AUTO(110));
    }];
    
    [self.contentView addSubview:self.infoLab];
    [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(10));
        make.bottom.offset(AUTO(-15));
    }];
}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.model.url.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    float width = AUTO(110);
    return CGSizeMake(width, width);
    
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
    
    JCQR_CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCQR_CollectionViewCell" forIndexPath:indexPath];
    NSString *url = self.model.url[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        if (error) {
            cell.imgView.image = JCIMAGE(@"error_pic");
        }

    }];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    

    
    // 图片预览
    NSMutableArray *datas = [NSMutableArray array];
    [self.model.url enumerateObjectsUsingBlock:^(NSString *_Nonnull url, NSUInteger idx, BOOL * _Nonnull stop) {
            JCQR_CollectionViewCell *cell = (JCQR_CollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
//        // 网络图片
        YBIBImageData *data = [YBIBImageData new];
//        data.image = ^UIImage * _Nullable{
//
//        };
        data.imageURL = [NSURL URLWithString:url];
//        data.projectiveView = cell.imgView;
        [datas addObject:data];
    }];


    YBImageBrowser *browser = [YBImageBrowser new];
    browser.shouldHideStatusBar = NO;
    browser.dataSourceArray = datas;
    browser.currentPage = indexPath.row;
    [browser show];
}

- (void)setModel:(JCPlaneDetailQRModel *)model {
    _model = model;
    if (model.url.count==0&&model.desc.length==0) {
        self.lineView.hidden = YES;
    }

    [self.collectionView reloadData];
    self.infoLab.text = model.desc;
    if (model.url.count==0) {
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
        
        [self.infoLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom).offset(0);
        }];
        
        return;
    }
    
    if (model.url.count>3) {
        int height = ceil(model.url.count/3.0f);
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(118)*height);
        }];
        
        return;
    }
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0,AUTO(10), 0);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource=self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCWhiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;

        [_collectionView registerClass:[JCQR_CollectionViewCell class]
            forCellWithReuseIdentifier:@"JCQR_CollectionViewCell"];
    }
    return _collectionView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab  = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.numberOfLines = 0;
    }
    return _infoLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = COLOR_F0F0F0;
    }
    return _lineView;
}
@end
