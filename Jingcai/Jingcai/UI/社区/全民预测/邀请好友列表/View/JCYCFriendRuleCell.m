//
//  JCYCFriendRuleCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/3/30.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCYCFriendRuleCell.h"
#import "JCYCFriendUserTopView.h"
@implementation JCYCFriendRuleCell

- (void)initViews {
    
    UIView *bgView = [UIView new];
    bgView.backgroundColor = COLOR_FFF4E5;
    [self.contentView addSubview:bgView];
    [bgView hg_setAllCornerWithCornerRadius:AUTO(8)];
    [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsMake(AUTO(15), AUTO(12), AUTO(5), AUTO(12)));
    }];
    
    UIImageView *imageView = [UIImageView new];
    imageView.image = JCIMAGE(@"me_invite_title");
    [bgView addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.offset(AUTO(20));
        make.centerX.equalTo(bgView);
        make.size.mas_equalTo(CGSizeMake(AUTO(100), AUTO(16)));
    }];
    
    UILabel *titleLab = [UILabel initWithTitle:@"邀请规则" andFont:AUTO(16) andWeight:2 andTextColor:COLOR_713A08 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
    [imageView addSubview:titleLab];
    [titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.insets(UIEdgeInsetsZero);
    }];
    

    
    [bgView addSubview:self.contentLab1];
    [self.contentLab1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(AUTO(15));
        make.top.equalTo(imageView.mas_bottom).offset(AUTO(15));
        make.right.offset(AUTO(-15));
        make.bottom.equalTo(self.contentView).offset(AUTO(-20));
    }];
    
    NSMutableParagraphStyle *paragraphStyle1 = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle1.lineSpacing = 3; // 设置行间距
//    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSString *content1 = @"1.用户每邀请一个好友安装注册，即可获得88元固定奖励红包优惠券+一次拆红包机会。\n2.拆红包类型包括：现金红包、免单券、红包优惠券。\n3.红包优惠券不可提现、不可转赠、过期作废。\n4.活动最终解释权，归鲸猜足球所有，若有发现利用非法漏洞参与活动，非法牟利或破坏计算机系统等行为，本平台保有法律途径手段与权力。";
    UIFont *font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    NSMutableAttributedString *attributedStr1 = [[NSMutableAttributedString alloc] initWithString:content1 attributes:@{NSParagraphStyleAttributeName: paragraphStyle1, NSFontAttributeName:font}];
    self.contentLab1.attributedText = attributedStr1;

}

- (UILabel *)titleLab1 {
    if (!_titleLab1) {
        _titleLab1 = [UILabel initWithTitle:@"单场第一阶段规则：" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab1.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    }
    return _titleLab1;
}

- (UILabel *)contentLab1 {
    if (!_contentLab1) {
        _contentLab1 = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab1.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
        _contentLab1.numberOfLines = 0;
    }
    return _contentLab1;
}

- (UILabel *)titleLab2 {
    if (!_titleLab2) {
        _titleLab2 = [UILabel initWithTitle:@"单场第二阶段规则：" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _titleLab2.font = [UIFont fontWithName:@"PingFangSC-Medium" size:AUTO(14)];
    }
    return _titleLab2;
}

- (UILabel *)contentLab2 {
    if (!_contentLab2) {
        _contentLab2 = [UILabel initWithTitle:@"" andFont:0 andWeight:0 andTextColor:COLOR_2F2F2F andBackgroundColor:JCClearColor andTextAlignment:0];
        _contentLab2.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];
        _contentLab2.numberOfLines = 0;
    }
    return _contentLab2;
}

@end
