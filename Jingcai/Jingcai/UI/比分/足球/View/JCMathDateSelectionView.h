//
//  JCMathDateSelectionView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/3.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMatchTimeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMathDateSelectionView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong) UIButton *datePickBtn;

@property (nonatomic,strong) UIView *bottomLineView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,copy) void(^JCTimeBlock)(NSString *time);

@property (nonatomic,copy) NSString *today;

@property (nonatomic,copy) NSString *currentDay;//记录当前选中的日期

@property (nonatomic,assign) BOOL haveDate;//记录选中的日期在七天内

@property (nonatomic,strong) NSString *type;//0是赛程 1是进行中 2是已完场 9999是活动的比赛模块

@property (nonatomic,strong,nullable) JCMatchTimeModel *currentModel;

@end

NS_ASSUME_NONNULL_END
