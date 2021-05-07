//
//  JCBankCardInfoModel.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/7.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCWBaseBall.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCBankCardInfoModel : JCWBaseBall

@property (nonatomic,strong) NSString *id;

@property (nonatomic,strong) NSString *user_id;

@property (nonatomic,strong) NSString *bankcard_number;

@property (nonatomic,strong) NSString *bank_name;//开户行

@property (nonatomic,strong) NSString *nickname;//开户用户

@property (nonatomic,strong) NSString *type;

@property (nonatomic,strong) NSString *status;

@end

NS_ASSUME_NONNULL_END
