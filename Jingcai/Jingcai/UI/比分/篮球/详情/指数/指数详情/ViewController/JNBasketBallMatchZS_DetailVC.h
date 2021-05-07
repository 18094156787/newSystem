//
//  JNBasketBallMatchZS_DetailVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/1/7.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface JNBasketBallMatchZS_DetailVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *match_num;

@property (nonatomic,strong) NSString *company_name;

@property (nonatomic,strong) NSString *company_id;

@property (nonatomic,strong) NSString *type;//type  1胜负 2让分 3总分

@end

NS_ASSUME_NONNULL_END
