//
//  JCPostPlanHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2019/12/25.
//  Copyright © 2019 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCPostPlanHeadView : JCBaseView

@property (nonatomic,strong) UITextView *titleTFView;

@property (nonatomic,strong) UIView *bgView;

@property (nonatomic,strong) UILabel *numLab;

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,copy) void(^JCContentBlock)(NSString *str);

- (void)updateBgView;

@end

NS_ASSUME_NONNULL_END
