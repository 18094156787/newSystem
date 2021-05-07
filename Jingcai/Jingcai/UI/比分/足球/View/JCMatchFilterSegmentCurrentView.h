//
//  JCMatchFilterSegmentCurrentView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/26.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilterSegmentCurrentView : JCBaseView

@property (nonatomic,strong) UIImageView *backImgView;

@property (nonatomic,strong) UIButton *currentBtn;

@property (nonatomic,assign) NSInteger index;

@property (nonatomic,copy) void(^JCBlock)(void);

@end

NS_ASSUME_NONNULL_END
