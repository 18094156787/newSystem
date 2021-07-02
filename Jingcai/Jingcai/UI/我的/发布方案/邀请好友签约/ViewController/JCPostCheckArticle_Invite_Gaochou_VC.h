//
//  JCPostCheckArticle_Invite_Gaochou_VC.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseTableViewController.h"
#import "JCMyPostCheckDetailModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckArticle_Invite_Gaochou_VC : JCBaseTableViewController

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *phone;

@property (nonatomic,strong) NSString *idcard;//身份证

@property (nonatomic,strong) UIImage *idcard_image;// 身份证照片

@property (nonatomic,strong) UIImage *headImg;// 头像

@property (nonatomic,strong) NSString *nickName;

@property (nonatomic,strong) NSString *introduce;

@property (nonatomic,strong) JCMyPostCheckDetailModel *checkDetailModel;

@end

NS_ASSUME_NONNULL_END
