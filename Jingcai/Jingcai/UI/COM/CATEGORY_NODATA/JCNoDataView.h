//
//  JCNoDataView.h
//  Jingcai
//
//  Created by Rain on 2018/11/23.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCBaseView.h"

typedef void (^NoDataClickBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface JCNoDataView : JCBaseView
@property (copy, nonatomic) NoDataClickBlock noDataClickBlock;
@end
NS_ASSUME_NONNULL_END
