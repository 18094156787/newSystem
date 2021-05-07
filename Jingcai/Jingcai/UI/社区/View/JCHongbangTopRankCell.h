//
//  JCHongbangTopRankCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import  "JCCommunityRankInfoModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangTopRankCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UILabel *titleLab;

@property (nonatomic, strong) UILabel *mzLab;

@property (nonatomic, strong) UILabel *hbLab;

@property (nonatomic, strong) UILabel *lhLab;

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UIView *lineView1;

@property (nonatomic, strong) UIButton *moreBtn;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataSource;

@property (nonatomic,strong) JCCommunityRankInfoModel *model;

@end

NS_ASSUME_NONNULL_END
