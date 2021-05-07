//
//  JCPlaneDetailFreeVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/14.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailFreeVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *expertID;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@property (nonatomic,strong) NSArray *matchArray;

@end

NS_ASSUME_NONNULL_END
