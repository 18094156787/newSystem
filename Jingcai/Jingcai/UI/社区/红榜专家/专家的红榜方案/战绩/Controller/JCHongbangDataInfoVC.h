//
//  JCHongbangDataInfoVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDataInfoVC : JCBaseTableViewController

@property (nonatomic,strong) JCWExpertBall *exprtModel;

@property (nonatomic,strong) NSDictionary *event_Data;//战绩概况

@property (nonatomic,strong) NSArray *hbArray;//盈利率

@property (nonatomic,strong) NSArray *hotArray;//命中率

@end

NS_ASSUME_NONNULL_END
