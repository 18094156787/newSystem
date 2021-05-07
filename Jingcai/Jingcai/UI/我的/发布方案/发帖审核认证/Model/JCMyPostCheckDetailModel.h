//
//  JCMyPostCheckDetailModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/15.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"
#import "JCMyPostCheckTuiJianModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCMyPostCheckDetailModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *name;

@property (nonatomic,strong) NSString *phone;

@property (nonatomic,strong) NSString *idcard;

@property (nonatomic,strong) NSString *idcard_image;

@property (nonatomic,strong) NSString *account;

@property (nonatomic,strong) NSString *user_name;

@property (nonatomic,strong) NSString *user_avater;

@property (nonatomic,strong) NSString *user_desc;

@property (nonatomic,strong) NSString *idcard_image_url;

@property (nonatomic,strong) NSString *user_avater_url;

@property (nonatomic,strong) NSString *type;

@property (nonatomic,strong) NSString *tuijian_status;

@property (nonatomic,strong) NSString *card_status;

@property (nonatomic,strong) NSString *fail_desc;

@property (nonatomic,strong) NSString *fail_count;

@property (nonatomic,assign) BOOL isNewIDCard;

@property (nonatomic,assign) BOOL isNewHeadImg;

@property (nonatomic,strong) JCMyPostCheckTuiJianModel *tuijian_one;

@property (nonatomic,strong) JCMyPostCheckTuiJianModel *tuijian_two;

@property (nonatomic,strong) JCMyPostCheckTuiJianModel *fang_an_1;

@property (nonatomic,strong) JCMyPostCheckTuiJianModel *fang_an_2;
@end

NS_ASSUME_NONNULL_END
