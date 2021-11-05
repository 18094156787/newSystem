//
//  JCDaShangShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDaShangPriceCell.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDaShangShowView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITextFieldDelegate>

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic,strong) UIImageView *userImgView;

@property (nonatomic,strong) UILabel *nameLab;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) UITextField *priceTF;

@property (nonatomic,strong) UILabel *priceLab;

@property (nonatomic,strong) UIButton *rechargeBtn;

@property (nonatomic,strong) YYLabel *protocolLab;

@property (nonatomic,strong) UIButton *sureProtocolBtn;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,assign) float position;

@property (nonatomic,assign) float height;

@property (nonatomic,strong,nullable) JCCaiyunBall * selItemBall;

@property (nonatomic,copy) void(^JCBlock)(void);

@property (nonatomic,copy) void(^JCRechargeBlock)(void);

- (void)show;

- (void)hide;
@end

NS_ASSUME_NONNULL_END
