//
//  JCMatchFilter_BasketBall_SegmentView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/21.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilter_BasketBall_SegmentView : JCBaseView

@property (nonatomic,strong) UIImageView *backImgView;

@property (nonatomic,strong) UIButton *firBtn;

@property (nonatomic,strong) UIButton *secBtn;

@property (nonatomic,strong) UIButton *thirdBtn;

@property (nonatomic,strong) UIButton *selectBtn;

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,copy) void(^JCBlock)(NSInteger index);

- (void)showAll;

- (void)showImportmant;

- (void)showJingLan;

@end

NS_ASSUME_NONNULL_END
