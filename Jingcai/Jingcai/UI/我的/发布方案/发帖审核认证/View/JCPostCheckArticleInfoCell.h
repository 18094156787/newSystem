//
//  JCPostCheckArticleInfoCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCHongBangCommomPriceView.h"
#import "JCHongBangWaitCheckView.h"
#import "JCHongBangCheckFailureView.h"
#import "JCMyPostCheckTuiJianModel.h"
NS_ASSUME_NONNULL_BEGIN

typedef void(^JCDianPingMatchClickBlock)(NSString * _Nullable matchNum);
typedef void(^JCDianPingUserClickBlock)(NSString * _Nullable tjUserId);
@interface JCPostCheckArticleInfoCell : JCBaseTableViewCell_New

<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,UITableViewDataSource, UITableViewDelegate>

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic,strong) NSArray *imgArray;

@property (assign, nonatomic) BOOL hideUserView;

@property (strong, nonatomic) JCDianPingBall * dianPingBall;

@property (strong, nonatomic) NSDictionary *dataDic;

@property (strong, nonatomic)JCMyPostCheckTuiJianModel *model;

@property (copy, nonatomic) JCDianPingMatchClickBlock matchClickBlock;

@property (copy, nonatomic) JCDianPingUserClickBlock userClickBlock;

@property (nonatomic, copy) void(^JCLikeBlock)(void);

@property (nonatomic, copy) void(^JCShareBlock)(void);


@end

NS_ASSUME_NONNULL_END
