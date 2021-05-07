//
//  JCYCCountHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/4/10.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCYuceSettingModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCYCCountHeadView : JCBaseView

@property (nonatomic,strong) UILabel *countLab;

@property (nonatomic,strong) UIButton *selectBtn;

@property (nonatomic,strong) UIButton *ruleBtn;

@property (nonatomic,strong) UILabel *infoLab;

@property (nonatomic,strong) NSString *count;//剩余多少次数

@property (nonatomic,strong) JCYuceSettingModel *settingModel;

@end

NS_ASSUME_NONNULL_END
