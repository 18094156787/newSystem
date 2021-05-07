//
//  JCNoNetworkView.h
//  Jingcai
//
//  Created by Rain on 2018/11/26.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseView.h"

typedef void (^NoNetworkClickBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface JCNoNetworkView : JCBaseView
@property (copy, nonatomic) NoNetworkClickBlock noNetworkClickBlock;
@end
NS_ASSUME_NONNULL_END
