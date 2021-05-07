//
//  JCBasketBallMatchTongJiTeamVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"
#import "JCBasketBallMatchTongJiUserModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBasketBallMatchTongJiTeamVC : JCBaseViewController

@property (nonatomic,strong) NSArray *dataArray;

@property (nonatomic,strong) NSMutableArray *titleArray;

@property (nonatomic,strong) NSMutableArray *contentArray;

@property (nonatomic,assign) NSInteger emptyIndex;

@end

NS_ASSUME_NONNULL_END
