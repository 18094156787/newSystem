//
//  JCActivityKindCell.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/5/28.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewCell_New.h"
#import <JXCategoryView.h>
#import "JCActivityKindUserVC.h"
#import "JCActivityKindScoreVC.h"
#import "JCActivityKindMyPrizeVC.h"
#import "JCActivityDetailModel.h"
#import "CountDown.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCActivityKindCell : JCBaseTableViewCell_New<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) NSArray *titleArr;// 标题数据
@property (nonatomic, strong) JXCategoryTitleView *categoryView;// 标题view
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;//listView

@property (nonatomic, strong) UIImageView *getScoreImgView;

@property (nonatomic, assign) float height;

@property (nonatomic, copy) void(^JCHeightBlock)(float heihgt);

@property (nonatomic,strong) NSString *actID;

@property (strong, nonatomic) CountDown *countDown;

@property (nonatomic,strong) JCActivityDetailModel *detailModel;

@property (nonatomic, strong) JCActivityKindUserVC *userVC;

@property (nonatomic, strong) JCActivityKindScoreVC *scoreVC;

@property (nonatomic, strong) JCActivityKindMyPrizeVC *prizeVC;

- (void)destoryTimer;


@end

NS_ASSUME_NONNULL_END
