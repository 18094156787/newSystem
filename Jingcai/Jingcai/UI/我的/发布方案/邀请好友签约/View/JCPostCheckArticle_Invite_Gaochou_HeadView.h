//
//  JCPostCheckArticle_Invite_Gaochou_HeadView.h
//  Jingcai
//
//  Created by 陈继伟 on 2021/7/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCBaseView.h"
#import "JCMyGaoChouDetailModel.h"
#import "JCWithDrawRecordRuleView.h"
NS_ASSUME_NONNULL_BEGIN

@interface JCPostCheckArticle_Invite_Gaochou_HeadView : JCBaseView

@property (nonatomic,strong) UILabel *titleLab;

@property (nonatomic,strong) UIButton *ruleBtn;

@property (nonatomic,strong) UILabel *articlecCountLabel;

@property (nonatomic,strong) UILabel *articlecCountLab;

@property (nonatomic,strong) UILabel *benefitCountLabel;

@property (nonatomic,strong) UILabel *benefitCountLab;

@property (nonatomic,strong) JCWithDrawRecordRuleView *ruleView;



@end

NS_ASSUME_NONNULL_END
