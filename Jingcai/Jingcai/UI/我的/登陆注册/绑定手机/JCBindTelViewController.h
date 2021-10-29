//
//  JCBindTelViewController.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/14.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^JCBindTelBlock)(BOOL isBind);
@interface JCBindTelViewController : JCBaseViewController

@property (nonatomic, copy) NSString *oauth_id;

@property (nonatomic, copy) JCBindTelBlock bindTelBlock;

@property (nonatomic, assign) BOOL phoneHadBeenUser;//记录该手机用户已经注册

@end

NS_ASSUME_NONNULL_END
