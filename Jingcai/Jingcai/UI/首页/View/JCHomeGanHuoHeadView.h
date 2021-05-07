//
//  JCHomeGanHuoHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/12.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCHomeGanHuoHeadView : JCBaseView<SDCycleScrollViewDelegate>

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) NSString *url;

@end

NS_ASSUME_NONNULL_END
