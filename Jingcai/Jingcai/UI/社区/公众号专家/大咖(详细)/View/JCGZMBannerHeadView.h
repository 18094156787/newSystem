//
//  JCGZMBannerHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/9.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCGZHBannerModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCGZMBannerHeadView : JCBaseView

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) JCGZHBannerModel *model;

@property (nonatomic,copy) void(^JCHeightBlock)(float height);

@property (nonatomic,copy) void(^JCClickBlock)(void);

@end

NS_ASSUME_NONNULL_END
