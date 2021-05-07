//
//  JCMatchFilterSegmentView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/11/26.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCMatchFilterSegmentView : JCBaseView

@property (nonatomic,strong) UIImageView *backImgView;

@property (nonatomic,strong) UIButton *firBtn;

@property (nonatomic,strong) UIButton *secBtn;

@property (nonatomic,strong) UIButton *selectBtn;

@property (nonatomic,assign) NSInteger selectIndex;

@property (nonatomic,copy) void(^JCBlock)(NSInteger index);

- (void)showAll;

- (void)showImportmant;


@end

NS_ASSUME_NONNULL_END
