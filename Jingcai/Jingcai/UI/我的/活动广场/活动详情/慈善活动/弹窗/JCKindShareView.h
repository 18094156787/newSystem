//
//  JCKindShareView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/6/2.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCKindShareView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UIImage *shareImage;

- (void)show;

@end

NS_ASSUME_NONNULL_END
