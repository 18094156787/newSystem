//
//  JCBuyPlanLock_GZH_Cell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/10/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBuyPlanLock_GZH_Cell.h"
#import "YBImageBrowser.h"
@implementation JCBuyPlanLock_GZH_Cell

- (void)initViews {
    
    [self.contentView addSubview:self.introduceLab];
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(8));
        make.right.offset(AUTO(-15));
//        make.bottom.offset(-15);
//        make.height.mas_equalTo(100);
    }];
    
    
    [self.contentView addSubview:self.topBgView];
    [self.topBgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.equalTo(self.introduceLab.mas_bottom).offset(AUTO(15));
//        make.height.mas_equalTo(AUTO(180));
        make.bottom.offset(-AUTO(15));
    }];

    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [self.topBgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    UILabel *label = [UILabel initWithTitle:@"方案详情" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.topBgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(lineView);
        make.height.mas_equalTo(16);
    }];

    UILabel *titleLab = [UILabel initWithTitle:@"购买后可解锁文章" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.topBgView addSubview:titleLab];
    self.titleLab = titleLab;
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topBgView);
        make.top.equalTo(label.mas_bottom).offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];

    UILabel *endTimeLab = [UILabel initWithTitle:@"距售卖截止还有" andFont:AUTO(12) andWeight:1 andTextColor:[COLOR_000000 colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.topBgView addSubview:endTimeLab];
    [endTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(titleLab.mas_bottom).offset(AUTO(5));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self.topBgView addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(endTimeLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(30));
//        make.bottom.offset(AUTO(-15));
    }];
    
        [self.topBgView addSubview:self.endTimeLab];
        [self.endTimeLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.contentView);
            make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(5));
//            make.height.mas_equalTo(AUTO(30));
    //        make.bottom.offset(AUTO(-15));
        }];
    
    UILabel *tipLab = [UILabel initWithTitle:@"*文章为比赛分析，仅作参考使用，请理性购买。" andFont:AUTO(10) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.topBgView addSubview:tipLab];
    [tipLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.contentView);
        make.top.equalTo(self.endTimeLab.mas_bottom).offset(AUTO(10));
        make.bottom.offset(AUTO(0));
    }];


//    UILabel *infoLab = [UILabel initWithTitle:@"友情提示：文章内容不代表平台观点！关于文章有疑问请联系我们。务必谨防诈骗，避免财产损失。" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];//友情提示：文章内容不代表平台观点！关于文章有疑问请联系我们。务必谨防诈骗，避免财产损失。
//    infoLab.numberOfLines= 0;
//    [self.topBgView addSubview:infoLab];
//    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.offset(AUTO(15));
//        make.right.offset(AUTO(-15));
//        make.top.equalTo(tipLab.mas_bottom).offset(AUTO(15));
//        make.bottom.offset(AUTO(0));
//    }];


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

- (void)setPayInfoModel:(JCWTjInfoBall *)payInfoModel {
    _payInfoModel = payInfoModel;
    self.introduceLab.text = payInfoModel.subtitle;
    if (payInfoModel.is_end==1) {
        self.titleLab.text = @"售卖已截止，文章无法购买";
    }
    if (payInfoModel.subtitle.length==0) {
       [self.contentView addSubview:self.topBgView];
        [self.topBgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.introduceLab.mas_bottom);
        }];
    }
        self.endTimeLab.text = [NSString stringWithFormat:@"%@ 截止购买",[NSDate wholeTimeStringToMinuteWithInterval:[payInfoModel.end_time longLongValue]]];

 
}

- (void)setTjInfoDetailBall:(JCWTjInfoDetailBall *)tjInfoDetailBall {
    _tjInfoDetailBall = tjInfoDetailBall;
    self.bzfhImageView.hidden = self.tjInfoDetailBall.out_info.length>0?NO:YES;
//    self.introduceLab.text = tjInfoDetailBall.citation;
    self.introduceLab.text = tjInfoDetailBall.subtitle;
    if (tjInfoDetailBall.subtitle.length==0) {
           [self.contentView addSubview:self.topBgView];
            [self.topBgView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.introduceLab.mas_bottom);
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
            make.height.mas_equalTo(AUTO(180));
        }];
    }else {
        [self.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(150));
        }];
        self.countLab.text = @"";
    }

        
        
        
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<tjInfoDetailBall.user.count; i++) {
        JCWExpertBall *model = tjInfoDetailBall.user[i];
         UIImageView *imgView = [UIImageView new];
         [imgView hg_setAllCornerWithCornerRadius:AUTO(15)];
        imgView.frame = CGRectMake(AUTO(15)+AUTO(15)*i, AUTO(125), AUTO(30), AUTO(30));
        [imgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
         [array addObject:imgView];
         [self.bgView addSubview:imgView];
     }
    
    self.priceLab.text = tjInfoDetailBall.sf;

}


- (void)setHours:(NSString *)hours {
    _hours = hours;
    self.hoursLab.text = hours;
}

- (void)setMinutes:(NSString *)minutes {
    _minutes = minutes;
    self.minutesLab.text = minutes;
}

- (void)setSeconds:(NSString *)seconds {
    _seconds = seconds;
    self.secondsLab.text = seconds;
}

- (UILabel *)introduceLab {
    if (!_introduceLab) {
        _introduceLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:[COLOR_2F2F2F colorWithAlphaComponent:0.6] andBackgroundColor:JCClearColor andTextAlignment:0];
        _introduceLab.numberOfLines = 0;
    }
    return _introduceLab;
}

- (UILabel *)hoursLab {
    if (!_hoursLab) {
        _hoursLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_505050 andTextAlignment:NSTextAlignmentCenter];
        [_hoursLab hg_setAllCornerWithCornerRadius:1];
    }
    return _hoursLab;
}

- (UILabel *)minutesLab {
    if (!_minutesLab) {
        _minutesLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_505050 andTextAlignment:NSTextAlignmentCenter];
        [_minutesLab hg_setAllCornerWithCornerRadius:1];
    }
    return _minutesLab;
}

- (UILabel *)secondsLab {
    if (!_secondsLab) {
        _secondsLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:2 andTextColor:JCWhiteColor andBackgroundColor:COLOR_505050 andTextAlignment:NSTextAlignmentCenter];
        [_secondsLab hg_setAllCornerWithCornerRadius:1];
    }
    return _secondsLab;
}

- (UILabel *)endTimeLab {
    if (!_endTimeLab) {
        _endTimeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _endTimeLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(22) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    }
    return _timeLab;
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

- (UIImageView *)bzfhImageView {
    if (!_bzfhImageView) {
        _bzfhImageView = [UIImageView new];
        _bzfhImageView.image = JCIMAGE(@"ic_bzfh_big");
        _bzfhImageView.hidden = YES;
    }
    return _bzfhImageView;
}

- (UILabel *)infoLab {
    if (!_infoLab) {
        _infoLab = [UILabel initWithTitle:@"*文章为比赛分析，仅作参考使用，请理性购买。" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
        _infoLab.hidden = YES;
    }
    return _infoLab;
}

-(UIImageView *)iconImageView {
    if (!_iconImageView) {
        _iconImageView = [UIImageView new];
        _iconImageView.image = JCIMAGE(@"icon_hongbi");
    }
    return _iconImageView;
}

- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UIView *)topBgView {
    if (!_topBgView) {
        _topBgView = [UIView new];
    }
    return _topBgView;
}

@end
