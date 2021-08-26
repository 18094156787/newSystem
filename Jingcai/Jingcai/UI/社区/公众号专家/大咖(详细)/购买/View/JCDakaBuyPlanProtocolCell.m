//
//  JCDakaBuyPlanProtocolCell.m
//  Jingcai
//
//  Created by 陈继伟 on 2021/3/1.
//  Copyright © 2021 blockstar. All rights reserved.
//

#import "JCDakaBuyPlanProtocolCell.h"
@implementation JCDakaBuyPlanProtocolCell

- (void)initViews {
    [self.contentView addSubview:self.sureProtocolBtn];
    [self.sureProtocolBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.offset(AUTO(5));
        make.size.mas_equalTo(CGSizeMake(AUTO(30), AUTO(30)));
    }];
    
    [self.contentView addSubview:self.protocolLab];
    [self.protocolLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.sureProtocolBtn.mas_right);
    }];
    
        NSString *codeLoginString = @"阅读并同意《鲸猜足球用户购买协议》";
        NSMutableAttributedString* atext = [[NSMutableAttributedString alloc] initWithString:codeLoginString attributes:@{NSForegroundColorAttributeName:COLOR_A9A9A9,NSFontAttributeName:[UIFont systemFontOfSize:AUTO(12)]}];
        NSRange loginRange = [codeLoginString rangeOfString:@"《鲸猜足球用户购买协议》"];
    //    [atext yy_setFont:[UIFont systemFontOfSize:AUTO(12)] range:atext.yy_rangeOfAll];
        [atext addAttributes:@{NSForegroundColorAttributeName:COLOR_5194E3} range:loginRange];
        YYTextHighlight *hi = [YYTextHighlight new];
        [atext setTextHighlight:hi range:codeLoginString.rangeOfAll];
        
        WeakSelf;
        hi.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            WebViewController *vc = [WebViewController new];
                vc.titleStr = @"鲸猜足球用户购买协议";
                NSString *urlStr = [NSString  stringWithFormat:@"%@?dev=1",[JCConfigModel currentConfigModel].get_purchase];
                vc.urlStr = NonNil(urlStr);
                [[weakSelf getViewController].navigationController pushViewController:vc animated:YES];
        };

    self.protocolLab.attributedText=atext;
}

- (void)sureProtocolBtnClick {
    self.sureProtocolBtn.selected = !self.sureProtocolBtn.selected;
    if(self.sureProtocolBtn.selected){
        [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"JCFanganAgree"];
    }else{
        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JCFanganAgree"]) {
            [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"JCFanganAgree"];
        }
        
    }
}

- (UIButton *)sureProtocolBtn {
    if (!_sureProtocolBtn) {
        _sureProtocolBtn = [UIButton new];
        [_sureProtocolBtn setImage:JCIMAGE(@"protocol_select") forState:UIControlStateSelected];
        [_sureProtocolBtn setImage:JCIMAGE(@"yuce_select_normal") forState:0];
        [_sureProtocolBtn addTarget:self action:@selector(sureProtocolBtnClick) forControlEvents:UIControlEventTouchUpInside];

        if ([[NSUserDefaults standardUserDefaults] objectForKey:@"JCFanganAgree"]) {
            _sureProtocolBtn.selected = YES;
        }
    }
    return _sureProtocolBtn;
}

- (YYLabel *)protocolLab {
    if (!_protocolLab) {
        _protocolLab = [YYLabel new];
        _protocolLab.textColor = COLOR_999999;
        _protocolLab.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(12)];

    }
    return _protocolLab;
}


@end
