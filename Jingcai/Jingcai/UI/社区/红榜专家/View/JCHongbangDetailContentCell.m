//
//  JCHongbangDetailContentCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongbangDetailContentCell.h"

@implementation JCHongbangDetailContentCell

- (void)initViews {
    
    [self.contentView addSubview:self.bgView];
    [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.offset(0);
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(16));
    }];
    
    UIView *lineView = [UIView new];
    lineView.backgroundColor = JCBaseColor;
    [self.bgView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.bgView);
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];
    
    UILabel *label = [UILabel initWithTitle:@"方案详情" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self.bgView addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(lineView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(self.bgView);
    }];
    
    [self.contentView addSubview:self.contentLab];
    [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(15));
        make.right.offset(AUTO(-15));
    }];
    
    [self.contentView addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(0);
    }];
    

    
    UILabel *infoLab = [UILabel initWithTitle:@"免责声明：鲸猜足球仅为信息发布平台，并不对第三方发布的信息真实性及准确性负责，且不提供彩票售卖服务，请您注意投资风险，理性购买！" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    infoLab.numberOfLines= 0;
    self.infoLab = infoLab;
    [self.contentView addSubview:infoLab];
    [infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(35+20));
    }];
    
    [self.contentView addSubview:self.bugUserView];
    [self.bugUserView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(10));
        make.left.offset(AUTO(15));
        make.width.mas_equalTo(SCREEN_WIDTH-AUTO(30));
        make.height.mas_equalTo(AUTO(50));
//        make.bottom.offset(AUTO(-20));
    }];
    
    [self.contentView addSubview:self.countLab];
    [self.countLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(AUTO(-10));
        make.centerY.equalTo(self.bugUserView);
    }];
    
    [self.contentView addSubview:self.priceInfoView];
    [self.priceInfoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(self.bugUserView.mas_bottom);
        make.height.mas_equalTo(AUTO(30));
        make.bottom.offset(AUTO(-10));
    }];
    
    [self.contentView addSubview:self.freeLab];
    [self.freeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.centerY.equalTo(self.priceInfoView);
    }];
    

    
    [self.priceInfoView addSubview:self.priceLab];
    [self.priceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.centerY.equalTo(self.priceInfoView);
    }];
    
    [self.priceInfoView addSubview:self.refundLab];
    [self.refundLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.priceLab.mas_right).offset(2);
        make.centerY.equalTo(self.priceInfoView);
    }];
    
    [self.priceInfoView addSubview:self.payPriceLab];
    [self.payPriceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.priceInfoView);
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
    [cell.imgView sd_setImageWithURL:[NSURL URLWithString:model.url] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
       

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
        data.imageURL = [NSURL URLWithString:model.url];
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
    if (!_tjInfoDetailBall) {
        return;
    }
    if (tjInfoDetailBall.content.length>0) {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        paragraphStyle.lineSpacing = 5; // 设置行间距
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:NonNil(tjInfoDetailBall.content) attributes:@{NSParagraphStyleAttributeName: paragraphStyle}];
        self.contentLab.attributedText = attributedStr;
    }else{
        [self.contentLab mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.offset(-15);
        }];
    }

    
    NSInteger count = ceil(tjInfoDetailBall.image.count/3.0f);
    if (tjInfoDetailBall.image.count==0) {
            [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(0);
        }];
    }else{
        [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(AUTO(110)*count);
        }];
    }
        [self.collectionView reloadData];
    if (tjInfoDetailBall.content.length==0) {
        [self.infoLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.offset(AUTO(15));
            make.right.offset(AUTO(-15));
            make.top.equalTo(self.bgView.mas_bottom).offset(AUTO(15));
            make.height.mas_equalTo(AUTO(50));
        }];
        self.bgView.hidden = YES;
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.offset(0);
            make.top.offset(0);
            make.height.mas_equalTo(0);
        }];
    }
    
    
    
    
    if (tjInfoDetailBall.user.count>0) {
        NSString *count = [NSString stringWithFormat:@"%ld人已购买",tjInfoDetailBall.user.count];
        NSMutableAttributedString *attrTitle = [[NSMutableAttributedString alloc] initWithString:count];
        NSRange range = [count rangeOfString:[NSString stringWithFormat:@"%ld",tjInfoDetailBall.user.count]];
        [attrTitle addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
        self.countLab.attributedText = attrTitle;
        [self.bugUserView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(10));
            make.height.mas_equalTo(AUTO(50));
        }];
    }else{
        [self.bugUserView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.collectionView.mas_bottom).offset(AUTO(10));
//            make.top.equalTo(self.infoLab.mas_bottom).offset(AUTO(10));
            make.height.mas_equalTo(AUTO(60));
        }];
        self.countLab.text = @"";
        

    }

    
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i=0; i<tjInfoDetailBall.user.count; i++) {
        JCWExpertBall *model = tjInfoDetailBall.user[i];
         UIImageView *imgView = [UIImageView new];
         [imgView hg_setAllCornerWithCornerRadius:AUTO(15)];
        imgView.frame = CGRectMake(AUTO(15)*i, 0, AUTO(30), AUTO(30));
        [imgView sd_setImageWithURL:[NSURL URLWithString:model.user_img] placeholderImage:JCIMAGE(@"userImg_default")];
         [array addObject:imgView];
         [self.bugUserView addSubview:imgView];
     }
    
    {
        
          NSString*price = [NSString stringWithFormat:@"%@红币",@([tjInfoDetailBall.sf floatValue]/100.0f)];
        NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
        NSRange range = [price rangeOfString:@"红币"];
        if (range.location!=NSNotFound) {
              [attr addAttribute:NSForegroundColorAttributeName value:COLOR_2F2F2F range:range];
        }
        self.priceLab.attributedText = attr;
    }
    
    
//    self.refundLab.text = tjInfoDetailBall.out_info.length>0?@"不中返还":@"";
     self.refundLab.text = @"";
    if ([tjInfoDetailBall.refund_status intValue]==4) {
        self.payPriceLab.textColor = COLOR_13AE13;
        self.payPriceLab.text = @"已退款";
        
    }else{
        if (tjInfoDetailBall.pay_price.length == 0&&[tjInfoDetailBall.is_pay_show integerValue]==1) {
            //tjInfoDetailBall.pay_price.length==0有可能是支付0红币,但是后台给了空字段,所以这边判断如果是已经支付就给0
            tjInfoDetailBall.pay_price = @"0";
        }
        
        if (tjInfoDetailBall.pay_price.length>0) {
            NSString*price = [NSString stringWithFormat:@"实付: %@红币",@([tjInfoDetailBall.pay_price floatValue]/100)];
          NSMutableAttributedString *attr = [[NSMutableAttributedString alloc] initWithString:price];
          NSRange range = [price rangeOfString:[NSString stringWithFormat:@"%@",@([tjInfoDetailBall.pay_price floatValue]/100)]];
          NSRange range1 = [price rangeOfString:@"红币"];
    
          [attr addAttribute:NSForegroundColorAttributeName value:JCBaseColor range:range];
          [attr addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(12)] range:range1];
          self.payPriceLab.attributedText = attr;
        }
        //如果是自己发布的,则不显示实付价格
        if ([tjInfoDetailBall.is_self integerValue]==1) {
            self.payPriceLab.text = @"";
        }

    }
    self.priceInfoView.hidden = [tjInfoDetailBall.sf intValue]==0?YES:NO;
    self.freeLab.hidden = [tjInfoDetailBall.sf intValue]==0?NO:YES;
//    if (tjInfoDetailBall.wl>0) {
//        self.freeLab.hidden = YES;
//        self.priceInfoView.hidden = YES;
//        [self.priceInfoView mas_updateConstraints:^(MASConstraintMaker *make) {
//            make.height.mas_equalTo(0);
//        }];
//    }


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



- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;;
}

- (UIView *)bugUserView {
    if (!_bugUserView) {
        _bugUserView = [UIView new];
    }
    return _bugUserView;
}

- (UILabel *)countLab {
    if (!_countLab) {
        _countLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _countLab;
}

- (UIView *)priceInfoView {
    if (!_priceInfoView) {
        _priceInfoView = [UIView new];
    }
    return _priceInfoView;
}



- (UILabel *)priceLab {
    if (!_priceLab) {
        _priceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _priceLab;
}

- (UILabel *)refundLab {
    if (!_refundLab) {
        _refundLab = [UILabel initWithTitle:@"不中返还" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _refundLab;
}

- (UILabel *)payPriceLab {
    if (!_payPriceLab) {
        _payPriceLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _payPriceLab;
}

- (UILabel *)freeLab {
    if (!_freeLab) {
        _freeLab = [UILabel initWithTitle:@"免费" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _freeLab;
}
- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
    }
    return _bgView;
}


@end
