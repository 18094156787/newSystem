//
//  JCHongbangBuyVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/5/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCHongbaoShowView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHongbangBuyVC : JCBaseTableViewController

@property (nonatomic,strong) NSString *expertID;

@property (nonatomic,strong) NSDictionary *dataDic;

@property (nonatomic,strong) JCHongbangDetailModel *detailModel;

@property (nonatomic,copy) void(^JCMatchStatusBlock)(BOOL end);

- (void)sureBtnClick;


@end

NS_ASSUME_NONNULL_END
