//
//  JCPostCheckArticleVC.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/23.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCMyPostCheckDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckArticleVC : JCBaseTableViewController

@property (nonatomic,assign) BOOL isJingcai;//yes是有全民竞猜资格开放的,no是默认的需要2篇推荐贴

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *phone;

@property (nonatomic,strong) NSString *idcard;//身份证

@property (nonatomic,strong) UIImage *idcard_image;// 身份证照片

@property (nonatomic,strong) NSString *account;//申请理由

@property (nonatomic,strong) JCMyPostCheckDetailModel *checkDetailModel;

@end

NS_ASSUME_NONNULL_END
