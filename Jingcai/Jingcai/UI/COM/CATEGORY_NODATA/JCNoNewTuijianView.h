//
//  JCNoNewTuijianView.h
//  Jingcai
//
//  Created by Administrator on 2019/2/27.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

typedef void (^JCNoNewTuijianMoreClickBlock)(void);

NS_ASSUME_NONNULL_BEGIN
@interface JCNoNewTuijianView : JCBaseView
@property (nonatomic, copy) JCNoNewTuijianMoreClickBlock moreClickBlock;//点击了更多专家
@end
NS_ASSUME_NONNULL_END
