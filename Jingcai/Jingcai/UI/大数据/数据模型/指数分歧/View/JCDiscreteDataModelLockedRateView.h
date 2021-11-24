//
//  JCDiscreteDataModelLockedRateView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/11/11.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"

NS_ASSUME_NONNULL_BEGIN

@interface JCDiscreteDataModelLockedRateView : JCBaseView

@property (nonatomic, strong) UILabel *nameLab;

@property (nonatomic, strong) UILabel *bottomLab;


- (void)show;

- (void)hide;

@end

NS_ASSUME_NONNULL_END
