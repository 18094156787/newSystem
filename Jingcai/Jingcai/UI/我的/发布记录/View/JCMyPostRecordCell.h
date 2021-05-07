//
//  JCMyPostRecordCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/6.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCHongBangCommomPriceView.h"
#import "JCHongBangWaitCheckView.h"
#import "JCHongBangCheckFailureView.h"
#import "JCPostImageModel.h"
#import "JCAIPlanPriceInfoView.h"
NS_ASSUME_NONNULL_BEGIN
typedef void(^JCDianPingMatchClickBlock)(NSString * _Nullable matchNum);
typedef void(^JCDianPingUserClickBlock)(NSString * _Nullable tjUserId);
@interface JCMyPostRecordCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UILabel *checkTimeLab;//审核时间

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIImageView *refundImgView;//不中退款

@property (nonatomic,strong) UIImageView *resultImgView;//开奖结果

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) UILabel *typeLab;

@property (nonatomic, strong) UILabel *timeLab;

@property (nonatomic, strong) UILabel *priceLab;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIView *checkView;

@property (nonatomic,strong) UILabel *statusLabel;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,strong) UILabel *reasonLab;

@property (nonatomic,strong) UILabel *editLab;

@property (nonatomic, strong) JCAIPlanPriceInfoView *priceInfoView;

@property (nonatomic, strong) JCHongBangWaitCheckView *waitCheckView;

@property (nonatomic, strong) JCHongBangCheckFailureView *checkFailureView;

@property (assign, nonatomic) BOOL hideImage;

@property (assign, nonatomic) BOOL showImage;

@property (strong, nonatomic) JCHongBangBall * dianPingBall;

@property (copy, nonatomic) JCDianPingMatchClickBlock matchClickBlock;

@property (nonatomic, assign) BOOL success;//审核成功

@property (nonatomic, copy) void(^JCLikeBlock)(void);

@property (nonatomic, copy) void(^JCShareBlock)(void);

@property (nonatomic, copy) void(^JCEditBlock)(JCHongBangBall *model);

@end

NS_ASSUME_NONNULL_END
