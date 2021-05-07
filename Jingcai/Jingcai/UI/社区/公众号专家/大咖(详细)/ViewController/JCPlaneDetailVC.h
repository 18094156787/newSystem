//
//  JCPlaneDetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/8/11.
//  Copyright © 2019年 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPlaneDetailVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *expertID;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@end

NS_ASSUME_NONNULL_END
