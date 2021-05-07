//
//  JCFootBallBuyPlaneUserCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/27.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import "JCFootBallNormalHeadCell.h"
#import "JCPlanBuyPersonModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCFootBallBuyPlaneUserCell : JCBaseTableViewCell_New<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UILabel *countLab;

@property(nonatomic,strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *dataArray;

@property(nonatomic,strong) UIButton *moreBtn;

@end

NS_ASSUME_NONNULL_END
