//
//  JCYuCeHongBaoWithDrawErrorView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/19.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCYuCeHongBaoWithDrawErrorView : JCBaseView

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UILabel *contentLab;

@property (nonatomic,strong) UIButton *sureBtn;

@property (nonatomic,copy) void(^JCSureBlock)(void);

@property (nonatomic,strong) NSString *errorString;

@end

NS_ASSUME_NONNULL_END
