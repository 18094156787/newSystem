//
//  JCHongbangOrderVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/21.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCWMyHongbaoBall.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangOrderVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *expertID;

@property (nonatomic,strong) NSDictionary *object;

@property (nonatomic, strong) JCWTjInfoDetailBall *tjInfoDetailBall;//方案详情

@property (nonatomic,strong) JCWMyHongbaoBall *useHbModel;//当前选中的红包

@property (nonatomic,copy) void(^JCPriceBlock)(NSString *price);

- (void)sureBtnClick;

@end

NS_ASSUME_NONNULL_END
