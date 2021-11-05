//
//  JCDaShangView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/5.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCDaShangShowView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCDaShangView : JCBaseView

@property (nonatomic,strong) UIButton *dsBtn;

@property (nonatomic,strong) UILabel *dsCountLab;

@property (nonatomic,strong) JCDaShangShowView *dsShowView;



@end

NS_ASSUME_NONNULL_END
