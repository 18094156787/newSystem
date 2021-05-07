//
//  JCGetCodeTextField.m
//  Jingcai
//
//  Created by Rain on 2018/10/15.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCGetCodeTextField.h"

//#import "SmsManager.h"

@interface JCGetCodeTextField () <UITextFieldDelegate>

@end

@implementation JCGetCodeTextField

- (void)awakeFromNib {
    [super awakeFromNib];
//    self.delegate = self;
    _getCodeButton = [[JKCountDownButton alloc] init];
    [_getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    [_getCodeButton setTitleColor:UIColorFromRGB(0x1E82E0) forState:UIControlStateNormal];
    _getCodeButton.contentEdgeInsets = UIEdgeInsetsMake(9.5, 13, 8, 13);
    _getCodeButton.titleLabel.font = [UIFont systemFontOfSize:AUTO(14)];
    _getCodeButton.layer.borderColor = UIColorFromRGB(0x1E82E0).CGColor;
    _getCodeButton.layer.borderWidth = 0.5f;
    _getCodeButton.layer.cornerRadius = 2.5f;
    [_getCodeButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateDisabled];
    
    [_getCodeButton sizeToFit];
    [_getCodeButton addTarget:self action:@selector(getCodeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    self.rightViewMode = UITextFieldViewModeAlways;
    self.rightView = _getCodeButton;
    [_getCodeButton countDownChanging:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
//        countDownButton.layer.borderColor = [UIColor lightGrayColor].CGColor;
        countDownButton.enabled = NO;
        NSString * title = [NSString stringWithFormat:@"剩余%ld秒", second];
        return title;
    }];
    [_getCodeButton countDownFinished:^NSString *(JKCountDownButton *countDownButton, NSUInteger second) {
//        countDownButton.layer.borderColor = UIColorFromRGB(0x1E82E0).CGColor;
        countDownButton.enabled = YES;
        return @"重新获取";
    }];
//    self.delegate= self;
}

- (void)getCodeBtnClick:(UIButton *)sender {
    self.getCodeButton.enabled = NO;
    if (_getCodeClickBlock) {
        _getCodeClickBlock();
    }
}

- (void)startCountDown {
    [_getCodeButton startCountDownWithSecond:60];
}
- (void)stopCountDown {
    [_getCodeButton stopCountDown];
}

- (void)setButtonStyle:(GetCodeButtonStyle)buttonStyle {
    if (buttonStyle == GetCodeButtonStyleRed) {
        //红色按钮#FF0707
        self.getCodeButton.backgroundColor = JCWhiteColor;
        self.getCodeButton.layer.borderColor = JCClearColor.CGColor;
        [self.getCodeButton setTitleColor:JCBaseColor forState:UIControlStateNormal];
        [self.getCodeButton setTitleColor:JCBaseColor forState:UIControlStateDisabled];
    }
}

#pragma mark - UITextFieldDelegate
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return !self.disableEdit;
}

@end
