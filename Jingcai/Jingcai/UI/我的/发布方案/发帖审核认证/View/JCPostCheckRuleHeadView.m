//
//  JCPostCheckRuleHeadView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCPostCheckRuleHeadView.h"

@implementation JCPostCheckRuleHeadView

- (void)initViews {
//    UIImageView *topView = [UIImageView new];
//    topView.image = JCIMAGE(@"post_title_rule");
//    [self addSubview:topView];
//    [topView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.offset(AUTO(24));
//        make.centerX.equalTo(self);
//        make.size.mas_equalTo(CGSizeMake(AUTO(211), AUTO(17)));
//    }];
    
    
    UIView *iconView = [UIView new];
    iconView.backgroundColor = JCBaseColor;
    [self addSubview:iconView];
    [iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.offset(AUTO(24));
        make.size.mas_equalTo(CGSizeMake(2, 16));
    }];

    UILabel *label = [UILabel initWithTitle:@"作者规则说明" andFont:AUTO(14) andWeight:2 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
    [self addSubview:label];
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(iconView.mas_right).offset(AUTO(10));
        make.centerY.equalTo(iconView);
        make.height.mas_equalTo(16);
    }];
    
    
    NSString *title = @"鲸猜足球致力于为内容创作者提供良好的创作环境，平台鼓励原创，鼓励提高行文质量，给读者以更高的阅读体验。同时，对文章内容进行严格的把控，严禁杜绝抄袭、敷衍推荐等行为，并持续进行严厉的打击。为规范管理鲸猜足球，为用户打造公平、高品质的平台，特发公告如下：";
    UILabel *titleLab = [UILabel initWithTitle:title andFont:AUTO(14) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:0];
    titleLab.numberOfLines = 0;
    [self addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.top.equalTo(iconView.mas_bottom).offset(AUTO(20));
    }];
}
@end
