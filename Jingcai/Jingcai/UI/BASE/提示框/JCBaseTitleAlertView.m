//
//  JCBaseTitleAlertView.m
//  Jingcai
//
//  Created by 陈继伟 on 2020/8/22.
//  Copyright © 2020 blockstar. All rights reserved.
//

#import "JCBaseTitleAlertView.h"

@implementation JCBaseTitleAlertView

- (void)initViews {
    self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];

}

-(void)alertTitle:(NSString *)title TitleColor:(UIColor *)titleColor Mesasge:(NSString *)message MessageColor:(UIColor *)msgColor
   ComfirmTitle:(NSString *)comfirmTitle ComfirmColor:(UIColor *)Comfirmcolor confirmHandler:(JCActionHandler)confirmActionHandler
{
        self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    self.titleLab.text = title;
    self.titleLab.textColor = titleColor;
    self.contentLab.text = message;
    self.contentLab.textColor = msgColor;
    [self.sureBtn setTitle:comfirmTitle forState:0];
    self.sureBtn.titleLabel.font = [UIFont fontWithName:@"PingFangSC-Regular" size:AUTO(14)];
    
    
     [self addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(self);
//            make.top.offset(kNavigationBarHeight+AUTO(120));
//            make.top.offset(kNavigationBarHeight+AUTO(120));
            make.left.offset(AUTO(35));
            make.right.offset(AUTO(-35));
    
        }];
    
        [self.bgView addSubview:self.titleLab];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(15));
            make.left.offset(AUTO(30));
            make.right.offset(AUTO(-30));
        }];
    
        [self.bgView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgView);
            make.height.mas_equalTo(0.5);
            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        }];

        
        [self.bgView addSubview:self.contentLab];
        [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            if (title.length>0) {
                make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(25));
            }else{
                make.top.offset(AUTO(35));
            }
            
            make.left.offset(AUTO(30));
            make.right.offset(AUTO(-30));
            make.height.mas_greaterThanOrEqualTo(AUTO(60));
        }];
    
//        [self.bgView addSubview:self.lineView];
//        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.right.equalTo(self.bgView);
//            make.height.mas_equalTo(0.5);
//            make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(25));
//        }];
    
        [self.bgView addSubview:self.sureBtn];
        [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.bgView);
            make.size.mas_equalTo(CGSizeMake(AUTO(275), AUTO(44)));
            make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(25));
            make.bottom.equalTo(self.bgView).offset(AUTO(-15));
        }];
    
      if(confirmActionHandler){
          [self.sureBtn bk_whenTapped:^{
              confirmActionHandler();
          }];
      }
    
}

-(void)alertTitle:(NSString *)title TitleColor:(UIColor *)titleColor Mesasge:(NSString *)message MessageColor:(UIColor *)msgColor
  SureTitle:(NSString *)sureTitle SureColor:(UIColor *)sureColor SureHandler:(JCActionHandler)sureHandler  CancleTitle:(NSString *)cancleTitle CancleColor:(UIColor *)cancleColor CancelHandler:(JCActionHandler)cancelHandler
{
        self.backgroundColor = [JCBlackColor colorWithAlphaComponent:0.5];
    self.titleLab.text = title;
    self.titleLab.textColor = titleColor;
    self.contentLab.text = message;
    self.contentLab.textColor = msgColor;
    [self.sureBtn setTitle:sureTitle forState:0];
    [self.sureBtn setTitleColor:sureColor forState:0];
    [self.cancelBtn setTitle:cancleTitle forState:0];
    [self.cancelBtn setTitleColor:cancleColor forState:0];
    self.lineView.hidden = title.length==0?YES:NO;
    
    
         [self addSubview:self.bgView];
        [self.bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.centerY.equalTo(self);
//            make.top.offset(kNavigationBarHeight+AUTO(120));
            make.left.offset(AUTO(35));
            make.right.offset(AUTO(-35));
    
        }];
    
        [self.bgView addSubview:self.titleLab];
        [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.offset(AUTO(15));
            make.left.offset(AUTO(30));
            make.right.offset(AUTO(-30));
        }];
    
        
        [self.bgView addSubview:self.lineView];
        [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.equalTo(self.bgView);
            make.height.mas_equalTo(0.5);
            make.top.equalTo(self.titleLab.mas_bottom).offset(AUTO(15));
        }];


        
        [self.bgView addSubview:self.contentLab];
        [self.contentLab mas_makeConstraints:^(MASConstraintMaker *make) {
            if (title.length>0) {
                make.top.equalTo(self.lineView.mas_bottom).offset(AUTO(15));
            }else{
                make.top.offset(AUTO(35));
            }
            make.left.offset(AUTO(20));
            make.right.offset(AUTO(-20));
            make.height.mas_greaterThanOrEqualTo(AUTO(60));
        }];
    

    
        [self.bgView addSubview:self.cancelBtn];
        [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.bgView).offset(AUTO(20));
            make.right.equalTo(self.bgView.mas_centerX).offset(AUTO(-10));
            make.height.mas_equalTo(AUTO(44));
            make.top.equalTo(self.contentLab.mas_bottom).offset(AUTO(25));
            make.bottom.equalTo(self.bgView).offset(-AUTO(20));
        }];
    
    
    [self.bgView addSubview:self.sureBtn];
    [self.sureBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.bgView).offset(AUTO(-20));
        make.left.equalTo(self.bgView.mas_centerX).offset(AUTO(10));
        make.height.mas_equalTo(AUTO(44));
        make.top.equalTo(self.cancelBtn);
        make.bottom.equalTo(self.bgView).offset(-AUTO(20));
    }];
    
//    UIView *lineView = [UIView new];
//    lineView.backgroundColor = COLOR_DDDDDD;
//    [self.bgView addSubview:lineView];
//    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.equalTo(self.lineView);
//        make.centerX.equalTo(self.bgView);
//        make.width.mas_equalTo(0.5);
//        make.bottom.equalTo(self.bgView).offset(0);
//    }];
    
      if(sureHandler){
          [self.sureBtn bk_whenTapped:^{
              sureHandler();
          }];
      }
    if(cancelHandler){
        [self.cancelBtn bk_whenTapped:^{
            cancelHandler();
        }];
    }
    
}

- (UIView *)bgView {
    if (!_bgView) {
        _bgView = [UIView new];
        _bgView.backgroundColor = JCWhiteColor;
        [_bgView hg_setAllCornerWithCornerRadius:AUTO(20)];
    }
    return _bgView;
}

- (UILabel *)titleLab {
    if (!_titleLab) {
        _titleLab = [UILabel initWithTitle:@"" andFont:AUTO(17) andWeight:1 andTextColor:COLOR_333333 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _titleLab.numberOfLines = 0;
    }
    return _titleLab;
}

- (UILabel *)contentLab {
    if (!_contentLab) {
        _contentLab = [UILabel initWithTitle:@"" andFont:AUTO(15) andWeight:1 andTextColor:COLOR_666666 andBackgroundColor:JCClearColor andTextAlignment:NSTextAlignmentCenter];
        _contentLab.numberOfLines = 0;
    }
    return _contentLab;
}

- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor =COLOR_DDDDDD;
    }
    return _lineView;
}

- (UIButton *)sureBtn {
    if (!_sureBtn) {
        _sureBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCBaseColor TextColors:JCWhiteColor];
        [_sureBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        
    }
    return _sureBtn;
}

- (UIButton *)cancelBtn {
    if (!_cancelBtn) {
        _cancelBtn = [UIButton initWithText:@"" FontSize:AUTO(16) Weight:2 BackGroundColor:JCClearColor TextColors:JCBaseColor];
//        [_cancelBtn hg_setAllCornerWithCornerRadius:AUTO(22)];
        _cancelBtn.layer.cornerRadius = AUTO(22);
        _cancelBtn.layer.masksToBounds = YES;
        _cancelBtn.layer.borderColor = JCBaseColor.CGColor;
        _cancelBtn.layer.borderWidth = 1;
        
    }
    return _cancelBtn;
}
@end
