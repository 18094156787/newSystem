//
//  JCHongbangDetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangDetailVC : JCBaseTableViewController

@property (nonatomic,copy) NSString *expertID;

@property (nonatomic,strong) JCWTjInfoBall *planDetailModel;//方案详情

@property (nonatomic,strong) NSDictionary *dataDic;

@property (nonatomic,strong) JCHongbangDetailModel *detailModel;

@end

NS_ASSUME_NONNULL_END
