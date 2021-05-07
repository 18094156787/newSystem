//
//  JCHongBangCheckFailureView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/20.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCHongBangCheckFailureView.h"

@implementation JCHongBangCheckFailureView

- (void)initViews{
    
    [self addSubview:self.typeLab];
    [self.typeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.offset(AUTO(16.5));
    }];

    
    [self addSubview:self.timeLab];
    [self.timeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.typeLab.mas_right).offset(2);
        make.top.offset(AUTO(15));
        make.height.mas_equalTo(AUTO(20));
    }];
    
    [self addSubview:self.statusLab];
    [self.statusLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.timeLab.mas_right).offset(AUTO(5));
        make.centerY.equalTo(self.timeLab);
    }];
    
    UIView *editView= [UIView new];
    [self addSubview:editView];
    [editView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.timeLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(60), AUTO(30)));
    }];
    self.editView = editView;
    
    [editView addSubview:self.editLab];
    [self.editLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.offset(0);
        make.centerY.equalTo(self.timeLab);
    }];
    
    [editView addSubview:self.editIconView];
    [self.editIconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.editLab.mas_left).offset(-2);
        make.centerY.equalTo(self.timeLab);
        make.size.mas_equalTo(CGSizeMake(AUTO(12), AUTO(12)));
    }];
    
    [self addSubview:self.reasonLab];
    [self.reasonLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
        make.top.equalTo(self.timeLab.mas_bottom).offset(AUTO(5));
        make.right.offset(0);
        make.bottom.offset(-5);
    }];
    
}

- (void)setDianPingBall:(JCDianPingBall *)dianPingBall {
    _dianPingBall = dianPingBall;
    self.timeLab.text = dianPingBall.time;
    self.statusLab.text = dianPingBall.status_type;
    self.reasonLab.text = [NSString stringWithFormat:@"拒绝理由: %@",dianPingBall.error];
    self.editView.hidden = dianPingBall.status==3?YES:NO;
    self.typeLab.text = [NSString stringWithFormat:@" %@ ",dianPingBall.classfly_desc];
    if ([dianPingBall.classfly integerValue]==2) {
        self.typeLab.backgroundColor = [COLOR_002868 colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_002868.CGColor;
        self.typeLab.textColor = COLOR_002868;
    }else if([dianPingBall.classfly integerValue]==3){
        self.typeLab.backgroundColor = [COLOR_30B27A colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = COLOR_30B27A.CGColor;
        self.typeLab.textColor = COLOR_30B27A;
    }else{
        self.typeLab.backgroundColor = [JCBaseColor colorWithAlphaComponent:0.1];
        self.typeLab.layer.borderColor = JCBaseColor.CGColor;
        self.typeLab.textColor = JCBaseColor;
    }
}


- (UILabel *)typeLab {
    if (!_typeLab) {
        _typeLab = [UILabel initWithTitle:@"" andFont:AUTO(11) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _typeLab.layer.borderWidth = 0.5;
    }
    return _typeLab;
}


//- (UILabel *)timeLab {
//    if (!_timeLab) {
//        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
//    }
//    return _timeLab;
//}

- (UILabel *)statusLab {
    if (!_statusLab) {
        _statusLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        
    }
    return _statusLab;
}

- (UILabel *)timeLab {
    if (!_timeLab) {
        _timeLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:COLOR_999999 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _timeLab;
}

- (UILabel *)reasonLab {
    if (!_reasonLab) {
        _reasonLab = [UILabel initWithTitle:@"" andFont:AUTO(12) andWeight:1 andTextColor:JCBaseColor andBackgroundColor:JCClearColor andTextAlignment:0];
        _reasonLab.numberOfLines = 0;
    }
    return _reasonLab;
}

- (UILabel *)editLab {
    if (!_editLab) {
        _editLab = [UILabel initWithTitle:@"去修改" andFont:AUTO(11) andWeight:1 andTextColor:COLOR_5194E3 andBackgroundColor:JCClearColor andTextAlignment:0];
    }
    return _editLab;
}

- (UIImageView *)editIconView {
    if (!_editIconView) {
        _editIconView = [UIImageView new];
        _editIconView.image = JCIMAGE(@"ic_qxg");
        _editIconView.userInteractionEnabled = YES;
    }
    return _editIconView;
}



@end
