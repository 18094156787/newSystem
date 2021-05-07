//
//  JCNoSubscribeView.h
//  Jingcai
//
//  Created by Rain on 2018/11/21.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseView.h"
typedef void (^AddSubscribeClickBlock)(void);
NS_ASSUME_NONNULL_BEGIN
@interface JCNoSubscribeView : JCBaseView
@property (copy, nonatomic) AddSubscribeClickBlock addSubscribeClickBlock;
@end
NS_ASSUME_NONNULL_END
