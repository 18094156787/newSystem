//
//  JCDataModelDateView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMatchTimeModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDataModelDateView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)UICollectionView *collectionView;

@property (nonatomic,strong) UIButton *datePickBtn;

@property (nonatomic,strong) UIView *bottomLineView;

@property (nonatomic,strong) NSMutableArray *dataArray;

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,copy) void(^JCTimeBlock)(NSString *time);

@property (nonatomic,copy) NSString *today;

@property (nonatomic,copy) NSString *currentDay;//记录当前选中的日期

@property (nonatomic,assign) BOOL haveDate;//记录选中的日期在七天内

//@property (nonatomic,assign) NSInteger type;//0是鲸猜大数据 1是历史同赔 2.是泊凇分布

@property (nonatomic,assign) BOOL clearBg;//透明底

@property (nonatomic,strong,nullable) JCMatchTimeModel *currentModel;


@end

NS_ASSUME_NONNULL_END
