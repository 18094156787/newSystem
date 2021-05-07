//
//  JCMonitorTextField.m
//  Jingcai
//
//  Created by Rain on 2018/11/14.
//  Copyright © 2018 blockstar. All rights reserved.
//

#import "JCMonitorTextField.h"

@interface JCMonitorTextField ()
@end

@implementation JCMonitorTextField
- (void)awakeFromNib {
    [super awakeFromNib];
    //监听文本输入变化
    [self addTarget:self action:@selector(textFieldChanged:) forControlEvents:UIControlEventEditingChanged];
}
- (void)setLeftPadding:(CGFloat)leftPadding {
    _leftPadding = leftPadding;
    //左间距
    UIView * leftView = [[UIView alloc] init];
    leftView.frame = CGRectMake(0, 0, leftPadding, 0);
    self.leftView = leftView;
    self.leftViewMode = UITextFieldViewModeAlways;
}
- (void)setRightPadding:(CGFloat)rightPadding {
    _rightPadding = rightPadding;
    //右间距
    UIView * rightView = [[UIView alloc] init];
    rightView.frame = CGRectMake(0, 0, rightPadding, 0);
    self.rightView = rightView;
    self.rightViewMode = UITextFieldViewModeAlways;
}
- (void)textFieldChanged:(UITextField *)textField{
    BOOL isEmpty = textField.text.length == 0;
    if (_monitorTextBlock) {
        _monitorTextBlock(isEmpty);
    }
}
@end
