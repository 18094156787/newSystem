//
//  JCAgreeProtocolView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/4/15.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
typedef void(^JCActionHandler)(void);
NS_ASSUME_NONNULL_BEGIN

@interface JCAgreeProtocolView : JCBaseView


@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) YYLabel *contentLab;

@property (nonatomic,strong) UIView *lineView;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) UIButton *cancelBtn;



@end

NS_ASSUME_NONNULL_END
