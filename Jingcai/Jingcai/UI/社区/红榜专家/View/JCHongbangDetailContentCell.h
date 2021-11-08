//
//  JCHongbangDetailContentCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCWTjInfoDetailBall.h"
#import "JCImgCollectionViewCell.h"
#import "YBImageBrowser.h"
#import "JCDaShangView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDetailContentCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) UIView *bugUserView;//已购买用户

@property (nonatomic,strong) UILabel *countLab;//购买人数

@property (nonatomic,strong) UILabel *freeLab;//免费

@property (nonatomic,strong) UIView *priceInfoView;//价格信息

@property (nonatomic,strong) UIImageView *iconImgView;

@property (nonatomic,strong) UILabel *priceLab;//价格

@property (nonatomic,strong) UILabel *refundLab;//不中返还

@property (nonatomic,strong) UILabel *payPriceLab;//实付价格

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) JCDaShangView *dsView;//打赏

@property (nonatomic,strong) JCWTjInfoDetailBall *tjInfoDetailBall;

@end

NS_ASSUME_NONNULL_END
