//
//  JCSearchHistoryView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCHistorySeachTitleView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCSearchHistoryView : JCBaseView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;

@property (nonatomic,strong) NSArray *hotArray;//热门

@property (nonatomic,strong) NSMutableArray *historyArray;//历史

@property (nonatomic,assign) NSInteger type;//0是首页 1是足球比分搜索,2是篮球比分搜索,3是鲸猜大数据搜索

@property (nonatomic,copy) void(^JCSearchBlock)(NSString *text);

@end

NS_ASSUME_NONNULL_END
