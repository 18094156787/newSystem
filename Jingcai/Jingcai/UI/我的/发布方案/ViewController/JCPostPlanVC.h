//
//  JCPostPlanVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCMyPostPlanModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *type;//1 欧盘  2 亚盘  3 大小球

@property (nonatomic,strong) NSString *postID;

@property (nonatomic,copy) void(^JCRefreshBlock)(void);

//@property (nonatomic,strong) NSString *type_class;

@end

NS_ASSUME_NONNULL_END
