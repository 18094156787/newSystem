//
//  JCDakaBuyPlanVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCHongbaoShowView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDakaBuyPlanVC : JCBaseTableViewController

@property (nonatomic,strong) JCWTjInfoBall *payInfoModel;

@property (nonatomic,strong) NSString *autherID;

@property (nonatomic,strong) NSArray *hongbaoArray;

@property(nonatomic,strong)NSMutableArray *tuijianArray;

@property (nonatomic,strong) JCHongbaoShowView*hbPickerView;

@property (nonatomic,copy) void(^JCPirceBlock)(NSString *price);

@property (nonatomic,copy) void(^JCEndBlock)(bool isEnd);

- (void)sureBtnClick;

@end

NS_ASSUME_NONNULL_END
