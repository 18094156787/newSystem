//
//  JCColumnHeadTitleView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/10/20.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCColumnHeadTitleView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *statusLab;

@property (nonatomic,assign) BOOL isbottom;

@end

NS_ASSUME_NONNULL_END
