//
//  JCYCHongbaoChaiView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYCHongbaoChaiView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,copy) void(^JCChaiBlock)(void);

@end

NS_ASSUME_NONNULL_END
