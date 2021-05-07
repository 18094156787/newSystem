//
//  JCMineHeadItemView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/18.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMineHeadItemView : JCBaseView

@property (nonatomic,strong) UILabel *numLab;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIView *redView;

@property (nonatomic,strong) NSString *number;

@property (nonatomic,strong) NSString *title;

@property (nonatomic,assign) BOOL isMsg;

@end

NS_ASSUME_NONNULL_END
