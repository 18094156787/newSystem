//
//  JCPlaneDetailNewVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/12/18.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailNewVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *expertID;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@property (nonatomic,strong) NSArray *matchArray;

@end

NS_ASSUME_NONNULL_END
