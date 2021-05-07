//
//  JCWithDrawRecordDetailHeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2020/9/1.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMyGaoChouDetailModel.h"
#import "JCWithDrawRecordRuleView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCWithDrawRecordDetailHeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *ruleBtn;

@property (nonatomic,strong) UILabel *articlecCountLabel;

@property (nonatomic,strong) UILabel *articlecCountLab;

@property (nonatomic,strong) UILabel *benefitCountLabel;

@property (nonatomic,strong) UILabel *benefitCountLab;

@property (nonatomic,strong) JCWithDrawRecordRuleView *ruleView;

@property (nonatomic,strong) JCMyGaoChouDetailModel *model;



@end

NS_ASSUME_NONNULL_END
