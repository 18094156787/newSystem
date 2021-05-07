//
//  JCYCQianYueShowView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/17.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCQianYueModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCQianYueShowView : JCBaseView

@property (nonatomic,strong) JCQianYueModel *qianyueModel;

@property (nonatomic,copy) void(^JCAgreeBlock)(void);

@end

NS_ASSUME_NONNULL_END
