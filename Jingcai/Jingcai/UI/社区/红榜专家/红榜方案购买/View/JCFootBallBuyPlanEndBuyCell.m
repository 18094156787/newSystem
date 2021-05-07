//
//  JCFootBallBuyPlanEndBuyCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCFootBallBuyPlanEndBuyCell.h"
#import "YBImageBrowser.h"
@implementation JCFootBallBuyPlanEndBuyCell

- (void)initViews {
    
    [self.contentView addSubview:self.introduceLab];
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-15));
    }];
    
//    [self.contentView addSubview:self.collectionView];
//    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.top.equalTo(self.introduceLab.mas_bottom).offset(AUTO(10));
//        make.height.mas_equalTo(0);
//    }];
    
    UIImageView *bgView = [UIImageView new];
    bgView.image = JCIMAGE(@"bg_wz");
    [self.contentView addSubview:bgView];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(7));
        make.right.offset(AUTO(-7));
        make.top.equalTo(self.introduceLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(150));
    }];
    self.bgView = bgView;
    
    UILabel *titleLab = [UILabel initWithTitle:@"已截止，无法购买付费内容" andFont:AUTO(15) andWeight:2 andTextColor:COLOR_E3241F andBackgroundColor:JCClearColor andTextAlignment:0];
    [bgView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.offset(AUTO(30));
    }];
    
  
    
    [bgView addSubview:self.endTimeLab];
    [self.endTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(10));
        make.centerX.equalTo(bgView);
    }];
    
    [bgView addSubview:self.countLab];
     [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
         make.right.offset(AUTO(-10));
         make.bottom.offset(AUTO(-30));
     }];
    
    
    UILabel *infoLab = [UILabel initWithTitle:@"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];//友情提示：文章内容不代表平台观点！关于文章有疑问请联系我们。务必谨防诈骗，避免财产损失。
    infoLab.numberOfLines= 0;
    [self.contentView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(bgView.mas_bottom);
        make.bottom.offset(AUTO(-20));
    }];
    

}

#pragma mark -- UICollectionViewDataSource
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

//定义展示的UICollectionViewCell的个数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    return self.tjInfoDetailBall.image.count;
    
}

#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个Item 的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{

    JCPostImageModel *model = self.tjInfoDetailBall.image[indexPath.row];
    if (self.tjInfoDetailBall.image.count==1) {//model.height>0&&model.size.width>0
        return [model getImgSize];
    }
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
    
    JCImgCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"JCImgCollectionViewCell" forIndexPath:indexPath];
    cell.countLab.hidden = YES;
    JCPostImageModel *model = self.tjInfoDetailBall.image[indexPath.row];
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.image] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
       

    }];

    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    // 图片预览
    NSMutableArray *datas = [NSMutableArray array];
    [self.tjInfoDetailBall.image enumerateObjectsUsingBlock:^(JCPostImageModel *_Nonnull model, NSUInteger idx, BOOL * _Nonnull stop) {
            JCImgCollectionViewCell *cell = (JCImgCollectionViewCell *)[collectionView cellForItemAtIndexPath:[NSIndexPath indexPathForRow:idx inSection:0]];
//        // 网络图片
        YBIBImageData *data = [YBIBImageData new];
        data.imageURL = [NSURL URLWithString:model.image];
//        data.projectiveView = cell.imgView;
        [datas addObject:data];
    }];


    YBImageBrowser *browser = [YBImageBrowser new];
    browser.shouldHideStatusBar = NO;
    browser.dataSourceArray = datas;
    browser.currentPage = indexPath.row;
    [browser show];
}



- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
    _tjInfoDetailBall = tjInfoDetailBall;
    
    self.introduceLab.text = tjInfoDetailBall.citation;
    
    if (tjInfoDetailBall.is_ai&&tjInfoDetailBall.citation.length==0) {
        self.backgroundColor = COLOR_F4F6F9;
        [self.introduceLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(-20));
        }];
    }
    
    if (tjInfoDetailBall.image.count==0) {
             [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
             make.height.mas_equalTo(0);
         }];
     }else{
         JCPostImageModel *model = tjInfoDetailBall.image.firstObject;
         if (tjInfoDetailBall.image.count==1&&model.size.height) {
             
             [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.height.mas_equalTo(model.size.height);
             }];
         }else{
             [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
                 make.height.mas_equalTo(AUTO(110));
             }];
         }

     }
         [self.collectionView reloadData];
    
    
    self.endTimeLab.text = [NSString stringWithFormat:@"截止时间：%@",[NSDate wholeTimeStringToMinuteWithInterval:[tjInfoDetailBall.str_time longLongValue]]];
    
    if (tjInfoDetailBall.user.count>0) {
        NSString *count = [NSString stringWithFormat:@"%ld人已购买",tjInfoDetailBall.user.count];
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:count];
        NSRange range = [count rangeOfString:[NSString stringWithFormat:@"%ld",tjInfoDetailBall.user.count]];
        [attrTitle addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
        self.countLab.attributedText = attrTitle;
        
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(150));
        }];
    }else {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(110));
        }];
        self.countLab.text = @"";
    }
    
    
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<tjInfoDetailBall.user.count; i++) {
        JCWExpertBall *model = tjInfoDetailBall.user[i];
         UIImageView *imgView = [UIImageView new];
         [imgView hg_setAllCornerWithCornerRadius:AUTO(15)];
        imgView.frame = CGRectMake(AUTO(15)+AUTO(15)*i, AUTO(95), AUTO(30), AUTO(30));
        [imgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
         [array addObject:imgView];
         [self.bgView addSubview:imgView];
     }
//
}


- (UILabel *)introduceLab {
    if (!_introduceLab) {
        _introduceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _introduceLab.numberOfLines = 0;
    }
    return _introduceLab;
}


- (UILabel *)endTimeLab {
    if (!_endTimeLab) {
        _endTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _endTimeLab;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        //确定是水平滚动，还是垂直滚动
        UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
//        flowLayout.sectionInset = UIEdgeInsetsMake(0, 0,AUTO(10), 0);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
        _collectionView.dataSource= self;
        _collectionView.delegate=self;
        [_collectionView setBackgroundColor:JCWhiteColor];
        _collectionView.scrollEnabled = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        [_collectionView registerClass:[JCImgCollectionViewCell class]
            forCellWithReuseIdentifier:@"JCImgCollectionViewCell"];
    }
    return _collectionView;
}
@end
