//
//  JCTransactionDataModelLockedView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCTransactionDataModelLockedView : JCBaseView

@property (nonatomic, strong) UIButton *lockBtn;

@property (nonatomic,copy) void(^JCOpenBlock)(void);

@end

NS_ASSUME_NONNULL_END
