//
//  JCPlaneDetailQRcodeCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCPlaneDetailQRModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailQRcodeCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UIView *lineView;

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic, strong) JCPlaneDetailQRModel *model;

@end

NS_ASSUME_NONNULL_END
