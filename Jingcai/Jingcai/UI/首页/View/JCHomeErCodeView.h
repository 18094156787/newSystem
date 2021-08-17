//
//  JCHomeErCodeView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/8/16.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCImageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCHomeErCodeView : JCBaseView

@property (nonatomic,strong) UIImageView *imgView;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,strong) UIButton *closeBtn;

@property (nonatomic,strong) UIImage *codeImg;

@property (nonatomic,strong) JCImageModel *model;

@property (nonatomic,copy) void(^JCClickBlock)(void);

@property (nonatomic,copy) void(^JCCloseBlock)(void);

@end

NS_ASSUME_NONNULL_END
